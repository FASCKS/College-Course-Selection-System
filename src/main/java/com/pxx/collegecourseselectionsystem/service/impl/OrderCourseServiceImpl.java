package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.OrderCourse;
import com.pxx.collegecourseselectionsystem.mapper.OrderCourseMapper;
import com.pxx.collegecourseselectionsystem.service.OrderCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Galen
 * @Date 2022/2/10 14:49
 */
@Service
public class OrderCourseServiceImpl extends ServiceImpl<OrderCourseMapper, OrderCourse> implements OrderCourseService {
    @Autowired
    private OrderCourseMapper orderCourseMapper;


    /**
     * 删除全部数据
     */
    @Override
    public void deleteAll() {
        orderCourseMapper.deleteAll();
    }
}
