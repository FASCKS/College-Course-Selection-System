package com.pxx.collegecourseselectionsystem.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.exception.RRException;
import com.pxx.collegecourseselectionsystem.dto.unit.UnitNode;
import com.pxx.collegecourseselectionsystem.entity.SysUnitEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysUnitMapper;
import com.pxx.collegecourseselectionsystem.service.SysUnitService;
import com.pxx.collegecourseselectionsystem.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class SysUnitServiceImpl extends ServiceImpl<SysUnitMapper, SysUnitEntity> implements SysUnitService {
    @Autowired
    private SysUnitMapper sysUnitMapper;
@Autowired
private SysUserService sysUserService;


    /**
     * 所有部门
     *
     * @return
     */
    @Override
    public List<Tree<Integer>> findAllUnit() {
        List<SysUnitEntity> sysUnitEntities = baseMapper.findAllByUnitId();
        List<UnitNode<Integer>> nodeList = CollUtil.newArrayList();
        for (SysUnitEntity sysUnitEntity : sysUnitEntities) {
            nodeList.add(new UnitNode<Integer>(sysUnitEntity.getUnitId(),
                    sysUnitEntity.getPid(),
                    sysUnitEntity.getName(),
                    sysUnitEntity.getWeight(),
                    sysUnitEntity.getCode(),
                    sysUnitEntity.getType()));
        }
        //获取最上层节点
        Integer unitIdUp = this.getUnitIdUp(sysUnitEntities);

        List<Tree<Integer>> buildTree = TreeUtil.build(nodeList, unitIdUp,(treeNode,tree)->{
           tree.setId(treeNode.getId());
           tree.setParentId(treeNode.getParentId());
           tree.setWeight(treeNode.getWeight());
           tree.setName(treeNode.getName());
            tree.putExtra("code",treeNode.getCode());
            tree.putExtra("type",treeNode.getType());
        });

        return buildTree;
    }

    /**
     * 获取当前部门最高节点
     */
    private Integer getUnitIdUp(List<SysUnitEntity> sysUnitEntities) {
        Map<Integer,Integer> integerIntegerMap=new HashMap<>(sysUnitEntities.size());
        for (SysUnitEntity sysUnitEntity : sysUnitEntities) {
            integerIntegerMap.put(sysUnitEntity.getUnitId(),sysUnitEntity.getPid());
        }
        for (SysUnitEntity sysUnitEntity : sysUnitEntities) {
            Integer pid = sysUnitEntity.getPid();
            Integer integer = integerIntegerMap.get(pid);
            if (integer==null){
                return pid;
            }
        }

        return null;
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
        getSonDtId(sysUnitEntities, unitId, ids);
        boolean removeById = this.removeById(unitId);
        if (!ids.isEmpty()) {
            boolean removeByIds = this.removeByIds(ids);
        }


        check(ids);
        return true;
    }

    /**
     * 检查部门下面是否有关联
     */
    private void check(List<Integer>  unitIds){
        //检查是否有用户
        {
            if (!unitIds.isEmpty()){
                Integer integer = sysUserService.CountUserByUnitId(unitIds);
                if (integer != null) {
                    throw new RRException("部门下关联"+integer+"个用户");
                }
            }

        }
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
            getSonDtId(sysUnitEntityList, integer, newUnitId);
        }

        return newUnitId;
    }
}
