package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.ClassroomRoof;
import org.apache.ibatis.annotations.Mapper;

/**
 *  @author Gpxx
 *  @Date 2022/2/24 16:11
 */
@Mapper@InterceptorIgnore(tenantLine = "true")
public interface ClassroomRoofMapper extends BaseMapper<ClassroomRoof> {
}