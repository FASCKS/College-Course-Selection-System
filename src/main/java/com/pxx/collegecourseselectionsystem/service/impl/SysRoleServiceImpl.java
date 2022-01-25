package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.exception.RRException;
import com.pxx.collegecourseselectionsystem.dto.SysRoleDto;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;
import com.pxx.collegecourseselectionsystem.entity.SysRoleMenuEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysRoleMapper;
import com.pxx.collegecourseselectionsystem.service.SysMenuService;
import com.pxx.collegecourseselectionsystem.service.SysRoleMenuService;
import com.pxx.collegecourseselectionsystem.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRoleEntity> implements SysRoleService {
    @Autowired
    private SysRoleMapper sysRoleMapper;
    @Autowired
    private SysMenuService sysMenuService;
    @Autowired
    private SysRoleMenuService sysRoleMenuService;


    /**
     * 通过角色id查询角色详情
     *
     * @param roleId 角色id
     * @return
     */
    @Override
    public SysRoleEntity findRoleInfoByRoleId(Long roleId) {
        SysRoleDto sysRoleEntity = sysRoleMapper.findRoleInfoByRoleId(roleId);
        List<SysMenuEntity> sysMenuEntities = sysRoleEntity.getSysMenuEntities();
        //菜单权限变成树
        if (!sysMenuEntities.isEmpty()) {
            List<SysMenuEntity> tree = sysMenuService.createTree(sysMenuEntities, 0);
            sysRoleEntity.setSysMenuEntities(tree);
        }

        return sysRoleEntity;
    }
    @Transactional
    @Override
    public boolean updateOneRole(SysRoleDto sysRoleEntity) {
        boolean updateById = this.updateById(sysRoleEntity);

        if (!sysRoleEntity.getSysMenuEntities().isEmpty()) {
            //先删除全部角色关联
            boolean deleteByRoleId = sysRoleMenuService.deleteByRoleId(sysRoleEntity.getRoleId());
            //添加角色菜单关联
            List<SysRoleMenuEntity> sysRoleMenuEntities =
                    insertRoleIdAndMenuId(
                            sysRoleEntity.getSysMenuEntities()
                            , sysRoleEntity.getRoleId());
            int batchInsert = sysRoleMenuService.batchInsert(sysRoleMenuEntities);
            if (!deleteByRoleId || batchInsert != sysRoleMenuEntities.size()) {
                throw new RRException("角色菜单更新失败.");
            }
        }


        return updateById;
    }

    /**
     * 新增角色 和 角色权限
     *
     * @param sysRoleEntity
     * @return
     */
    @Transactional
    @Override
    public boolean insertOneRole(SysRoleDto sysRoleEntity) {
        int insert = sysRoleMapper.insert(sysRoleEntity);
        if (!sysRoleEntity.getSysMenuEntities().isEmpty()) {
            //添加角色菜单关联
            List<SysRoleMenuEntity> sysRoleMenuEntities =
                    insertRoleIdAndMenuId(
                            sysRoleEntity.getSysMenuEntities()
                            , sysRoleEntity.getRoleId());

            int batchInsert = sysRoleMenuService.batchInsert(sysRoleMenuEntities);
            if (batchInsert != sysRoleMenuEntities.size()) {
                throw new RRException("角色菜单添加失败.");
            }
        }

        return insert > 0;
    }

    /**
     * 创建角色菜单临时表对象
     *
     * @param sysMenuEntities
     * @param roleId
     * @return
     */
    private List<SysRoleMenuEntity> insertRoleIdAndMenuId(List<SysMenuEntity> sysMenuEntities, Long roleId) {

        List<SysRoleMenuEntity> sysRoleMenuEntities = new ArrayList<>();
        sysMenuEntities.forEach(
                sysMenuEntity -> {
                    SysRoleMenuEntity sysRoleMenuEntity = new SysRoleMenuEntity();
                    sysRoleMenuEntity.setRoleId(roleId);
                    sysRoleMenuEntity.setMenuId(sysMenuEntity.getMenuId());
                    sysRoleMenuEntities.add(sysRoleMenuEntity);
                }
        );
        return sysRoleMenuEntities;
    }
}
