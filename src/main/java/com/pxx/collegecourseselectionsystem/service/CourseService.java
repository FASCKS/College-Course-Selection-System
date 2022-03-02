package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.dto.CourseDto;
import com.pxx.collegecourseselectionsystem.entity.CourseEntity;
public interface CourseService extends IService<CourseEntity>{


    /**
     * 统计某个课程类型的数量
     * @param id
     * @return
     */
    Integer CountByType(Integer type);

    Page<CourseDto> findAllCourse(Page<CourseEntity> objectPage);

    /**
     * 更新
     * @param courseEntity
     * @return
     */
    boolean updateOneById(CourseEntity courseEntity);

    boolean saveOneById(CourseEntity courseEntity);
}
