package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.dto.OrderSecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.OrderCourse;

import java.util.List;

/**
 *  @author Galen
 *  @Date 2022/2/10 14:49
 */
public interface OrderCourseService extends IService<OrderCourse>{

        /**
         * 删除全部数据
         */
        void deleteAll();

    /**
     * 通过分组获取所有抢课订单
     * @param planGroupId
     * @return
     */
        List<OrderSecondCourseDto> findAllByPlanGroupId(Integer planGroupId);
    }
