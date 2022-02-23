package com.pxx.collegecourseselectionsystem.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.exception.RRException;
import com.pxx.collegecourseselectionsystem.dto.SysMenuDto;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysMenuMapper;
import com.pxx.collegecourseselectionsystem.service.SysMenuService;
import com.pxx.collegecourseselectionsystem.vo.course.MenuTreeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenuEntity> implements SysMenuService {
    @Autowired
    private SysMenuMapper sysMenuMapper;


    /**
     * 返回所有菜单
     *
     * @return
     */
//    @Cacheable(value = "menu_details", key = "'_menu'", unless = "#result == null")
    @Override
    public List<Tree<Integer>> findMenuByType(Integer... type) {
        List<SysMenuEntity> sysMenuEntities = sysMenuMapper.findMenuByType(type);
        return createMenu(sysMenuEntities, 0);
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
        return createMenu(sysMenuEntities, 0);
    }

    private List<Tree<Integer>> createMenu(List<SysMenuEntity> sysMenuEntities, Integer pid) {
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
                    sysMenuEntity.getPerms(),
                    sysMenuEntity.getMenuType()));
        }
        List<Tree<Integer>> buildTreeList = TreeUtil.build(nodeList, pid,
                (treeNode, tree) -> {
                    tree.setId(treeNode.getId());
                    tree.setParentId(treeNode.getParentId());
                    tree.setWeight(treeNode.getWeight());
                    tree.setName(treeNode.getName());
                    tree.putExtra("url", treeNode.getUrl());
                    tree.putExtra("status", treeNode.getStatus());
                    tree.putExtra("type", treeNode.getType());
                    tree.putExtra("perms", treeNode.getPerms());
                    tree.putExtra("menuType",treeNode.getMenuType());
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

    @Transactional
    @Override
    public boolean deleteOneByMenuId(Integer id) {
        List<SysMenuEntity> sysMenuEntityList = this.list();
        List<Integer> menuIds = new ArrayList<>();
        menuIds.add(id);
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

    @Cacheable(value = "menu_details", key = "'url_'+#url", unless = "#result == null")
    @Override
    public List<Tree<Integer>> findMenuByUrl(String url) {
        SysMenuEntity sysMenuEntity = baseMapper.findMenuByUrl(url);
        if (sysMenuEntity == null) {
            throw new RRException("找不到这个菜单");
        }
        Integer menuId = sysMenuEntity.getMenuId();
        List<Integer> menuIds = new ArrayList<>();
        menuIds.add(menuId);
        getSonDtId(this.list(), menuId, menuIds);

        List<SysMenuEntity> sysMenuEntityList = baseMapper.findMenuById(menuIds);
        List<Tree<Integer>> menuTree = createMenu(sysMenuEntityList, sysMenuEntity.getParentId());


        return menuTree;
    }

    /**
     * 通过id编辑
     *
     * @param sysMenuEntity
     * @return
     */
    @Override
    @Transactional
    public boolean updateOneById(SysMenuEntity sysMenuEntity) {

        int updateById = baseMapper.updateById(sysMenuEntity);
        return updateById > 0;
    }
}
