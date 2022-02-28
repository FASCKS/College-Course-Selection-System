package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.dto.ClassroomRoofDto;
import com.pxx.collegecourseselectionsystem.entity.Classroom;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/2/24 16:24
 */
@Mapper
@InterceptorIgnore(tenantLine = "true")
public interface ClassroomMapper extends BaseMapper<Classroom> {
    Long findAllClassroomCount();

    List<ClassroomRoofDto> findAllClassroom(@Param("current") long current, @Param("size") long size);

    /**
     * 查询一条
     *
     * @param roof
     * @param between
     * @param floor
     * @return
     */
    Classroom findOneByRoofAndBetweenAndFloor(@Param("roof") Integer roof, @Param("between") Integer between, @Param("floor") Integer floor);

    Classroom findOne(@Param("id") Integer id);


}