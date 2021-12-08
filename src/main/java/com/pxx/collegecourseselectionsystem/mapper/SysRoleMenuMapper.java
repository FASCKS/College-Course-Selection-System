package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.SysRoleMenuEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SysRoleMenuMapper extends BaseMapper<SysRoleMenuEntity> {
    int updateBatch(List<SysRoleMenuEntity> list);

    int batchInsert(@Param("list") List<SysRoleMenuEntity> list);

    int insertOrUpdate(SysRoleMenuEntity record);

    int insertOrUpdateSelective(SysRoleMenuEntity record);


    int deleteByRoleId(@Param("roleId") Long roleId);
}