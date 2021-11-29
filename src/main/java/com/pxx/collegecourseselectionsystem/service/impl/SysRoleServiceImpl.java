package com.pxx.collegecourseselectionsystem.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysRoleMapper;
import com.pxx.collegecourseselectionsystem.service.SysRoleService;
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRoleEntity> implements SysRoleService{
@Autowired
private SysRoleMapper sysRoleMapper;
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
        SysRoleEntity sysRoleEntity=   sysRoleMapper.findRoleInfoByRoleId(roleId);
        return sysRoleEntity;
    }
}
