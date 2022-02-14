package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.json.JSONObject;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.common.utils.SpringSecurityUtil;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import com.pxx.collegecourseselectionsystem.service.SecondCourseService;
import com.pxx.collegecourseselectionsystem.util.Global;
import com.pxx.collegecourseselectionsystem.vo.course.SimpleClassBook;
import com.pxx.collegecourseselectionsystem.vo.course.SimpleClassScheduleTime;
import com.pxx.collegecourseselectionsystem.vo.course.SimpleClassScheduleVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import javax.validation.constraints.PositiveOrZero;

/**
 * @author pxx
 * @Date 2022/2/10 14:49
 */
@Validated
@Api(tags = "自主选课")
@RestController
@RequestMapping("/second")
public class SecondCourseController {
    @Autowired
    private SecondCourseService secondCourseService;

    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private AmqpTemplate amqpTemplate;
    /**
     * 抢课链接
     * 1 抢课   0  退课
     *
     * @param secondCourseId
     * @return
     */
    @ApiOperation("抢课接口")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "要抢课课程id"),
            @ApiImplicitParam(name = "state", value = "1 抢课   0  退课"),
            @ApiImplicitParam(name = "planGroupId", value = "组id")
    })
    @GetMapping("/go/course/{id}/{state}/{planGroupId}")
    public R goCourse(@Positive @NotNull @PathVariable("id") Integer secondCourseId,
                      @PositiveOrZero @NotNull @PathVariable("state") Integer state,
                      @NotNull @PathVariable("planGroupId") Integer planGroupId) {
        Long userId = SpringSecurityUtil.getUserId();
        //判断是否已经发布
        {
            boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "all:"+planGroupId);
            if (!hasKey) {
                return R.error("未发布抢课计划");
            }
        }
        //检验活动是否开始
        {
            SecondCoursePlanGroupEntity secondCoursePlanGroupEntity = redisUtil.get(Global.KILL_SECOND_COURSE + "plan_group:" + planGroupId);
            boolean checkTime = secondCourseService.checkTime(secondCoursePlanGroupEntity);
            if (!checkTime) {
                return R.error("时间未开始或已经结束");
            }
        }
        //如果是退课
        if (state == 0) {
            //检查学生是否已经抢到课程
            boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + userId + "course:" + secondCourseId);
            if (!hasKey) {
                return R.error("无可课程可退");
            }
            //判断库存
            Integer courseSum = (Integer) redisUtil.get(Global.KILL_SECOND_COURSE + "sum:" + secondCourseId);
            if (courseSum < 0) {
                return R.error("退课失败");
            }
            //递增加一
            long decr = redisUtil.incr(Global.KILL_SECOND_COURSE + "sum:" + secondCourseId, 1);
            //先删除缓存
            redisUtil.del(Global.KILL_SECOND_COURSE + userId + "course:" + secondCourseId);
            //同步数据库
            JSONObject jsonObject = new JSONObject();
            jsonObject.putOpt("secondCourseId", secondCourseId);
            jsonObject.putOpt("userID", userId);
            amqpTemplate.convertAndSend("course.kill.syn.mysql", "course.kill.cancel.del.mysql", jsonObject, message -> {
                //给消息设置延迟毫秒值
                message.getMessageProperties().setHeader("x-delay", 3000);
                return message;
            });
            return R.ok("退课成功");
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
            SecondCourseDto secondCourseDto = (SecondCourseDto) redisUtil.get(Global.KILL_SECOND_COURSE + "entity:" + secondCourseId+planGroupId);
            SimpleClassScheduleVo simpleClassScheduleVo = (SimpleClassScheduleVo) redisUtil.get(Global.KILL_SECOND_COURSE + "class:schedule:" + userId);
            Integer courseId = secondCourseDto.getCourseId();
            Integer week = secondCourseDto.getWeek().getCode();
            Integer upTime = secondCourseDto.getUpTime().getCode();
            //表示没有课程表
            if (simpleClassScheduleVo == null) {
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
     * 学生当前课表
     */
    @ApiOperation("学生当前课表")
    @GetMapping("/get/class/course")
    public R getClassCourse() {
        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "all");
        if (!hasKey){
            return R.error("当前不是抢课时间");
        }

        Long userId = SpringSecurityUtil.getUserId();
        return R.ok();
    }






}
