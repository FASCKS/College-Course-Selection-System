package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONObject;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.common.utils.SpringSecurityUtil;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.OrderCourse;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import com.pxx.collegecourseselectionsystem.entity.enums.CourseEnum;
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
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.*;
import java.util.ArrayList;
import java.util.Iterator;
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
    @PreAuthorize("hasAnyAuthority('second:go:course')")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "要抢课课程id"),
            @ApiImplicitParam(name = "state", value = "1 抢课   0  退课"),
            @ApiImplicitParam(name = "planGroupId", value = "组id")
    })
    @GetMapping("/go/course/{id}/{state}/{planGroupId}")
    public R goCourse(@Positive @NotNull @PathVariable("id") Integer secondCourseId,
                      @Max(1) @Min(0) @PositiveOrZero @NotNull @PathVariable("state") Integer state,
                      @NotNull @Positive @PathVariable("planGroupId") Integer planGroupId) {
        //判断是否已经发布
        {
            boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "all:" + planGroupId);
            if (!hasKey) {
                return R.error("未发布抢课计划");
            }
        }
        //检验活动是否开始
        SecondCoursePlanGroupEntity secondCoursePlanGroupEntity = redisUtil.get(Global.KILL_SECOND_COURSE + "plan_group:" + planGroupId);
        Long endTime = Convert.toLong(secondCoursePlanGroupEntity.getEndTime());
        Long startTime = Convert.toLong(secondCoursePlanGroupEntity.getStartTime());
        {
            boolean checkTime = secondCourseService.checkTime(secondCoursePlanGroupEntity);
            if (!checkTime) {
                return R.error("时间未开始或已经结束");
            }
        }
        Long userId = SpringSecurityUtil.getUserId();
        //判断学生是否进行跨组选课
        {
            boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "group:userId_" + userId);
            if (!hasKey) {
                return R.error("非法抢课");
            }
            Integer planGroup = redisUtil.get(Global.KILL_SECOND_COURSE + "group:userId_" + userId);
            if (!planGroup.equals(planGroupId)) {
                return R.error("禁止非法访问");
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
                return R.error("退课失败").put("data", courseSum);
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

            amqpTemplate.convertAndSend("course.kill.syn.mysql", "course.kill.cancel.del.mysql", jsonObject);
            SecondCourseDto secondCourseDto = redisUtil.get(Global.KILL_SECOND_COURSE + "entity:" + secondCourseId + "_" + planGroupId);
            //删除之前抢课成功缓存在临时课程表中的信息
            Integer up_time = secondCourseDto.getUpTime().getCode();
            Integer week = secondCourseDto.getWeek().getCode();
            Integer courseId = secondCourseDto.getCourseId();
            SimpleClassBook simpleClassBook = this.getSimpleClassBook(up_time, week, courseId, secondCourseDto);
            long lRemove = redisUtil.lRemove(Global.KILL_SECOND_COURSE + "class:temp_schedule:" + userId, 0, simpleClassBook);

            if (lRemove == 1) {
                return R.ok("退课成功").put("data", decr);
            }
            return R.ok("退课失败").put("data", decr);
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
            return R.error("课程无空余").put("data", courseSum);
        }
        //判断是否课程冲突
        SecondCourseDto secondCourseDto = redisUtil.get(Global.KILL_SECOND_COURSE + "entity:" + secondCourseId + "_" + planGroupId);
        {
            SimpleClassScheduleVo simpleClassScheduleVo = redisUtil.get(Global.KILL_SECOND_COURSE + "class:schedule:" + userId);
            Integer week = secondCourseDto.getWeek().getCode();
            Integer upTime = secondCourseDto.getUpTime().getCode();
            Integer upTimeTwo = secondCourseDto.getUpTimeTwo().getCode();
            Integer floor = secondCourseDto.getFloor();
            Integer roofNumber = secondCourseDto.getRoofNumber();
            Integer between = secondCourseDto.getBetween();
            //如果课程表不为空才进行课程冲突检测
            if (simpleClassScheduleVo != null) {
                for (SimpleClassBook simpleClassBook : simpleClassScheduleVo.getClassBook()) {
                    //如果时间相同
                    //如果教室相同
                    for (SimpleClassScheduleTime classScheduleTime : simpleClassBook.getClassScheduleTimes()) {
                        if (
                            //判断第几天
                                week.equals(classScheduleTime.getWeek()) && (
                                        //判断第一节
                                        upTime.equals(classScheduleTime.getUpTime()) ||
                                                //判断第二节课是否存在 和 是否和其它课程冲突
                                                upTimeTwo.equals(classScheduleTime.getUpTime())) && (
                                        //判断大楼是否相同
                                        roofNumber.equals(classScheduleTime.getRoofNumber()) &&
                                                //判断楼层是否相同
                                                floor.equals(classScheduleTime.getFloor()) &&
                                                //判断教室是否相同
                                                between.equals(classScheduleTime.getBetween())
                                )) {
                            //如果相等
                            return R.error(StrUtil.format("课程可能在 {}-{}楼 第 {} 层 第 {} 间教室 的 星期 {} 第 {}{} 节课有冲突"
                                    , secondCourseDto.getRoofName()
                                    , secondCourseDto.getRoofNumber()
                                    , secondCourseDto.getFloor()
                                    , secondCourseDto.getBetween()
                                    , secondCourseDto.getWeek().getCode()
                                    , secondCourseDto.getUpTimeNumber()
                                    ,
                                    secondCourseDto.getUpTimeTwoNumber() == 0 ? "" : " " + secondCourseDto.getUpTimeTwoNumber()


                            ));
                        }
                    }
                }
            }
        }
        //递减操作
        long decr = redisUtil.decr(Global.KILL_SECOND_COURSE + "sum:" + secondCourseId, 1);
        if (decr < 0) {
            redisUtil.incr(Global.KILL_SECOND_COURSE + "sum:" + secondCourseId, 1);
            return R.ok("课程无空余").put("data", decr);
        }
        //用户抢课成功   redis标记
        redisUtil.set(Global.KILL_SECOND_COURSE + "_" + userId + "_course:" + secondCourseId, secondCourseId, (endTime - startTime) / 1000 + 60 * 5);
        //异步添加到mysql
        List<OrderCourse> orderCourseList = new ArrayList<>();
        {
            OrderCourse orderCourse = new OrderCourse();
            orderCourse.setSecondCourseId(secondCourseId);
            orderCourse.setUserId(userId);
            orderCourse.setPlanGroupId(planGroupId);
            orderCourse.setCourseId(secondCourseDto.getCourseId());
            orderCourse.setTeacherId(secondCourseDto.getTeacher());
            orderCourse.setUpTime(secondCourseDto.getUpTime().getCode());
            orderCourse.setWeek(secondCourseDto.getWeek().getCode());
            orderCourse.setClassroomId(secondCourseDto.getClassroomId());
            orderCourseList.add(orderCourse);
        }
        {
            //如果有第二节课
            if (secondCourseDto.getUpTimeTwo().getCode() != 0) {
                OrderCourse orderCourse=new OrderCourse();
                BeanUtil.copyProperties(orderCourse,orderCourseList.get(0));
                orderCourseList.add(orderCourse);
            }
        }
        amqpTemplate.convertAndSend("course.kill.syn.mysql", "course.kill.cancel.syn.mysql", orderCourseList);

        //将学生抢到的课表信息放到redis中，让前端可以动态查看
        Integer up_time = secondCourseDto.getUpTime().getCode();
        Integer week = secondCourseDto.getWeek().getCode();
        Integer courseId = secondCourseDto.getCourseId();

        SimpleClassBook simpleClassBook = this.getSimpleClassBook(up_time, week, courseId, secondCourseDto);

        //存放临时课表
        redisUtil.lSet(Global.KILL_SECOND_COURSE + "class:temp_schedule:" + userId, simpleClassBook, (endTime - startTime) / 1000 + 60 * 5);


        return R.ok().put("data", decr);
    }

    @PreAuthorize("hasAnyAuthority('second:plan:list')")
    @ApiImplicitParam(name = "id", value = "分组id")
    @ApiOperation("学生抢课计划列表")
    @GetMapping("/plan/list/{id}")
    public R list(@RequestParam(required = false) CourseEnum courseEnum, @PathVariable("id") @NotNull Integer planGroupId) {

        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "all:" + planGroupId);
        if (!hasKey) {
            return R.ok("未发布抢课计划");
        }
        Long userId = SpringSecurityUtil.getUserId();
        Integer userGroupId = redisUtil.get(Global.KILL_SECOND_COURSE + "group:userId_" + userId);
        if (userGroupId == null || !userGroupId.equals(planGroupId)) {
            return R.error("非法访问");
        }

        List<SecondCourseDto> secondCourseDtos = redisUtil.get(Global.KILL_SECOND_COURSE + "all:" + planGroupId);
        Iterator<SecondCourseDto> iterator = secondCourseDtos.iterator();

        while (iterator.hasNext()) {
            SecondCourseDto secondCourseDto = iterator.next();
            secondCourseDto.setCourseSum(redisUtil.get(Global.KILL_SECOND_COURSE + "sum:" + secondCourseDto.getId()));
            if (courseEnum != null) {
                String describe = secondCourseDto.getType();
                String describe1 = courseEnum.getDescribe();
                if (!describe.contains(describe1)) {
                    iterator.remove();
                }
            }
        }
        return R.ok().put("data", secondCourseDtos);
    }

    /**
     * 详情
     */
    @PreAuthorize("hasAnyAuthority('second:plan:info')")
    @ApiImplicitParam(name = "id", value = "分组id")
    @ApiOperation("学生获取组信息")
    @GetMapping("/info")
    public R info(@RequestParam("id") @NotNull Integer id) {
        SecondCoursePlanGroupEntity secondCoursePlanGroup = redisUtil.get(Global.KILL_SECOND_COURSE + "plan_group:" + id);
        return R.ok().put("data", secondCoursePlanGroup);
    }

    /**
     * 学生抢课入口 获取学生抢课范围组
     */
    @PreAuthorize("hasAnyAuthority('second:plan:entrance')")
    @ApiOperation("学生抢课入口,获取学生抢课组")
    @GetMapping("/entrance")
    public R entrance() {
        Long userId = SpringSecurityUtil.getUserId();
        Integer groupId = redisUtil.get(Global.KILL_SECOND_COURSE + "group:userId_" + userId);
        if (groupId == null) {
            return R.error("当前没有抢课计划");
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.putOpt("date", DateUtil.date());
        jsonObject.putOpt("group", groupId);
        return R.ok().put("data", jsonObject);
    }

    /**
     * 学生当前课表
     */
    @PreAuthorize("hasAnyAuthority('second:get:class:course')")
    @ApiImplicitParam(name = "id", value = "分组id")
    @ApiOperation("学生简单课表")
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
    if (simpleClassScheduleVo == null) {
            return R.ok().put("data",simpleClassScheduleVo);
        }
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
    private SimpleClassBook getSimpleClassBook(Integer up_time, Integer week, Integer courseId, SecondCourseDto secondCourseDto) {


        SimpleClassBook simpleClassBook = new SimpleClassBook();
        simpleClassBook.setState(1);//标记为临时课程
        List<SimpleClassScheduleTime> simpleClassScheduleTimeList = new ArrayList<>();
        simpleClassBook.setCourseId(courseId);

        SimpleClassScheduleTime simpleClassScheduleTime = new SimpleClassScheduleTime();
        simpleClassScheduleTime.setCourseId(courseId);
        simpleClassScheduleTime.setUpTime(up_time);
        simpleClassScheduleTime.setWeek(week);
        simpleClassScheduleTime.setRoofNumber(secondCourseDto.getRoofNumber());
        simpleClassScheduleTime.setFloor(secondCourseDto.getFloor());
        simpleClassScheduleTime.setBetween(secondCourseDto.getBetween());
        //如果是同一节课程
        if (courseId.equals(secondCourseDto.getCourseId())) {
            int code = secondCourseDto.getUpTimeTwo().getCode();
            //表示有第二节课程
            if (code != 0) {
                SimpleClassScheduleTime simpleClassScheduleTimeTwo = new SimpleClassScheduleTime();
                simpleClassScheduleTimeTwo.setCourseId(courseId);
                simpleClassScheduleTimeTwo.setUpTime(code);
                simpleClassScheduleTimeTwo.setWeek(week);
                simpleClassScheduleTimeTwo.setRoofNumber(secondCourseDto.getRoofNumber());
                simpleClassScheduleTimeTwo.setFloor(secondCourseDto.getFloor());
                simpleClassScheduleTimeTwo.setBetween(secondCourseDto.getBetween());
                simpleClassScheduleTimeList.add(simpleClassScheduleTimeTwo);

            }
        }


        simpleClassScheduleTimeList.add(simpleClassScheduleTime);

        simpleClassBook.setClassScheduleTimes(simpleClassScheduleTimeList);
        return simpleClassBook;
    }
}
