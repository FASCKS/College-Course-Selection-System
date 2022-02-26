package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.dto.ClassroomRoofDto;
import com.pxx.collegecourseselectionsystem.entity.Classroom;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author Gpxx
 * @Date 2022/2/24 16:24
 */
@Mapper
@InterceptorIgnore(tenantLine = "true")
public interface ClassroomMapper extends BaseMapper<Classroom> {
    IPage<ClassroomRoofDto> findAllClassroom(Page<Classroom> page);

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