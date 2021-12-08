package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;

import java.util.List;
public interface SysRoleService extends IService<SysRoleEntity>{


    int updateBatch(List<SysRoleEntity> list);

    int batchInsert(List<SysRoleEntity> list);

    int insertOrUpdate(SysRoleEntity record);

    int insertOrUpdateSelective(SysRoleEntity record);

    /**
     * 通过角色id查询角色详情
     * @param roleId 角色id
     * @return
     */
    SysRoleEntity findRoleInfoByRoleId(Long roleId);

    /**
     * 更新角色 和 角色权限
     * @param sysRoleEntity
     * @return
     */
    boolean updateOneRole(SysRoleEntity sysRoleEntity);

    /**
     * 新增角色 和 角色权限
     * @param sysRoleEntity
     * @return
     */
    boolean insertOneRole(SysRoleEntity sysRoleEntity);
}
