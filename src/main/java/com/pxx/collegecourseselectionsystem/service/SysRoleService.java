package com.pxx.collegecourseselectionsystem.service;

import java.util.List;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;
import com.baomidou.mybatisplus.extension.service.IService;
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
}
