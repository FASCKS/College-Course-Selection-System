package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysMenuMapper;
import com.pxx.collegecourseselectionsystem.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenuEntity> implements SysMenuService{
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
    public List<SysMenuEntity> findMenuByType() {
        List<SysMenuEntity> sysMenuEntities=  sysMenuMapper.findMenuByType(1,0);

        List<SysMenuEntity> tree = createTree(sysMenuEntities, 0);
        return tree;
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
