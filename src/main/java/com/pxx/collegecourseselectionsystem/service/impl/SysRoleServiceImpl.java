package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysRoleMapper;
import com.pxx.collegecourseselectionsystem.service.SysMenuService;
import com.pxx.collegecourseselectionsystem.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRoleEntity> implements SysRoleService{
@Autowired
private SysRoleMapper sysRoleMapper;
@Autowired
private SysMenuService sysMenuService;
    @Override
    public int updateBatch(List<SysRoleEntity> list) {
        return baseMapper.updateBatch(list);
    }
    @Override
    public int batchInsert(List<SysRoleEntity> list) {
        return baseMapper.batchInsert(list);
    }
    @Override
    public int insertOrUpdate(SysRoleEntity record) {
        return baseMapper.insertOrUpdate(record);
    }
    @Override
    public int insertOrUpdateSelective(SysRoleEntity record) {
        return baseMapper.insertOrUpdateSelective(record);
    }

    /**
     * 通过角色id查询角色详情
     *
     * @param roleId 角色id
     * @return
     */
    @Override
    public SysRoleEntity findRoleInfoByRoleId(Long roleId) {
        SysRoleEntity sysRoleEntity= sysRoleMapper.findRoleInfoByRoleId(roleId);
        List<SysMenuEntity> sysMenuEntities = sysRoleEntity.getSysMenuEntities();
        //菜单权限变成树
        if (!sysMenuEntities.isEmpty()){
            List<SysMenuEntity> tree = sysMenuService.createTree(sysMenuEntities, 0);
            sysRoleEntity.setSysMenuEntities(tree);
        }

        return sysRoleEntity;
    }
}
