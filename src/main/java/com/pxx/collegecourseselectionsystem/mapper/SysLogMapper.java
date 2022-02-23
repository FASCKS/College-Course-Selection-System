package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.SysLogEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@InterceptorIgnore(tenantLine = "1")
@Mapper
public interface SysLogMapper extends BaseMapper<SysLogEntity> {
    int updateBatch(List<SysLogEntity> list);

    int batchInsert(@Param("list") List<SysLogEntity> list);

    int insertOrUpdate(SysLogEntity record);

    int insertOrUpdateSelective(SysLogEntity record);
}