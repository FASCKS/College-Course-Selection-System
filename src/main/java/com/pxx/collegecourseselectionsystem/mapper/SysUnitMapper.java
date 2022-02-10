package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.SysUnitEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SysUnitMapper extends BaseMapper<SysUnitEntity> {
    int updateBatch(List<SysUnitEntity> list);

    int batchInsert(@Param("list") List<SysUnitEntity> list);

    int insertOrUpdate(SysUnitEntity record);

    int insertOrUpdateSelective(SysUnitEntity record);


}