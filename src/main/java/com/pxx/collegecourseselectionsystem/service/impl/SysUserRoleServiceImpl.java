package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.SysUserRoleEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysUserRoleMapper;
import com.pxx.collegecourseselectionsystem.service.SysUserRoleService;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRoleEntity> implements SysUserRoleService{

    @Override
    public int updateBatch(List<SysUserRoleEntity> list) {
        return baseMapper.updateBatch(list);
    }
    @Override
    public int batchInsert(List<SysUserRoleEntity> list) {
        return baseMapper.batchInsert(list);
    }
    @Override
    public int insertOrUpdate(SysUserRoleEntity record) {
        return baseMapper.insertOrUpdate(record);
    }
    @Override
    public int insertOrUpdateSelective(SysUserRoleEntity record) {
        return baseMapper.insertOrUpdateSelective(record);
    }
}
