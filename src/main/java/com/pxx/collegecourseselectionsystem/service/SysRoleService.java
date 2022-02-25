package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.dto.SysRoleDto;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;

import java.util.List;

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

    /**
     * 获取所有角色
     * @param page
     * @return
     */
    PageUtils findAllRole(Page<SysRoleEntity> page);

    /**
     * 批量删除
     * @param roleIds
     * @return
     */
    boolean deleteRoleById(List<Long> roleIds);
}
