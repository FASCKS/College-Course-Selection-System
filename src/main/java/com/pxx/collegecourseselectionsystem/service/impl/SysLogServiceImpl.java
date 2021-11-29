package com.pxx.collegecourseselectionsystem.service.impl;

import org.springframework.stereotype.Service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.mapper.SysLogMapper;
import com.pxx.collegecourseselectionsystem.entity.SysLogEntity;
import com.pxx.collegecourseselectionsystem.service.SysLogService;
@Service
public class SysLogServiceImpl extends ServiceImpl<SysLogMapper, SysLogEntity> implements SysLogService{

    @Override
    public int updateBatch(List<SysLogEntity> list) {
        return baseMapper.updateBatch(list);
    }
    @Override
    public int batchInsert(List<SysLogEntity> list) {
        return baseMapper.batchInsert(list);
    }
    @Override
    public int insertOrUpdate(SysLogEntity record) {
        return baseMapper.insertOrUpdate(record);
    }
    @Override
    public int insertOrUpdateSelective(SysLogEntity record) {
        return baseMapper.insertOrUpdateSelective(record);
    }
}
