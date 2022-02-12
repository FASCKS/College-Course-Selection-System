package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.convert.Convert;
import cn.hutool.json.JSONObject;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.common.utils.SpringSecurityUtil;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
import com.pxx.collegecourseselectionsystem.entity.enums.QueueEnum;
import com.pxx.collegecourseselectionsystem.service.ClassScheduleService;
import com.pxx.collegecourseselectionsystem.service.SecondCourseService;
import com.pxx.collegecourseselectionsystem.util.Global;
import com.pxx.collegecourseselectionsystem.vo.course.SimpleClassBook;
import com.pxx.collegecourseselectionsystem.vo.course.SimpleClassScheduleTime;
import com.pxx.collegecourseselectionsystem.vo.course.SimpleClassScheduleVo;
import io.swagger.annotations.Api;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import java.util.List;

/**
 * @author pxx
 * @Date 2022/2/10 14:49
 */
@Validated
@Api(tags = "抢课")
@RestController
@RequestMapping("/second")
public class SecondCourseController {
    @Autowired
    private SecondCourseService secondCourseService;
    @Autowired
    private ClassScheduleService classScheduleService;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private AmqpTemplate amqpTemplate;
    private static final String courseSum = Global.KILL_SECOND_COURSE + "sum:";

    @PreAuthorize("hasAnyAuthority('ccss:second:list')")
    @GetMapping("/list")
    public R list() {
        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "all");
        if (!hasKey) {
            return R.ok("当前不是选课时间");
        }
        List<SecondCourseDto> secondCourseDtos = redisUtil.get(Global.KILL_SECOND_COURSE + "all");
        for (SecondCourseDto secondCourseDto : secondCourseDtos) {
            secondCourseDto.setCourseSum(redisUtil.get(courseSum + secondCourseDto.getId()));
        }

        return R.ok().put("data", secondCourseDtos);
    }

    /**
     * 抢课链接
     *      1 抢课   0  退课
     * @param secondCourseId
     * @return
     */
    @GetMapping("/go/course/{id}/{state}")
    public R goCourse(@Positive @NotNull @PathVariable("id") Integer secondCourseId,
                      @Positive @NotNull @PathVariable("state") Integer state) {
        Long userId = SpringSecurityUtil.getUserId();
        //如果是退课
        if (state==0){
            //检查学生是否已经抢到课程
            boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + userId + "course" + secondCourseId);
            if (!hasKey){
                return R.error("退课失败");
            }
            //判断库存
            Integer courseSum =(Integer) redisUtil.get(Global.KILL_SECOND_COURSE + "sum:" + secondCourseId);
            if (courseSum<0){
                return R.error("退课失败");
            }
            //递增加一
            long decr = redisUtil.incr(Global.KILL_SECOND_COURSE + "sum:" + secondCourseId, 1);

            //先删除缓存
            amqpTemplate.convertAndSend("course.kill.syn.mysql","course.kill.cancel.del.mysql",message -> {
                //给消息设置延迟毫秒值
                message.getMessageProperties().setHeader("x-delay", 3000);
                return message;
            });
            return R.ok("退课成功");
        }
        //判断是否已经发布
        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "all");
        if (!hasKey) {
            return R.error("未发布抢课计划");
        }

        //检验活动是否开始
        SecondCourseDto secondCourseDto = (SecondCourseDto) redisUtil.get(Global.KILL_SECOND_COURSE + "entity:" + secondCourseId);
        boolean checkTime = secondCourseService.checkTime(secondCourseDto);
        if (!checkTime) {
            return R.error("时间未开始或已经结束");
        }
        //判断是否重复抢购
        {
            Object course = redisUtil.get(Global.KILL_SECOND_COURSE + userId + "course:" + secondCourseId);
            if (course != null) {
                return R.error("重复抢课");
            }
        }
        //判断库存
        Integer courseSum = (Integer) redisUtil.get(Global.KILL_SECOND_COURSE + "sum:" + secondCourseId);
        if (courseSum <= 0) {
            return R.error("课程无空余");
        }
        //判断是否课程冲突
        {
            SimpleClassScheduleVo simpleClassScheduleVo = (SimpleClassScheduleVo) redisUtil.get(Global.KILL_SECOND_COURSE + "class:schedule:" + userId);
            Integer courseId = secondCourseDto.getCourseId();
            Integer week = secondCourseDto.getWeek().getCode();
            Integer upTime = secondCourseDto.getUpTime().getCode();
            //表示没有课程表
            if (simpleClassScheduleVo==null){
                return R.error("课程表为空");
            }
            for (SimpleClassBook simpleClassBook : simpleClassScheduleVo.getClassBook()) {
                //如果课程相同
                if (courseId.equals(simpleClassBook.getCourseId())) {
                    //如果时间相同
                    for (SimpleClassScheduleTime classScheduleTime : simpleClassBook.getClassScheduleTimes()) {
                        if (week.equals(classScheduleTime.getWeek()) && upTime.equals(classScheduleTime.getUpTime())) {
                            //如果相等
                            return R.error("课程冲突");
                        }
                    }
                }
            }
        }
        //递减操作
        long decr = redisUtil.decr(Global.KILL_SECOND_COURSE + "sum:" + secondCourseId, 1);
        //用户抢课成功   redis标记
        redisUtil.set(Global.KILL_SECOND_COURSE + userId + "course:" + secondCourseId, "");
        //异步添加到mysql
        JSONObject jsonObject = new JSONObject();
        jsonObject.putOpt("secondCourseId", secondCourseId);
        jsonObject.putOpt("userID", userId);
        amqpTemplate.convertAndSend("course.kill.syn.mysql", "course.kill.cancel.syn.mysql", jsonObject, message -> {
            //给消息设置延迟毫秒值
            message.getMessageProperties().setHeader("x-delay", 3000);
            return message;
        });

        return R.ok().put("data", true);
    }

    /**
     * 发布抢课内容
     */
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
            redisUtil.set(Global.KILL_SECOND_COURSE + "sum:" + secondCours.getId(), secondCours.getCourseSum(), endTime - stateTime + 60 * 60 * 24);
            //给延迟队列发送消息
            amqpTemplate.convertAndSend(QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getExchange(), QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getRouteKey(), secondCours.getId(), message -> {
                //给消息设置延迟毫秒值
                message.getMessageProperties().setHeader("x-delay", endTime - stateTime + 60 * 60 * 12);
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
    @PostMapping("/delete")
    public R delete(@NotEmpty @RequestBody List<Integer> course) {
        boolean removeBatchByIds = secondCourseService.removeBatchByIds(course);
        return R.ok().put("data", removeBatchByIds);
    }

    /**
     * 编辑
     */
    @PostMapping("/update")
    public R update(@RequestBody @Validated SecondCourseDto secondCourseDto) {
        boolean update = secondCourseService.updateById(secondCourseDto);
        return R.ok().put("data", update);
    }

}
