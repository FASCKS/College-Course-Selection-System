package com.pxx.collegecourseselectionsystem.config;

/**
 * @author Gpxx
 * @Date 2022/2/11 16:57
 */

import com.pxx.collegecourseselectionsystem.entity.enums.QueueEnum;
import org.springframework.amqp.core.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

/**
 * 消息队列配置
 * Created by macro on 2018/9/14.
 */
@Configuration
public class RabbitMqConfig {

    /**
     * 订单延迟插件消息队列所绑定的交换机
     */
    @Bean
    CustomExchange orderPluginDirect() {
        //创建一个自定义交换机，可以发送延迟消息
        Map<String, Object> args = new HashMap<>();
        args.put("x-delayed-type", "direct");
        return new CustomExchange(QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getExchange(), "x-delayed-message", true, false, args);
    }

    /**
     * 普通交换机
     */
    @Bean
    public DirectExchange directExchange() {
        return new DirectExchange("course.kill.syn.mysql",true,false);
    }
    /**
     * 递减队列
     */
    @Bean
    public Queue courseKillSyn(){
        return new Queue("course.kill.cancel.syn.mysql");
    }
    /**
     * 递增队列
     */
    @Bean
    public Queue courseKilldel(){
        return new Queue("course.kill.cancel.del.mysql");
    }
    /**
     * 绑定
     */
    @Bean
    public Binding courseKillSynBinding(DirectExchange directExchange,Queue courseKillSyn){
        return BindingBuilder
                .bind(courseKillSyn)
                .to(directExchange)
                .with("course.kill.cancel.syn.mysql");
    }
    @Bean
    public Binding courseKillDelBinding(DirectExchange directExchange,Queue courseKilldel){
        return BindingBuilder
                .bind(courseKilldel)
                .to(directExchange)
                .with("course.kill.cancel.del.mysql");
    }
    /**
     * 订单延迟插件队列
     */
    @Bean
    public Queue orderPluginQueue() {
        return new Queue(QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getName());
    }

    /**
     * 将订单延迟插件队列绑定到交换机
     */
    @Bean
    public Binding orderPluginBinding(CustomExchange orderPluginDirect, Queue orderPluginQueue) {
        return BindingBuilder
                .bind(orderPluginQueue)
                .to(orderPluginDirect)
                .with(QueueEnum.QUEUE_ORDER_PLUGIN_CANCEL.getRouteKey())
                .noargs();
    }

}
