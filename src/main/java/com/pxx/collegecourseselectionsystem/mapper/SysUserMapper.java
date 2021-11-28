package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SysUserMapper extends BaseMapper<SysUserEntity> {
    @Deprecated
    int updateBatch(List<SysUserEntity> list);
    @Deprecated
    int batchInsert(@Param("list") List<SysUserEntity> list);
    @Deprecated
    int insertOrUpdate(SysUserEntity record);
    @Deprecated
    int insertOrUpdateSelective(SysUserEntity record);

    /**
     * 查找用户和用户对应的权限
     *
     * @return
     */
    List<SysUserEntity> findUserAndRoleMap();

    SysUserEntity findOneByNumber(@Param("number") String username);
}