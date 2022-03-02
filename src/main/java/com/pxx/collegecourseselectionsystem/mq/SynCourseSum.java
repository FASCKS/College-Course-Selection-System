package com.pxx.collegecourseselectionsystem.mq;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.json.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.dto.OrderSecondCourseDto;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
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

import java.util.ArrayList;
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
    public void handle(Integer planGroupId) {
        List<SecondCourseDto> secondCourseDtoList = redisUtil.get(Global.KILL_SECOND_COURSE + "all:" + planGroupId);
        List<SecondCourse> secondCourseList = new ArrayList<>(secondCourseDtoList.size());
        for (SecondCourseDto secondCourseDto : secondCourseDtoList) {
            //更新库存
            secondCourseDto.setCourseSum(redisUtil.get(Global.KILL_SECOND_COURSE + "sum:" + secondCourseDto.getId()));
            SecondCourse secondCourse = new SecondCourse();
            BeanUtil.copyProperties(secondCourseDto, secondCourse);
            secondCourseList.add(secondCourse);
        }
        boolean updateBatchById = secondCourseService.updateBatchById(secondCourseList);


        //获取临时表中的数据添加进课程表中
        List<OrderSecondCourseDto> orderSecondCourseDtoList = orderCourseService.findAllByPlanGroupId(planGroupId);
        List<ClassSchedule> classScheduleList = new ArrayList<>();

        for (OrderSecondCourseDto orderSecondCourseDto : orderSecondCourseDtoList) {
            ClassSchedule classSchedule = new ClassSchedule();

            classSchedule.setCreateTime(DateUtil.date());
            classSchedule.setTeacher(orderSecondCourseDto.getTeacher());
            classSchedule.setUserId(orderSecondCourseDto.getUserId());
            classSchedule.setUpTime(orderSecondCourseDto.getUpTime().getCode());
            classSchedule.setWeek(orderSecondCourseDto.getWeek());
            classSchedule.setCourseId(orderSecondCourseDto.getCourseId());
            classSchedule.setUnit(orderSecondCourseDto.getUnitId());
            //关联教室
            classSchedule.setClassroomId(orderSecondCourseDto.getClassroomId());
            classScheduleList.add(classSchedule);

            //如果有第二节
            if (orderSecondCourseDto.getUpTimeTwo().getCode() != 0) {
                ClassSchedule classScheduleTwo = new ClassSchedule();
                BeanUtil.copyProperties(classSchedule,classScheduleTwo);
                classScheduleTwo.setUpTime(orderSecondCourseDto.getUpTimeTwo().getCode());
                classScheduleList.add(classScheduleTwo);
            }
        }
        //添加至课程表
        boolean saveBatch = classScheduleService.saveBatch(classScheduleList);

        //删除该组临时课表订单
        QueryWrapper<OrderCourse> orderCourseQueryWrapper = new QueryWrapper<>();
        orderCourseQueryWrapper.eq("plan_group_id", planGroupId);
        orderCourseService.deleteAll();


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
    public void sysHandle(JSONObject jsonObject) {
        Long userId = (Long) jsonObject.get("userID");
        Integer secondCourseId = (Integer) jsonObject.get("secondCourseId");
        Integer planGroupId = (Integer) jsonObject.get("planGroupId");
        OrderCourse orderCourse = new OrderCourse();
        orderCourse.setUserId(userId);
        orderCourse.setSecondCourseId(secondCourseId);
        orderCourse.setPlanGroupId(planGroupId);
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