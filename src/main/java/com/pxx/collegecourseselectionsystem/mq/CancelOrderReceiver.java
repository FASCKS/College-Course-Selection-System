package com.pxx.collegecourseselectionsystem.mq;

import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * @author Gpxx
 * @Date 2022/2/11 17:20
 */


@Component
@RabbitListener(queues = "mall.order.cancel.plugin")
public class CancelOrderReceiver {


    @RabbitHandler
    public void handle(Long orderId){
        System.out.println("redis同步信息成功");
    }
}