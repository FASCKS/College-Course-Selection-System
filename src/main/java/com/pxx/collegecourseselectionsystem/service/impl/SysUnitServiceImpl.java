package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.SysUnitEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysUnitMapper;
import com.pxx.collegecourseselectionsystem.service.SysUnitService;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SysUnitServiceImpl extends ServiceImpl<SysUnitMapper, SysUnitEntity> implements SysUnitService{

    @Override
    public int updateBatch(List<SysUnitEntity> list) {
        return baseMapper.updateBatch(list);
    }
    @Override
    public int batchInsert(List<SysUnitEntity> list) {
        return baseMapper.batchInsert(list);
    }
    @Override
    public int insertOrUpdate(SysUnitEntity record) {
        return baseMapper.insertOrUpdate(record);
    }
    @Override
    public int insertOrUpdateSelective(SysUnitEntity record) {
        return baseMapper.insertOrUpdateSelective(record);
    }
}
