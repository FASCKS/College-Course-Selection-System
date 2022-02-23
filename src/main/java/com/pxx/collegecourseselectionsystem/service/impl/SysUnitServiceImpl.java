package com.pxx.collegecourseselectionsystem.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.SysUnitEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysUnitMapper;
import com.pxx.collegecourseselectionsystem.service.SysUnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

    /**
     * 更新部门
     *
     * @param sysUnitEntity
     * @return
     */
    @Override
    public boolean updateOneById(SysUnitEntity sysUnitEntity) {
        QueryWrapper<SysUnitEntity> sysUnitEntityQueryWrapper = new QueryWrapper<>();
        sysUnitEntityQueryWrapper.eq(SysUnitEntity.COL_UNIT_ID, sysUnitEntity.getUnitId())
                .notIn(SysUnitEntity.COL_PID, sysUnitEntity.getUnitId());
        int update = sysUnitMapper.update(sysUnitEntity, sysUnitEntityQueryWrapper);
        return update > 0;
    }

    @Override
    @Transactional
    public boolean deleteOneById(Integer unitId) {
        // 级联删除部门
        List<SysUnitEntity> sysUnitEntities = this.list();
        List<Integer> ids = new ArrayList<>();
        getSonDtId(sysUnitEntities,unitId,ids);
        if (!ids.isEmpty()){
            boolean removeByIds = this.removeByIds(ids);
        }
        boolean removeById = this.removeById(unitId);

        return true;
    }
    @Override
    public void getSonDtId(List<SysUnitEntity> departmentList, Integer dtId, List<Integer> dtIds) {
        for (SysUnitEntity department : departmentList) {
            if (dtId.equals(department.getPid())) {
                dtIds.add(department.getUnitId());
                getSonDtId(departmentList, department.getUnitId(), dtIds);
            }
        }
    }

    @Override
    public void getSonDtId(List<SysUnitEntity> departmentList, Integer dtId, Set<Integer> dtIds) {
        for (SysUnitEntity department : departmentList) {
            if (dtId.equals(department.getPid())) {
                dtIds.add(department.getUnitId());
                getSonDtId(departmentList, department.getUnitId(), dtIds);
            }
        }
    }

    /**
     * 通过用户id查询用户能查询的范围
     *
     * @param userId
     */
    @Override
    public Set<Integer> findUnitIdByUserId(Long userId) {
        Set<Integer> unitIdByUserId = baseMapper.findUnitIdByUserId(userId);
        Set<Integer> newUnitId = new HashSet<>(unitIdByUserId);
        List<SysUnitEntity> sysUnitEntityList = this.list();
        for (Integer integer : unitIdByUserId) {
            getSonDtId(sysUnitEntityList,integer,newUnitId);
        }

        return newUnitId;
    }
}
