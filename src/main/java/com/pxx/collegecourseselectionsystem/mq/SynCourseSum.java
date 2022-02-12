package com.pxx.collegecourseselectionsystem.mq;

import cn.hutool.json.JSONObject;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.entity.OrderCourse;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
import com.pxx.collegecourseselectionsystem.service.OrderCourseService;
import com.pxx.collegecourseselectionsystem.service.SecondCourseService;
import com.pxx.collegecourseselectionsystem.util.Global;
import com.rabbitmq.client.Channel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
        secondCourse.setCourseSum(redisUtil.get(Global.KILL_SECOND_COURSE + secondCourseId));
        boolean updateBatchById = secondCourseService.updateById(secondCourse);
        log.info("redis库存同步mysql---->{}", updateBatchById);

        //
    }

    /**
     * 增加订单
     */
    @RabbitListener(queues = "course.kill.cancel.syn.mysql")
    @RabbitHandler
    public void sysHandle(JSONObject jsonObject, Channel channel) {
        Long userId =(Long) jsonObject.get("userID");
        Integer secondCourseId =(Integer) jsonObject.get("secondCourseId");
        OrderCourse orderCourse=new OrderCourse();
        orderCourse.setUserId(userId);
        orderCourse.setSecondCourseId(secondCourseId);
        orderCourseService.save(orderCourse);
        log.info("同步订单");
    }

}