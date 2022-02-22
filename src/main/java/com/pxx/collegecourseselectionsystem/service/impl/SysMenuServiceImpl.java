package com.pxx.collegecourseselectionsystem.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.dto.SysMenuDto;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysMenuMapper;
import com.pxx.collegecourseselectionsystem.service.SysMenuService;
import com.pxx.collegecourseselectionsystem.vo.course.MenuTreeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenuEntity> implements SysMenuService {
    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Override
    public int updateBatch(List<SysMenuEntity> list) {
        return baseMapper.updateBatch(list);
    }

    @Override
    public int batchInsert(List<SysMenuEntity> list) {
        return baseMapper.batchInsert(list);
    }

    @Override
    public int insertOrUpdate(SysMenuEntity record) {
        return baseMapper.insertOrUpdate(record);
    }

    @Override
    public int insertOrUpdateSelective(SysMenuEntity record) {
        return baseMapper.insertOrUpdateSelective(record);
    }

    /**
     * 返回所有菜单
     *
     * @return
     */
    @Cacheable(value = "menu_details", key = "'_menu'", unless = "#result == null")
    @Override
    public List<Tree<Integer>> findMenuByType(Integer... type) {
        List<SysMenuEntity> sysMenuEntities = sysMenuMapper.findMenuByType(type);
        return createMenu(sysMenuEntities);
    }

    /**
     * 返回菜单和权限
     *
     * @param type
     * @return
     */
    @Override
    public List<Tree<Integer>> findAllMenuByType(Integer... type) {
        List<SysMenuEntity> sysMenuEntities = sysMenuMapper.findAllMenuByType(type);
        return createMenu(sysMenuEntities);
    }

    private List<Tree<Integer>> createMenu(List<SysMenuEntity> sysMenuEntities) {
        List<MenuTreeNode<Integer>> nodeList = CollUtil.newArrayList();
        for (SysMenuEntity sysMenuEntity : sysMenuEntities) {
            nodeList.add(new MenuTreeNode<>(
                    sysMenuEntity.getMenuId(),
                    sysMenuEntity.getParentId(),
                    sysMenuEntity.getName(),
                    sysMenuEntity.getOrderNum(),
                    sysMenuEntity.getUrl(),
                    sysMenuEntity.getStatus(),
                    sysMenuEntity.getType(),
                    sysMenuEntity.getPerms()));
        }
        List<Tree<Integer>> buildTreeList = TreeUtil.build(nodeList, 0,
                (treeNode, tree) -> {
                    tree.setId(treeNode.getId());
                    tree.setParentId(treeNode.getParentId());
                    tree.setWeight(treeNode.getWeight());
                    tree.setName(treeNode.getName());
                    tree.putExtra("url", treeNode.getUrl());
                    tree.putExtra("status", treeNode.getStatus());
                    tree.putExtra("type", treeNode.getType());
                    tree.putExtra("perms", treeNode.getPerms());
                }
        );
        return buildTreeList;
    }

    @Override
    public List<SysMenuDto> createTree(List<SysMenuDto> menuEntityList, int pid) {
        List<SysMenuDto> newTree = new ArrayList<>();
        for (SysMenuDto sysMenuEntity : menuEntityList) {
            Integer menuId = sysMenuEntity.getParentId();
            if (Objects.equals(menuId, pid)) {
                newTree.add(sysMenuEntity);
                sysMenuEntity.setMenuEntities(createTree(menuEntityList, sysMenuEntity.getMenuId()));
            }
        }
        return newTree;
    }

    @Override
    public boolean deleteOneByMenuId(Integer id) {
        List<SysMenuEntity> sysMenuEntityList = this.list();
        List<Integer> menuIds = new ArrayList<>();
        this.getSonDtId(sysMenuEntityList, id, menuIds);

        boolean removeBatchByIds = this.removeBatchByIds(menuIds);
        return removeBatchByIds;
    }

    /**
     * 查找儿子  不包含自己
     *
     * @param departmentList
     * @param dtId
     * @param dtIds
     */
    @Override
    public void getSonDtId(List<SysMenuEntity> departmentList, Integer dtId, List<Integer> dtIds) {
        for (SysMenuEntity department : departmentList) {
            if (dtId.equals(department.getParentId())) {
                dtIds.add(department.getMenuId());
                getSonDtId(departmentList, department.getMenuId(), dtIds);
            }
        }
    }
}
