package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.entity.SysUserRoleEntity;

import java.util.List;
public interface SysUserRoleService extends IService<SysUserRoleEntity>{


    int updateBatch(List<SysUserRoleEntity> list);

    int batchInsert(List<SysUserRoleEntity> list);

    int insertOrUpdate(SysUserRoleEntity record);

    int insertOrUpdateSelective(SysUserRoleEntity record);

}
