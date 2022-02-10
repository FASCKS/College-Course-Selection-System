package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;

import java.util.List;

/**
 * @author Galen
 * @Date 2022/2/10 14:48
 */
public interface SecondCourseService extends IService<SecondCourse> {


    int updateBatch(List<SecondCourse> list);

    int batchInsert(List<SecondCourse> list);

    int insertOrUpdate(SecondCourse record);

    int insertOrUpdateSelective(SecondCourse record);

    List<SecondCourseDto> findAllSecondCourse();



}

