package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.SysUserRoleEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysUserRoleMapper;
import com.pxx.collegecourseselectionsystem.service.SysUserRoleService;
import org.springframework.stereotype.Service;

@Service
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRoleEntity> implements SysUserRoleService {


    /**
     * 通过用户id更新角色id
     *
     * @param userId
     * @param roleId
     * @return
     */
    @Override
    public boolean updateOneByUserId(Long userId, Long roleId) {
        SysUserRoleEntity sysUserRole = new SysUserRoleEntity();
        sysUserRole.setRoleId(roleId);
        sysUserRole.setUserId(userId);
        QueryWrapper<SysUserRoleEntity> sysUserRoleEntityQueryWrapper=new QueryWrapper<>();
        sysUserRoleEntityQueryWrapper.eq(SysUserRoleEntity.COL_USER_ID,userId);
        boolean saveOrUpdate = this.saveOrUpdate(sysUserRole,sysUserRoleEntityQueryWrapper);
        return saveOrUpdate;
    }
}

