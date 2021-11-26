package com.pxx.collegecourseselectionsystem.service.impl;

import org.springframework.stereotype.Service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.mapper.SysMenuMapper;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import com.pxx.collegecourseselectionsystem.service.SysMenuService;
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenuEntity> implements SysMenuService{

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
}
