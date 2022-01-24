package com.pxx.collegecourseselectionsystem.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysMenuMapper;
import com.pxx.collegecourseselectionsystem.service.SysMenuService;
import com.pxx.collegecourseselectionsystem.vo.course.MenuTreeNode;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Override
    public List<Tree<Integer>> findMenuByType() {
        List<SysMenuEntity> sysMenuEntities = sysMenuMapper.findMenuByType(1, 0);
        List<MenuTreeNode<Integer>> nodeList = CollUtil.newArrayList();
        for (SysMenuEntity sysMenuEntity : sysMenuEntities) {
            nodeList.add(new MenuTreeNode<>(
                    sysMenuEntity.getMenuId(),
                    sysMenuEntity.getParentId(),
                    sysMenuEntity.getName(),
                    sysMenuEntity.getOrderNum(),
                    sysMenuEntity.getUrl(),
                    sysMenuEntity.getStatus(),
                    sysMenuEntity.getType()));
        }
        List<Tree<Integer>> buildTreeList = TreeUtil.build(nodeList, 0,
                (treeNode, tree) -> {
                    tree.setId(treeNode.getId());
                    tree.setParentId(treeNode.getParentId());
                    tree.setWeight(treeNode.getWeight());
                    tree.setName(treeNode.getName());
                    tree.putExtra("url", treeNode.getUrl());
                    tree.putExtra("status",treeNode.getStatus());
                    tree.putExtra("type",treeNode.getType());}
                );
        return buildTreeList;
    }

    @Override
    public List<SysMenuEntity> createTree(List<SysMenuEntity> menuEntityList, int pid) {
        List<SysMenuEntity> newTree = new ArrayList<>();
        for (SysMenuEntity sysMenuEntity : menuEntityList) {
            Integer menuId = sysMenuEntity.getParentId();
            if (Objects.equals(menuId, pid)) {
                newTree.add(sysMenuEntity);
                sysMenuEntity.setMenuEntities(createTree(menuEntityList, sysMenuEntity.getMenuId()));
            }
        }
        return newTree;
    }
}
