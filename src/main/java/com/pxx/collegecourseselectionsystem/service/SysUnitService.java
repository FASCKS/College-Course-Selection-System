package com.pxx.collegecourseselectionsystem.service;

import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.entity.SysUnitEntity;

import java.util.List;
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
}
