package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.convert.Convert;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.common.validator.group.Insert;
import com.pxx.collegecourseselectionsystem.common.validator.group.Update;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
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
@Api(tags = "选课管理")
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

    private static final String courseSum = Global.KILL_SECOND_COURSE + "sum:";

    private static final Long SECOND = 1000L;
    private static final Long MINUTE = 60L * SECOND;
    private static final Long HOUR = 60L * 60L * MINUTE;
    private static final Long DAY = 24L * HOUR;
    public static final Long REDIS_EXPIRED = 60L * 10L;
    public static final Long RABBITMQ_EXPIRED = MINUTE * 5;

    @ApiImplicitParam(name = "id", value = "分组id")
    @ApiOperation("抢课计划列表")
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
    @ApiImplicitParam(name = "id", value = "分组id")
    @ApiOperation("发布抢课计划")
    @GetMapping("/put/{id}")
    public R put(@PathVariable("id") @NotNull Integer planGroupId) {
        //判断是否已经发布
        {
            boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "all:" + planGroupId);
            if (hasKey) {
                return R.ok("抢课计划已经发布.");
            }
        }
        //缓存课程
        List<SecondCourseDto> allSecondCourse = secondCourseService.findAllSecondCourse(planGroupId);
        if (allSecondCourse.isEmpty()) {
            return R.ok("没有需要发布的课程计划");
        }
        //缓存课程计划
        SecondCoursePlanGroupEntity secondCoursePlanGroupEntity = secondCoursePlanGroupService.getById(planGroupId);
        Long endTime = Convert.toLong(secondCoursePlanGroupEntity.getEndTime());
        Long stateTime = Convert.toLong(secondCoursePlanGroupEntity.getStartTime());

        redisUtil.set(Global.KILL_SECOND_COURSE + "plan_group:" + planGroupId, secondCoursePlanGroupEntity, (endTime - stateTime) / 1000 + REDIS_EXPIRED);
        for (SecondCourseDto secondCours : allSecondCourse) {
            //缓存库存
            redisUtil.set(Global.KILL_SECOND_COURSE + "sum:" + secondCours.getId(), secondCours.getCourseSum(), (endTime - stateTime) / 1000 + REDIS_EXPIRED);
            //给延迟队列发送消息
            amqpTemplate.convertAndSend(QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getExchange(), QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getRouteKey(),
                    secondCours.getId(),
                    message -> {
                        message.getMessageProperties().setHeader("x-delay", (endTime - stateTime) + RABBITMQ_EXPIRED);
                        return message;
                    });
        }

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
                        message.getMessageProperties().setHeader("x-delay", (endTime - stateTime) + RABBITMQ_EXPIRED);
                        return message;
                    });
        }
        //缓存该分组下可以抢课得学生
        List<Integer> unitId = secondCoursePlanGroupService.findUnitIdByPlanGroupId(planGroupId);
        List<SysUserEntity> sysUserEntityList = sysUserService.findUserByUnitId(unitId);
        for (SysUserEntity sysUserEntity : sysUserEntityList) {
            redisUtil.set(Global.KILL_SECOND_COURSE + "group:userId_" + sysUserEntity.getUserId(), planGroupId, (endTime - stateTime) / 1000 + REDIS_EXPIRED);
        }
        return R.ok("发布成功");
    }

    /**
     * 添加选课
     */
    @ApiOperation("添加抢课课程")
    @PostMapping("/insert")
    public R insert(@RequestBody @Validated(Insert.class) SecondCourseDto secondCourseDto) {
        secondCourseDto.setState(0);
        boolean insert = secondCourseService.insertOne(secondCourseDto);
        return R.ok().put("data", insert);
    }

    /**
     * 删除选课
     */
    @ApiImplicitParam(name = "groupId", value = "要删除的分组id")
    @ApiOperation("删除抢课课程")
    @PostMapping("/delete{groupId}")
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
    @ApiOperation("编辑抢课课程")
    @PostMapping("/update")
    public R update(@RequestBody @Validated(Update.class) SecondCourseDto secondCourseDto) {
        Integer planGroupId = secondCourseDto.getPlanGroupId();
        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + secondCourseDto.getId() + "_" + planGroupId);
        if (hasKey) {
            return R.error("课程正在进行中,无法编辑.");
        }
        boolean update = secondCourseService.updateById(secondCourseDto);
        return R.ok().put("data", update);
    }


}
