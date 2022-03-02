package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.CourseEntity;
import com.pxx.collegecourseselectionsystem.mapper.CourseMapper;
import com.pxx.collegecourseselectionsystem.service.CourseService;
import org.springframework.stereotype.Service;
@Service
public class CourseServiceImpl extends ServiceImpl<CourseMapper, CourseEntity> implements CourseService{


    /**
     * 统计某个课程类型的数量
     *
     * @param id
     * @return
     */
    @Override
    public Integer CountByType(Integer type) {

        return baseMapper.countByType(type);
    }
}
