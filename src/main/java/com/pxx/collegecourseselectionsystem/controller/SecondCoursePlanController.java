package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.convert.Convert;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.common.validator.group.Insert;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import com.pxx.collegecourseselectionsystem.entity.enums.CourseEnum;
import com.pxx.collegecourseselectionsystem.entity.enums.QueueEnum;
import com.pxx.collegecourseselectionsystem.service.ClassScheduleService;
import com.pxx.collegecourseselectionsystem.service.SecondCoursePlanGroupService;
import com.pxx.collegecourseselectionsystem.service.SecondCourseService;
import com.pxx.collegecourseselectionsystem.util.Global;
import com.pxx.collegecourseselectionsystem.vo.course.SimpleClassScheduleVo;
import io.swagger.annotations.Api;
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
    private static final String courseSum = Global.KILL_SECOND_COURSE + "sum:";

    @ApiOperation("抢课计划列表")
    @GetMapping("/plan/list/{id}")
    public R list(@RequestParam(required = false) CourseEnum courseEnum, @PathVariable("id") @NotNull Integer planGroupId) {

        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "all:" + planGroupId);
        if (!hasKey) {
            return R.ok("当前不是选课时间");
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
/*        List<SecondCourse> secondCourses = secondCourseService.list();
        if (secondCourses.isEmpty()) {
            return R.ok("没有需要发布得课程");
        }
        for (SecondCourse secondCourse : secondCourses) {
            secondCourse.setState(1);
        }
        boolean update = secondCourseService.updateBatchById(secondCourses);
        if (!update) {
            return R.ok("没有需要发布得课程");
        }*/
        //缓存课程
        List<SecondCourseDto> allSecondCourse = secondCourseService.findAllSecondCourse(planGroupId);
        if (allSecondCourse.isEmpty()) {
            return R.ok("没有需要发布的课程计划");
        }
        for (SecondCourseDto secondCours : allSecondCourse) {
            Long endTime = Convert.toLong(secondCours.getEndTime());
            Long stateTime = Convert.toLong(secondCours.getStartTime());
            //缓存库存
            redisUtil.set(Global.KILL_SECOND_COURSE + "sum:" + secondCours.getId(), secondCours.getCourseSum(), (endTime - stateTime) / 1000 + 60 * 4);
            //给延迟队列发送消息
            amqpTemplate.convertAndSend(QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getExchange(), QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getRouteKey(), secondCours.getId(), message -> {
                //给消息设置延迟毫秒值
                //活动结束延迟两分钟
                message.getMessageProperties().setHeader("x-delay", (endTime - stateTime) / 1000 + 60 * 8);
                return message;
            });
        }
        //添加全部
        redisUtil.set(Global.KILL_SECOND_COURSE + "all:" + planGroupId, allSecondCourse);
        //添加单个
        for (SecondCourseDto secondCourseDto : allSecondCourse) {
            redisUtil.set(Global.KILL_SECOND_COURSE + "entity:" + secondCourseDto.getId() + planGroupId, secondCourseDto);
        }
        //缓存学生课程表
        List<SimpleClassScheduleVo> simpleMyClassSchedule = classScheduleService.findSimpleMyClassSchedule();
        for (SimpleClassScheduleVo simpleClassScheduleVo : simpleMyClassSchedule) {
            redisUtil.set(Global.KILL_SECOND_COURSE + "class:schedule:" + simpleClassScheduleVo.getUserId(), simpleClassScheduleVo);
        }
        //缓存课程计划
        SecondCoursePlanGroupEntity secondCoursePlanGroupEntity = secondCoursePlanGroupService.getById(planGroupId);
        redisUtil.set(Global.KILL_SECOND_COURSE + "plan_group:" + planGroupId, secondCoursePlanGroupEntity);


        return R.ok("发布成功");
    }

    /**
     * 添加选课
     */
    @ApiOperation("添加抢课课程")
    @PostMapping("/insert")
    public R insert(@RequestBody @Validated(Insert.class) SecondCourseDto secondCourseDto) {
        if (secondCourseDto.getStartTime().compareTo(secondCourseDto.getEndTime()) <= 0) {
            return R.error("开始时间不能小于结束时间");
        }
        secondCourseDto.setState(0);
        boolean insert = secondCourseService.insertOne(secondCourseDto);
        return R.ok().put("data", insert);
    }

    /**
     * 删除选课
     */
    @ApiOperation("删除抢课课程")
    @PostMapping("/delete")
    public R delete(@NotEmpty @RequestBody List<Integer> course) {
        boolean removeBatchByIds = secondCourseService.removeBatchByIds(course);
        return R.ok().put("data", removeBatchByIds);
    }

    /**
     * 编辑
     */
    @ApiOperation("编辑抢课课程")
    @PostMapping("/update")
    public R update(@RequestBody @Validated SecondCourseDto secondCourseDto) {
        boolean update = secondCourseService.updateById(secondCourseDto);
        return R.ok().put("data", update);
    }

    /**
     * 删除抢课计划
     */
    @ApiOperation("删除抢课计划")
    @GetMapping("/del/{id}")
    public R del(@PathVariable("id") @NotNull Integer planGroupId) {
        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "all:" + planGroupId);
        if (!hasKey) {
            return R.ok("没有课程计划可以删除");
        }
        redisUtil.del(Global.KILL_SECOND_COURSE + "all:" + planGroupId);
        return R.error("删除成功");
    }

}
