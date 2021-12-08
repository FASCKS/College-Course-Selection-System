package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.entity.SysRoleMenuEntity;

import java.util.List;
public interface SysRoleMenuService extends IService<SysRoleMenuEntity>{


    int updateBatch(List<SysRoleMenuEntity> list);

    int batchInsert(List<SysRoleMenuEntity> list);

    int insertOrUpdate(SysRoleMenuEntity record);

    int insertOrUpdateSelective(SysRoleMenuEntity record);

    /**
     * 删除角色绑定菜单
     * @return
     */
    boolean deleteByRoleId(Long roleId);
}
