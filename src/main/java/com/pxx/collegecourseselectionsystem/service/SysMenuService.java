package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;

import java.util.List;

public interface SysMenuService extends IService<SysMenuEntity>{


    int updateBatch(List<SysMenuEntity> list);

    int batchInsert(List<SysMenuEntity> list);

    int insertOrUpdate(SysMenuEntity record);

    int insertOrUpdateSelective(SysMenuEntity record);

    /**
     * 返回所有菜单
     * @return
     */
    List<SysMenuEntity> findMenuByType();
    List<SysMenuEntity> createTree(List<SysMenuEntity> menuEntityList, int pid);
}
