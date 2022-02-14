package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.ClassSchedule;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
import com.pxx.collegecourseselectionsystem.entity.enums.CourseUpTimeEnum;
import com.pxx.collegecourseselectionsystem.entity.enums.CourseWeekEnum;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Galen
 * @Date 2022/2/10 14:48
 */
@Mapper
public interface SecondCourseMapper extends BaseMapper<SecondCourse> {

    List<SecondCourseDto> findAllSecondCourse(Integer planGroupId);

    /**
     * 是否重复
     *
     * @param courseId
     * @param upTime
     * @param week
     * @return
     */
    SecondCourse findOneByCourseIdAndUpTimeAndWeek(@Param("courseId") Integer courseId, @Param("upTime") CourseUpTimeEnum upTime, @Param("week") CourseWeekEnum week);

    List<ClassSchedule> findAllOrderCourseAndSecondCourseData();
}