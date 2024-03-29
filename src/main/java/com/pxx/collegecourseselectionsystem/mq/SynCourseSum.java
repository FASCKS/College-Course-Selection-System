package com.pxx.collegecourseselectionsystem.mq;

import cn.hutool.core.convert.Convert;
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
     * @param
     */
    @RabbitListener(queues = "mall.order.cancel.plugin")
    @RabbitHandler
    public void handle(Integer planGroupId) {

        List<ClassSchedule> allByPlanGroupId = orderCourseService.findAllByPlanGroupId(planGroupId);
        //添加至课程表
        boolean saveBatch = classScheduleService.saveBatch(allByPlanGroupId);
        //redis同步库存
        List<SecondCourse> secondCourseList = secondCourseService.findAllByPlanGroupId(planGroupId);
        for (SecondCourse secondCourse : secondCourseList) {
            Integer sum = redisUtil.get(Global.KILL_SECOND_COURSE + "sum:" + secondCourse.getId());
            secondCourse.setCourseSum(sum);
        }

        boolean updateBatchById = secondCourseService.updateBatchById(secondCourseList);

        //删除该组临时课表订单
        QueryWrapper<OrderCourse> orderCourseQueryWrapper = new QueryWrapper<>();
        orderCourseQueryWrapper.eq("plan_group_id", planGroupId);
        orderCourseService.remove(orderCourseQueryWrapper);


        log.info("redis库存同步mysql---->{},同步课程表----->{}", updateBatchById, saveBatch);

        //
    }

    /**
     * 删除redis数据
     */
    @RabbitListener(queues = "mall.order.cancel.plugin.del.redis.key")
    @RabbitHandler
    public void handle(Long userId) {
        redisUtil.del(Global.KILL_SECOND_COURSE + "class:temp_schedule:" + userId,
                Global.KILL_SECOND_COURSE + "class:schedule:" + userId);
        log.info("redis删除用户相关---》{} key成功", userId);
    }


    /**
     * 增加订单
     */
    @RabbitListener(queues = "course.kill.cancel.syn.mysql")
    @RabbitHandler
    public void sysHandle(List<OrderCourse> orderCourseList) {
       if (!orderCourseList.isEmpty()){
           orderCourseService.saveBatch(orderCourseList);
       }
    }

    /**
     * 删除订单
     */
    @RabbitListener(queues = "course.kill.cancel.del.mysql")
    @RabbitHandler
    public void delHandle(JSONObject jsonObject) {
        Long userId = Convert.toLong(jsonObject.get("userID"));
        Integer secondCourseId = (Integer) jsonObject.get("secondCourseId");
        Integer planGroupId = (Integer) jsonObject.get("planGroupId");
        QueryWrapper<OrderCourse> orderCourseQueryWrapper = new QueryWrapper<>();
        orderCourseQueryWrapper
                .eq(OrderCourse.COL_USER_ID, userId)
                .eq(OrderCourse.COL_SECOND_COURSE_ID, secondCourseId)
                .eq("plan_group_id", planGroupId);
        boolean removeById = orderCourseService.remove(orderCourseQueryWrapper);
        log.info("退课成功---》{}", removeById);
    }

}