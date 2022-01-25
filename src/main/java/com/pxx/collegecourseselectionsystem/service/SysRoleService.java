package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.dto.SysRoleDto;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;
public interface SysRoleService extends IService<SysRoleEntity>{


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
    boolean updateOneRole(SysRoleDto sysRoleEntity);

    /**
     * 新增角色 和 角色权限
     * @param sysRoleEntity
     * @return
     */
    boolean insertOneRole(SysRoleDto sysRoleEntity);
}
