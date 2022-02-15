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
import java.util.ArrayList;
import java.util.List;

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
            boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "all:" + planGroupId);
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
            boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "_" + userId + "_course:" + secondCourseId);
            if (!hasKey) {
                return R.error("无可课程可退");
            }
            //判断库存
            Integer courseSum = redisUtil.get(Global.KILL_SECOND_COURSE + "sum:" + secondCourseId);
            if (courseSum < 0) {
                return R.error("退课失败");
            }
            //递增加一
            long decr = redisUtil.incr(Global.KILL_SECOND_COURSE + "sum:" + secondCourseId, 1);
            //先删除缓存
            redisUtil.del(Global.KILL_SECOND_COURSE + "_" + userId + "_course:" + secondCourseId);
            //同步数据库
            JSONObject jsonObject = new JSONObject();
            jsonObject.putOpt("secondCourseId", secondCourseId);
            jsonObject.putOpt("userID", userId);
            jsonObject.putOpt("planGroupId", planGroupId);
            amqpTemplate.convertAndSend("course.kill.syn.mysql", "course.kill.cancel.del.mysql", jsonObject, message -> {
                //给消息设置延迟毫秒值
                message.getMessageProperties().setHeader("x-delay", 3000);
                return message;
            });
            SecondCourseDto secondCourseDto = redisUtil.get(Global.KILL_SECOND_COURSE + "entity:" + secondCourseId + "_" + planGroupId);
            //删除之前抢课成功缓存在临时课程表中的信息
            Integer up_time = secondCourseDto.getUpTime().getCode();
            Integer week = secondCourseDto.getWeek().getCode();
            Integer courseId = secondCourseDto.getCourseId();
            SimpleClassBook simpleClassBook = this.getSimpleClassBook(up_time, week, courseId);
            long lRemove = redisUtil.lRemove(Global.KILL_SECOND_COURSE + "class:temp_schedule:" + userId, 0, simpleClassBook);

            if (lRemove == 1) {
                return R.ok("退课成功");
            }
            return R.ok("退课失败");
        }
        //判断是否重复抢购
        {
            Object course = redisUtil.get(Global.KILL_SECOND_COURSE + "_" + userId + "_course:" + secondCourseId);
            if (course != null) {
                return R.error("重复抢课");
            }
        }
        //判断库存
        Integer courseSum = (Integer) redisUtil.get(Global.KILL_SECOND_COURSE + "sum:" + secondCourseId);
        if (courseSum == null || courseSum <= 0) {
            return R.error("课程无空余");
        }
        //判断是否课程冲突
        SecondCourseDto secondCourseDto =  redisUtil.get(Global.KILL_SECOND_COURSE + "entity:" + secondCourseId + "_" + planGroupId);
        {
            SimpleClassScheduleVo simpleClassScheduleVo = redisUtil.get(Global.KILL_SECOND_COURSE + "class:schedule:" + userId);
            Integer week = secondCourseDto.getWeek().getCode();
            Integer upTime = secondCourseDto.getUpTime().getCode();
            //如果课程表不为空才进行课程冲突检测
            if (simpleClassScheduleVo != null) {
                for (SimpleClassBook simpleClassBook : simpleClassScheduleVo.getClassBook()) {
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
        if (decr < 0) {
            redisUtil.incr(Global.KILL_SECOND_COURSE + "sum:" + secondCourseId, 1);
            return R.ok("课程已经被抢完了.");
        }
        //用户抢课成功   redis标记
        redisUtil.set(Global.KILL_SECOND_COURSE + "_" + userId + "_course:" + secondCourseId, secondCourseId);
        //异步添加到mysql
        JSONObject jsonObject = new JSONObject();
        jsonObject.putOpt("secondCourseId", secondCourseId);
        jsonObject.putOpt("userID", userId);
        jsonObject.putOpt("planGroupId", planGroupId);
        amqpTemplate.convertAndSend("course.kill.syn.mysql", "course.kill.cancel.syn.mysql", jsonObject, message -> {
            //给消息设置延迟毫秒值
            message.getMessageProperties().setHeader("x-delay", 3000);
            return message;
        });
        //将学生抢到的课表信息放到redis中，让前端可以动态查看
        Integer up_time = secondCourseDto.getUpTime().getCode();
        Integer week = secondCourseDto.getWeek().getCode();
        Integer courseId = secondCourseDto.getCourseId();
        SimpleClassBook simpleClassBook = this.getSimpleClassBook(up_time, week, courseId);

        //存放临时课表
        redisUtil.lSet(Global.KILL_SECOND_COURSE + "class:temp_schedule:" + userId, simpleClassBook);

        return R.ok().put("data", true);
    }


    /**
     * 学生当前课表
     */
    @ApiImplicitParam(name = "id", value = "分组id")
    @ApiOperation("学生当前简单课表")
    @GetMapping("/get/class/course/{id}")
    public R getClassCourse(@PathVariable("id") Integer planGroupId) {
        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "all:" + planGroupId);
        if (!hasKey) {
            return R.error("当前不是抢课时间");
        }
        Long userId = SpringSecurityUtil.getUserId();
        //临时课程表
        List<Object> classBookList = redisUtil.lGet(Global.KILL_SECOND_COURSE + "class:temp_schedule:" + userId, 0, -1);
        //学生当前课程表
        SimpleClassScheduleVo simpleClassScheduleVo = redisUtil.get(Global.KILL_SECOND_COURSE + "class:schedule:" + userId);
        List<SimpleClassBook> classBook = simpleClassScheduleVo.getClassBook();
        if (classBook != null) {
            for (Object objectClassBook : classBookList) {
                SimpleClassBook simpleClassBook = (SimpleClassBook) objectClassBook;
                simpleClassBook.setState(1);
                classBook.add(simpleClassBook);
            }
        }

        return R.ok().put("data", simpleClassScheduleVo);
    }

    /**
     * 获取SimpleClassBook
     */
    private SimpleClassBook getSimpleClassBook(Integer up_time, Integer week, Integer courseId) {
        SimpleClassBook simpleClassBook = new SimpleClassBook();

        simpleClassBook.setCourseId(courseId);

        SimpleClassScheduleTime simpleClassScheduleTime = new SimpleClassScheduleTime();
        simpleClassScheduleTime.setCourseId(courseId);
        simpleClassScheduleTime.setUpTime(up_time);
        simpleClassScheduleTime.setWeek(week);

        List<SimpleClassScheduleTime> simpleClassScheduleTimeList = new ArrayList<>();
        simpleClassScheduleTimeList.add(simpleClassScheduleTime);

        simpleClassBook.setClassScheduleTimes(simpleClassScheduleTimeList);
        return simpleClassBook;
    }
}
