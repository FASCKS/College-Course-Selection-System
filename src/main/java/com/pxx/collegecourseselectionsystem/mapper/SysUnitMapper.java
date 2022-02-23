package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.SysUnitEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

@InterceptorIgnore(tenantLine = "true")
@Mapper
public interface SysUnitMapper extends BaseMapper<SysUnitEntity> {
    int updateBatch(List<SysUnitEntity> list);

    int batchInsert(@Param("list") List<SysUnitEntity> list);

    int insertOrUpdate(SysUnitEntity record);

    int insertOrUpdateSelective(SysUnitEntity record);

    /**
     * 通过用户id查询用户能查询的范围
     *
     * @param userId
     */

    Set<Integer> findUnitIdByUserId(@Param("userId") Long userId);
}