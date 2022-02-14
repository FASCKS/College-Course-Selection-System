package com.pxx.collegecourseselectionsystem.mq;

import cn.hutool.json.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.entity.ClassSchedule;
import com.pxx.collegecourseselectionsystem.entity.OrderCourse;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
import com.pxx.collegecourseselectionsystem.service.ClassScheduleService;
import com.pxx.collegecourseselectionsystem.service.OrderCourseService;
import com.pxx.collegecourseselectionsystem.service.SecondCourseService;
import com.pxx.collegecourseselectionsystem.util.Global;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/2/11 17:20
 * 将redis中得信息同步到mysql中
 */
@Slf4j
@Component
public class SynCourseSum {

    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private SecondCourseService secondCourseService;
    @Autowired
    private OrderCourseService orderCourseService;
    @Autowired
    private ClassScheduleService classScheduleService;

    /**
     * 同步redis数据
     *
     * @param secondCourseId
     */
    @RabbitListener(queues = "mall.order.cancel.plugin")
    @RabbitHandler
    public void handle(Integer secondCourseId) {
        SecondCourse secondCourse = new SecondCourse();
        secondCourse.setId(secondCourseId);
        secondCourse.setCourseSum(redisUtil.get(Global.KILL_SECOND_COURSE +"sum:"+ secondCourseId));
        boolean updateBatchById = secondCourseService.updateById(secondCourse);
        //获取临时表中的数据添加进课程表中
        List<ClassSchedule> classSchedule = secondCourseService.findAllOrderCourseAndSecondCourseData();
        boolean saveBatch = classScheduleService.saveBatch(classSchedule);

        orderCourseService.deleteAll();
        //删除redis选课相关缓存
        redisUtil.del(Global.KILL_SECOND_COURSE+"*");
        log.info("redis库存同步mysql---->{},同步课程表----->{}", updateBatchById, saveBatch);

        //
    }

    /**
     * 增加订单
     */
    @RabbitListener(queues = "course.kill.cancel.syn.mysql")
    @RabbitHandler
    public void sysHandle(JSONObject jsonObject) {
        Long userId = (Long) jsonObject.get("userID");
        Integer secondCourseId = (Integer) jsonObject.get("secondCourseId");
        OrderCourse orderCourse = new OrderCourse();
        orderCourse.setUserId(userId);
        orderCourse.setSecondCourseId(secondCourseId);
        orderCourseService.save(orderCourse);
        log.info("同步订单");
    }

    /**
     * 删除订单
     */
    @RabbitListener(queues = "course.kill.cancel.del.mysql")
    @RabbitHandler
    public void delHandle(JSONObject jsonObject) {
        Long userId = (Long) jsonObject.get("userID");
        Integer secondCourseId = (Integer) jsonObject.get("secondCourseId");
        QueryWrapper<OrderCourse> orderCourseQueryWrapper = new QueryWrapper<>();
        orderCourseQueryWrapper.eq(OrderCourse.COL_USER_ID, userId).eq(OrderCourse.COL_SECOND_COURSE_ID, secondCourseId);
        boolean removeById = orderCourseService.remove(orderCourseQueryWrapper);
        log.info("退课成功---》{}", removeById);
    }

}