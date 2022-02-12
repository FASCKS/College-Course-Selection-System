package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.entity.OrderCourse;
    /**
 *  @author Galen
 *  @Date 2022/2/10 14:49
 */
public interface OrderCourseService extends IService<OrderCourse>{

        /**
         * 删除全部数据
         */
        void deleteAll();
    }
