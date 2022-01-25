package com.pxx.collegecourseselectionsystem.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.SysUnitEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysUnitMapper;
import com.pxx.collegecourseselectionsystem.service.SysUnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysUnitServiceImpl extends ServiceImpl<SysUnitMapper, SysUnitEntity> implements SysUnitService {
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


    /**
     * 所有部门
     *
     * @return
     */
    @Override
    public List<Tree<Integer>> findAllUnit() {
        List<SysUnitEntity> sysUnitEntities = this.list();
        List<TreeNode<Integer>> nodeList = CollUtil.newArrayList();
        for (SysUnitEntity sysUnitEntity : sysUnitEntities) {
            nodeList.add(new TreeNode<Integer>(sysUnitEntity.getUnitId(),
                    sysUnitEntity.getPid(),
                    sysUnitEntity.getName(), 1));
        }
        List<Tree<Integer>> buildTree = TreeUtil.build(nodeList, 0);


        return buildTree;
    }
}
