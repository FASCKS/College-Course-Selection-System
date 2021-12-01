package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.SysUnitEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysUnitMapper;
import com.pxx.collegecourseselectionsystem.service.SysUnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class SysUnitServiceImpl extends ServiceImpl<SysUnitMapper, SysUnitEntity> implements SysUnitService{
@Autowired
private SysUnitMapper sysUnitMapper;
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

    @Override
    public List<SysUnitEntity> createTree(List<SysUnitEntity> unitEntityList, int pid) {
        List<SysUnitEntity> newTree = new ArrayList<>();
        for (SysUnitEntity sysUnitEntity : unitEntityList) {
            Integer menuId = sysUnitEntity.getPid();
            if (Objects.equals(menuId, pid)) {
                newTree.add(sysUnitEntity);
                sysUnitEntity.setUnitEntityList(createTree(unitEntityList, sysUnitEntity.getUnitId()));
            }
        }
        return newTree;
    }

    /**
     * 所有部门
     *
     * @return
     */
    @Override
    public List<SysUnitEntity> findAllUnit() {
        List<SysUnitEntity> list = this.list();
        List<SysUnitEntity> tree = createTree(list, 0);
        return tree;
    }
}
