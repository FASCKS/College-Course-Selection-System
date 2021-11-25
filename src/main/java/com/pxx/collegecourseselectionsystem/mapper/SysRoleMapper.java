package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SysRoleMapper extends BaseMapper<SysRoleEntity> {
    int updateBatch(List<SysRoleEntity> list);

    int batchInsert(@Param("list") List<SysRoleEntity> list);

    int insertOrUpdate(SysRoleEntity record);

    int insertOrUpdateSelective(SysRoleEntity record);

    /**
     * 通过用户id查找角色
     */
    List<SysRoleEntity> findRoleByUserId(@Param("userId") Long userId);
}