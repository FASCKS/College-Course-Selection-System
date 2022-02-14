package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.convert.Convert;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
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
import java.util.Iterator;
import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/2/14 10:26
 */
@Api(tags = "抢课计划")
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
    @GetMapping("/plan/list")
    public R list(@RequestParam(required = false) CourseEnum courseEnum) {

        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "all");
        if (!hasKey) {
            return R.ok("当前不是选课时间");
        }
        List<SecondCourseDto> secondCourseDtos = redisUtil.get(Global.KILL_SECOND_COURSE + "all");
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
    @GetMapping("/put")
    public R put() {
        //判断是否已经发布
        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "all");
        if (hasKey) {
            return R.ok("抢课计划已经发布。");
        }
        List<SecondCourse> secondCourses = secondCourseService.list();
        if (secondCourses.isEmpty()) {
            return R.ok("没有需要发布得课程");
        }
        for (SecondCourse secondCourse : secondCourses) {
            secondCourse.setState(1);
        }
        boolean update = secondCourseService.updateBatchById(secondCourses);
        if (!update) {
            return R.ok("没有需要发布得课程");
        }

        for (SecondCourse secondCours : secondCourses) {
            Long endTime = Convert.toLong(secondCours.getEndTime());
            Long stateTime = Convert.toLong(secondCours.getStartTime());
            //缓存库存
            redisUtil.set(Global.KILL_SECOND_COURSE + "sum:" + secondCours.getId(), secondCours.getCourseSum(), endTime - stateTime + 60 * 4);
            //给延迟队列发送消息
            amqpTemplate.convertAndSend(QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getExchange(), QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getRouteKey(), secondCours.getId(), message -> {
                //给消息设置延迟毫秒值
                message.getMessageProperties().setHeader("x-delay", endTime - stateTime + 60 * 2);
                return message;
            });
        }
        //缓存课程
        List<SecondCourseDto> allSecondCourse = secondCourseService.findAllSecondCourse();
        //添加全部
        redisUtil.set(Global.KILL_SECOND_COURSE + "all", allSecondCourse);
        //添加单个
        for (SecondCourseDto secondCourseDto : allSecondCourse) {
            redisUtil.set(Global.KILL_SECOND_COURSE + "entity:" + secondCourseDto.getId(), secondCourseDto);
        }
        //缓存学生课程表
        List<SimpleClassScheduleVo> simpleMyClassSchedule = classScheduleService.findSimpleMyClassSchedule();
        for (SimpleClassScheduleVo simpleClassScheduleVo : simpleMyClassSchedule) {
            redisUtil.set(Global.KILL_SECOND_COURSE + "class:schedule:" + simpleClassScheduleVo.getUserId(), simpleClassScheduleVo);
        }
        return R.ok().put("data", update);
    }

    /**
     * 添加选课
     */
    @ApiOperation("添加抢课课程")
    @PostMapping("/insert")
    public R insert(@RequestBody @Validated SecondCourseDto secondCourseDto) {
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
}
