package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SysUserMapper extends BaseMapper<SysUserEntity> {
    int updateBatch(List<SysUserEntity> list);

    int batchInsert(@Param("list") List<SysUserEntity> list);

    int insertOrUpdate(SysUserEntity record);

    int insertOrUpdateSelective(SysUserEntity record);

    /**
     * 查找用户和用户对应的权限
     * @return
     */
    List<SysUserEntity> findUserAndRoleMap();

    SysUserEntity findOneByNumber(@Param("number")String username);



}