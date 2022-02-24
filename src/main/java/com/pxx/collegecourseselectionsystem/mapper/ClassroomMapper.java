package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.entity.Classroom;
import org.apache.ibatis.annotations.Mapper;

/**
 *  @author Gpxx
 *  @Date 2022/2/24 16:24
 */
@Mapper@InterceptorIgnore(tenantLine = "true")
public interface ClassroomMapper extends BaseMapper<Classroom> {
    IPage<Classroom> findAllClassroom(Page<Classroom> objectPage);
}