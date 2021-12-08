package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.entity.CourseEntity;

import java.util.List;
public interface CourseService extends IService<CourseEntity>{


    int updateBatch(List<CourseEntity> list);

    int batchInsert(List<CourseEntity> list);

    int insertOrUpdate(CourseEntity record);

    int insertOrUpdateSelective(CourseEntity record);

}
