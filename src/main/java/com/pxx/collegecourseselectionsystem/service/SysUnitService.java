package com.pxx.collegecourseselectionsystem.service;

import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.entity.SysUnitEntity;

import java.util.List;
import java.util.Set;

public interface SysUnitService extends IService<SysUnitEntity>{


    int updateBatch(List<SysUnitEntity> list);

    int batchInsert(List<SysUnitEntity> list);

    int insertOrUpdate(SysUnitEntity record);

    int insertOrUpdateSelective(SysUnitEntity record);


    /**
     * 所有部门
     * @return
     */
    List<Tree<Integer>> findAllUnit();

    /**
     * 更新部门
     * @param sysUnitEntity
     * @return
     */
    boolean updateOneById(SysUnitEntity sysUnitEntity);

    boolean deleteOneById(Integer unitId);

    /**
     * 查找儿子  不包含自己
     * @param departmentList
     * @param dtId
     * @param dtIds
     */
     void getSonDtId(List<SysUnitEntity> departmentList, Integer dtId, List<Integer> dtIds);
     void getSonDtId(List<SysUnitEntity> departmentList, Integer dtId, Set<Integer> dtIds);
    /**
     * 通过用户id查询用户能查询的范围
     */
    Set<Integer> findUnitIdByUserId(Long userId);
}
