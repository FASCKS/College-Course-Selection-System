package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.entity.CourseEntity;
public interface CourseService extends IService<CourseEntity>{


    /**
     * 统计某个课程类型的数量
     * @param id
     * @return
     */
    Integer CountByType(Integer type);
}
