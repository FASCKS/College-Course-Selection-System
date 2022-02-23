package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.CourseEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper@InterceptorIgnore(tenantLine = "1")
public interface CourseMapper extends BaseMapper<CourseEntity> {
    int updateBatch(List<CourseEntity> list);

    int batchInsert(@Param("list") List<CourseEntity> list);

    int insertOrUpdate(CourseEntity record);

    int insertOrUpdateSelective(CourseEntity record);
}