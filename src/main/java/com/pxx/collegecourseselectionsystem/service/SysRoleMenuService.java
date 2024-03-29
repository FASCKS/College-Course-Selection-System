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

    /**
     * 获取菜单id数组
     * @param roleId
     * @return
     */
    List<Integer> findMenuIdByRoleId(Long roleId);

    /**
     * 通过菜单id删除数据
     * @param menuIds
     * @return
     */
    boolean deleteByMenuId(List<Integer> menuIds);

    /**
     * 通过角色id删除
     * @param roleIds
     * @return
     */
    boolean deleteByBatchRoleId(List<Long> roleIds);

    /**
     * 通过菜单id获取角色id
     * @param menuId
     * @return
     */
    List<Long> findRoleIdsByMenuId(Integer menuId);
}
