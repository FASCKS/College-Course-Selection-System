package com.pxx.collegecourseselectionsystem.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.dto.SysMenuDto;
import com.pxx.collegecourseselectionsystem.dto.SysRoleDto;
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
        List<SysMenuDto> sysMenuEntities = sysRoleEntity.getSysMenuEntities();
        //菜单权限变成树
        if (!sysMenuEntities.isEmpty()) {
            List<TreeNode<Integer>> nodeList = CollUtil.newArrayList();
            for (SysMenuDto sysMenuEntity : sysMenuEntities) {
                nodeList.add(new TreeNode<>(sysMenuEntity.getMenuId(), sysMenuEntity.getParentId(), sysMenuEntity.getName(), sysMenuEntity.getOrderNum()));
            }
            List<Tree<Integer>> buildMenuTree = TreeUtil.build(nodeList, 0);
            sysRoleEntity.setSysMenuTreeNode(buildMenuTree);
            sysRoleEntity.setSysMenuEntities(null);

        }

        return sysRoleEntity;
    }

    @Transactional
    @Override
    public boolean updateOneRole(SysRoleDto sysRoleEntity) {
        boolean updateById = this.updateById(sysRoleEntity);

        if (!sysRoleEntity.getSysMenuEntities().isEmpty()) {
            boolean insertRoleIdAndMenuId = this.insertRoleIdAndMenuId(sysRoleEntity.getMenuAuthorityIds(), sysRoleEntity.getRoleId());
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
        List<Integer> menuAuthorityIds = sysRoleEntity.getMenuAuthorityIds();
        if (menuAuthorityIds != null && !menuAuthorityIds.isEmpty()) {
            boolean insertRoleIdAndMenuId = this.insertRoleIdAndMenuId(menuAuthorityIds, sysRoleEntity.getRoleId());
        }
        return insert > 0;
    }

    /**
     * 添加角色和菜单绑定关系
     * @param menuIds
     * @param roleId
     * @return
     */
    private boolean insertRoleIdAndMenuId(List<Integer> menuIds, Long roleId) {
        QueryWrapper<SysRoleMenuEntity> sysRoleMenuEntityQueryWrapper = new QueryWrapper<>();
        sysRoleMenuEntityQueryWrapper.eq(SysRoleMenuEntity.COL_ROLE_ID, roleId);
        boolean remove = sysRoleMenuService.remove(sysRoleMenuEntityQueryWrapper);
        List<SysRoleMenuEntity> sysRoleMenuEntityList = new ArrayList<>();
        for (Integer menuAuthorityId : menuIds) {
            SysRoleMenuEntity sysRoleMenuEntity = new SysRoleMenuEntity();
            sysRoleMenuEntity.setMenuId(menuAuthorityId);
            sysRoleMenuEntity.setRoleId(roleId);
        }
        int batchInsert = sysRoleMenuService.batchInsert(sysRoleMenuEntityList);

        return batchInsert>=0;
    }
}
