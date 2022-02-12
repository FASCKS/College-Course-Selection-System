package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.ClassSchedule;
import com.pxx.collegecourseselectionsystem.vo.course.ClassScheduleVo;
import com.pxx.collegecourseselectionsystem.vo.course.SimpleClassScheduleVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ClassScheduleMapper extends BaseMapper<ClassSchedule> {
    ClassScheduleVo findMyClassSchedule(@Param("userId") Long userId);

    List<SimpleClassScheduleVo> findSimpleMyClassSchedule();
}