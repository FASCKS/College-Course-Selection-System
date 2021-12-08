package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.SysUserRoleEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SysUserRoleMapper extends BaseMapper<SysUserRoleEntity> {
    int updateBatch(List<SysUserRoleEntity> list);

    int batchInsert(@Param("list") List<SysUserRoleEntity> list);

    int insertOrUpdate(SysUserRoleEntity record);

    int insertOrUpdateSelective(SysUserRoleEntity record);
}