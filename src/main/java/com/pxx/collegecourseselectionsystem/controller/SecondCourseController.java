package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.convert.Convert;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.common.utils.SpringSecurityUtil;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.OrderCourse;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
import com.pxx.collegecourseselectionsystem.entity.enums.QueueEnum;
import com.pxx.collegecourseselectionsystem.service.ClassScheduleService;
import com.pxx.collegecourseselectionsystem.service.OrderCourseService;
import com.pxx.collegecourseselectionsystem.service.SecondCourseService;
import com.pxx.collegecourseselectionsystem.util.Global;
import io.swagger.annotations.Api;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
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
    private OrderCourseService orderCourseService;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private ClassScheduleService classScheduleService;
    @Autowired
    private AmqpTemplate amqpTemplate;

    @PreAuthorize("hasAnyAuthority('ccss:second:list')")
    @GetMapping("/list")
    public List<SecondCourseDto> list() {
        return secondCourseService.findAllSecondCourse();
    }

    /**
     * 抢课链接
     *
     * @param secondCourseId
     * @return
     */
    @GetMapping("/go/course/{id}")
    public R goCourse(@PathVariable("id") Integer secondCourseId) {

        boolean checkTime = secondCourseService.checkTime(secondCourseId);
        if (!checkTime) {
            return R.error("时间未开始或已经结束");
        }
        //判断库存
        Integer courseSum = (Integer) redisUtil.get(Global.KILL_SECOND_COURSE + secondCourseId);
        if (courseSum <= 0) {
            return R.ok("课程无空余");
        }
        //更新到数据库
        Long userId = SpringSecurityUtil.getUserId();
        OrderCourse orderCourse = new OrderCourse();
        orderCourse.setSecondCourseId(secondCourseId);
        orderCourse.setUserId(userId);
        boolean insertOne = orderCourseService.save(orderCourse);

        long decr = redisUtil.decr(Global.KILL_SECOND_COURSE + secondCourseId, 1);

        return R.ok().put("data", insertOne);
    }

    /**
     * 发布抢课内容
     */
    @GetMapping("/put")
    public R put() {
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
        //缓存到redis

        for (SecondCourse secondCours : secondCourses) {
            Long endTime = Convert.toLong(secondCours.getEndTime());
            Long stateTime = Convert.toLong(secondCours.getStartTime());
            redisUtil.set(Global.KILL_SECOND_COURSE + secondCours.getId(), secondCours.getCourseSum(), endTime - stateTime);
        }

        //给延迟队列发送消息
        amqpTemplate.convertAndSend(QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getExchange(), QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getRouteKey(), 11L, message -> {
            //给消息设置延迟毫秒值
            message.getMessageProperties().setHeader("x-delay",30000);
            return message;
        });
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
