package com.pxx.collegecourseselectionsystem.service;

import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.dto.SysMenuDto;
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
    List<Tree<Integer>> findMenuByType();

    List<SysMenuDto> createTree(List<SysMenuDto> menuEntityList, int pid);
}
