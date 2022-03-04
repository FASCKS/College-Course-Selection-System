package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.ClassSchedule;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;

import java.util.Collection;
import java.util.List;

/**
 * @author Galen
 * @Date 2022/2/10 14:48
 */
public interface SecondCourseService extends IService<SecondCourse> {



    List<SecondCourseDto> findAllSecondCourse(Integer planGroupId);

    /**
     * 检查课程是否在时间之内
     * @param secondCourseId
     * @return
     */
    boolean checkTime(SecondCourseDto secondCourseDto);
    /**
     * 检查课程是否在时间之内
     * @param secondCourseId
     * @return
     */
    boolean checkTime(SecondCoursePlanGroupEntity secondCourseDto);

    /**
     * 新增数据
     * @param secondCourseDto
     * @return
     */
    boolean insertOne(SecondCourse secondCourseDto);

    /**
     * 将临时表中的数据加到课程表
     * @return
     */
    List<ClassSchedule> findAllOrderCourseAndSecondCourseData();
    List<ClassSchedule> findAllOrderCourseAndSecondCourseDataTwo();

    /**
     * 通过用户id查询数量
     * @return
     */
    Integer findCountByUserId(Collection<Long> list);

    /**
     * 通过组获取所有
     * @param planGroupId
     * @return
     */
    List<SecondCourse> findAllByPlanGroupId(Integer planGroupId);
}

