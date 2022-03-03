package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.CourseType;
import org.apache.ibatis.annotations.Mapper;

/**
 *  @author Gpxx
 *  @Date 2022/3/2 16:05
 */
@Mapper@InterceptorIgnore(tenantLine = "true")
public interface CourseTypeMapper extends BaseMapper<CourseType> {
}