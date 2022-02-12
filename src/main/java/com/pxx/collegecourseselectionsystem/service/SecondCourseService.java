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

    /**
     * 检查课程是否在时间之内
     * @param secondCourseId
     * @return
     */
    boolean checkTime(SecondCourseDto secondCourseDto);

    /**
     * 新增数据
     * @param secondCourseDto
     * @return
     */
    boolean insertOne(SecondCourseDto secondCourseDto);
}

