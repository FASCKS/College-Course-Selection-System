package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.common.validator.group.Insert;
import com.pxx.collegecourseselectionsystem.common.validator.group.Update;
import com.pxx.collegecourseselectionsystem.config.MyPropertiesConfig;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import com.pxx.collegecourseselectionsystem.entity.enums.CourseEnum;
import com.pxx.collegecourseselectionsystem.entity.enums.QueueEnum;
import com.pxx.collegecourseselectionsystem.service.ClassScheduleService;
import com.pxx.collegecourseselectionsystem.service.SecondCoursePlanGroupService;
import com.pxx.collegecourseselectionsystem.service.SecondCourseService;
import com.pxx.collegecourseselectionsystem.service.SysUserService;
import com.pxx.collegecourseselectionsystem.util.Global;
import com.pxx.collegecourseselectionsystem.vo.course.SimpleClassScheduleVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Iterator;
import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/2/14 10:26
 */
@Api(tags = "计划管理")
@RestController
@Validated
@RequestMapping("/plan")
public class SecondCoursePlanController {
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private AmqpTemplate amqpTemplate;
    @Autowired
    private ClassScheduleService classScheduleService;
    @Autowired
    private SecondCoursePlanGroupService secondCoursePlanGroupService;
    @Autowired
    private SecondCourseService secondCourseService;
    @Autowired
    private SysUserService sysUserService;

    private final String courseSum = Global.KILL_SECOND_COURSE + "sum:";

    private final Long SECOND = 1000L;
    private final Long MINUTE = 60L * SECOND;
    private final Long HOUR = 60L * 60L * MINUTE;
    private final Long DAY = 24L * HOUR;
    private Long REDIS_EXPIRED = 60L;
    private Long RABBITMQ_EXPIRED = MINUTE;

    @Autowired
    public void setMyPropertiesConfig(MyPropertiesConfig myPropertiesConfig) {
        this.REDIS_EXPIRED = 60 * myPropertiesConfig.getRedisMinute();
        this.RABBITMQ_EXPIRED = 60L * 1000L * myPropertiesConfig.getRabbitmqMinute();
    }

    @ApiImplicitParam(name = "id", value = "分组id")
    @ApiOperation("管理员计划列表")
    @PreAuthorize("hasAnyAuthority('plan:plan:list')")
    @GetMapping("/plan/list/{id}")
    public R list(@RequestParam(required = false) CourseEnum courseEnum, @PathVariable("id") @NotNull Integer planGroupId) {

        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "all:" + planGroupId);
        if (!hasKey) {
            return R.ok("未发布抢课计划");
        }
        List<SecondCourseDto> secondCourseDtos = redisUtil.get(Global.KILL_SECOND_COURSE + "all:" + planGroupId);
        Iterator<SecondCourseDto> iterator = secondCourseDtos.iterator();

