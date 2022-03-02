package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.dto.CourseDto;
import com.pxx.collegecourseselectionsystem.entity.CourseEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
@InterceptorIgnore(tenantLine = "1")
public interface CourseMapper extends BaseMapper<CourseEntity> {


    Integer countByType(@Param("type") Integer type);

    Page<CourseDto> findAllCourse(Page<CourseEntity> courseEntityPage);
}