package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.entity.SysUserRoleEntity;

public interface SysUserRoleService extends IService<SysUserRoleEntity> {

    /**
     * 通过用户id更新角色id
     * @param userId
     * @param roleId
     * @return
     */
    boolean updateOneByUserId(Long userId, Long roleId);
}