        while (iterator.hasNext()) {
            SecondCourseDto secondCourseDto = iterator.next();
            secondCourseDto.setCourseSum(redisUtil.get(courseSum + secondCourseDto.getId()));
            if (courseEnum != null) {
                String describe = secondCourseDto.getType().getDescribe();
                String describe1 = courseEnum.getDescribe();
                if (!describe.contains(describe1)) {
                    iterator.remove();
                }
            }
        }
        return R.ok().put("data", secondCourseDtos);
    }

    /**
     * 发布抢课内容
     */
    @PreAuthorize("hasAnyAuthority('plan:plan:put')")
    @ApiImplicitParam(name = "id", value = "分组id")
    @ApiOperation("发布计划")
    @GetMapping("/put/{id}")
    public R put(@PathVariable("id") @NotNull Integer planGroupId) {
        //判断是否已经发布
        {
            boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "all:" + planGroupId);
            if (hasKey) {
                return R.error("抢课计划已经发布.");
            }
        }
        //缓存课程
        List<SecondCourseDto> allSecondCourse = secondCourseService.findAllSecondCourse(planGroupId);
        if (allSecondCourse.isEmpty()) {
            return R.error("没有需要发布的课程计划");
        }
        //缓存课程计划
        SecondCoursePlanGroupEntity secondCoursePlanGroupEntity = secondCoursePlanGroupService.getById(planGroupId);
        secondCoursePlanGroupEntity.setReleaseState(1);
        Long endTime = Convert.toLong(secondCoursePlanGroupEntity.getEndTime());
        Long stateTime = Convert.toLong(secondCoursePlanGroupEntity.getStartTime());

        redisUtil.set(Global.KILL_SECOND_COURSE + "plan_group:" + planGroupId, secondCoursePlanGroupEntity, (endTime - stateTime) / 1000 + REDIS_EXPIRED);
        for (SecondCourseDto secondCours : allSecondCourse) {
            //缓存库存
            redisUtil.set(Global.KILL_SECOND_COURSE + "sum:" + secondCours.getId(), secondCours.getCourseSum(), (endTime - stateTime) / 1000 + REDIS_EXPIRED);

        }
        //给延迟队列发送消息
        amqpTemplate.convertAndSend(QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getExchange(), QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getRouteKey(),
                planGroupId,
                message -> {
                    message.getMessageProperties().setHeader("x-delay", Convert.toInt((endTime - stateTime) + RABBITMQ_EXPIRED));
                    return message;
                });
        //添加全部
        redisUtil.set(Global.KILL_SECOND_COURSE + "all:" + planGroupId, allSecondCourse, (endTime - stateTime) / 1000 + REDIS_EXPIRED);
        //添加单个
        for (SecondCourseDto secondCourseDto : allSecondCourse) {
            redisUtil.set(Global.KILL_SECOND_COURSE + "entity:" + secondCourseDto.getId() + "_" + planGroupId, secondCourseDto, (endTime - stateTime) / 1000 + REDIS_EXPIRED);
        }
        //缓存学生课程表
        List<SimpleClassScheduleVo> simpleMyClassSchedule = classScheduleService.findSimpleMyClassSchedule();
        for (SimpleClassScheduleVo simpleClassScheduleVo : simpleMyClassSchedule) {
            redisUtil.set(Global.KILL_SECOND_COURSE + "class:schedule:" + simpleClassScheduleVo.getUserId(), simpleClassScheduleVo, (endTime - stateTime) / 1000 + REDIS_EXPIRED);
            //活动结束几分钟后删除和该用户相关的缓存
            amqpTemplate.convertAndSend(QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getExchange(), "mall.order.cancel.plugin.del.redis.key",
                    simpleClassScheduleVo.getUserId(),
                    message -> {
                        message.getMessageProperties().setHeader("x-delay", Convert.toInt((endTime - stateTime) + RABBITMQ_EXPIRED));
                        return message;
                    });
        }
        //缓存该分组下可以抢课得学生
        List<Integer> unitId = secondCoursePlanGroupService.findUnitIdByPlanGroupId(planGroupId);
        List<SysUserEntity> sysUserEntityList = sysUserService.findUserByUnitId(unitId);
        for (SysUserEntity sysUserEntity : sysUserEntityList) {
            redisUtil.set(Global.KILL_SECOND_COURSE + "group:userId_" + sysUserEntity.getUserId(), planGroupId, (endTime - stateTime) / 1000 + REDIS_EXPIRED);
        }
        //将计划修改为发布状态
        secondCoursePlanGroupService.updateById(secondCoursePlanGroupEntity);
        return R.ok("发布成功");
    }

    /**
     * 添加选课
     */
    @PreAuthorize("hasAnyAuthority('plan:plan:insert')")
    @ApiOperation("添加抢课课程")
    @PostMapping("/insert")
    public R insert(@RequestBody @Validated(Insert.class) SecondCourseDto secondCourseDto) {
        secondCourseDto.setState(0);
        //判断是否冲突
        boolean courseCheck = courseCheck(secondCourseDto);
        if (!courseCheck) {
            return R.error(StrUtil.format("课程可能在 {}-{}楼 第 {} 层 第 {} 间教室 的 星期 {} 第 {} {} 节课有冲突"
                    , secondCourseDto.getRoofName()
                    , secondCourseDto.getRoofNumber()
                    , secondCourseDto.getFloor()
                    , secondCourseDto.getBetween()
                    , secondCourseDto.getWeek().getCode()
                    , secondCourseDto.getUpTimeNumber()
                    , secondCourseDto.getUpTimeTwoNumber()));
        }
        boolean insert = secondCourseService.insertOne(secondCourseDto);
        return R.ok().put("data", insert);
    }

    /**
     * 删除选课
     */
    @PreAuthorize("hasAnyAuthority('plan:plan:delete')")
    @ApiImplicitParam(name = "groupId", value = "要删除的分组id")
    @ApiOperation("删除抢课课程")
    @PostMapping("/delete/{groupId}")
    public R delete(@NotEmpty @RequestBody List<Integer> course, @NotNull @PathVariable("groupId") Integer groupId) {
        for (Integer secondCourseId : course) {
            boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "entity:" + secondCourseId + "_" + groupId);
            if (hasKey) {
                return R.error("课程正在进行中,无法删除.");
            }
        }
        boolean removeBatchByIds = secondCourseService.removeBatchByIds(course);
        return R.ok().put("data", removeBatchByIds);
    }

    /**
     * 编辑
     */
    @PreAuthorize("hasAnyAuthority('plan:plan:update')")
    @ApiOperation("编辑抢课课程")
    @PostMapping("/update")
    public R update(@RequestBody @Validated(Update.class) SecondCourseDto secondCourseDto) {
        Integer planGroupId = secondCourseDto.getPlanGroupId();
        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "entity:" + secondCourseDto.getId() + "_" + planGroupId);
        if (hasKey) {
            return R.error("课程正在进行中,无法编辑.");
        }
        //判断是否冲突
        boolean courseCheck = courseCheck(secondCourseDto);
        if (!courseCheck) {
            return R.error(StrUtil.format("课程可能在 {}-{}楼 第 {} 层 第 {} 间教室 的 星期 {} 第 {} {} 节课有冲突"
                    , secondCourseDto.getRoofName()
                    , secondCourseDto.getRoofNumber()
                    , secondCourseDto.getFloor()
                    , secondCourseDto.getBetween()
                    , secondCourseDto.getWeek().getCode()
                    , secondCourseDto.getUpTimeNumber()
                    , secondCourseDto.getUpTimeTwoNumber()));
        }
        SecondCourse secondCourse = new SecondCourse();
        BeanUtil.copyProperties(secondCourseDto, secondCourse);
        boolean update = secondCourseService.updateById(secondCourse);
        return R.ok().put("data", update);
    }

    /**
     * 检测是否课程冲突
     */
    private boolean courseCheck(SecondCourseDto secondCourseDto) {

        QueryWrapper<SecondCourse> sq = new QueryWrapper<>();
        sq.eq(SecondCourseDto.COL_UP_TIME, secondCourseDto.getUpTime())//检查是否上课时间冲突
                .eq(SecondCourseDto.COL_WEEK, secondCourseDto.getWeek())//检查星期几
//                .eq("plan_group_id", secondCourseDto.getPlanGroupId())//检查是不是一个分组
                .eq("classroom_id", secondCourseDto.getClassroomId())//检查是不是一个教室
                .notIn("id", secondCourseDto.getId());
        BaseMapper<SecondCourse> baseMapper = secondCourseService.getBaseMapper();
        SecondCourse secondCourse = baseMapper.selectOne(sq);

        if (secondCourse != null) {
            return false;
        }

        return true;
    }
}
