package com.pxx.collegecourseselectionsystem.service;

import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.dto.SysMenuDto;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;

import java.util.List;

public interface SysMenuService extends IService<SysMenuEntity>{



    /**
     * 返回所有菜单
     * @return
     */
    List<Tree<Integer>> findMenuByType(String roleIds,Integer ...type);

    /**
     * 返回菜单和权限
     * @param type
     * @return
     */
    List<Tree<Integer>> findAllMenuByType(Integer ...type);

    List<SysMenuDto> createTree(List<SysMenuDto> menuEntityList, int pid);

    boolean deleteOneByMenuId(Integer id);
    /**
     * 查找儿子  不包含自己
     * @param departmentList
     * @param dtId
     * @param dtIds
     */
    void getSonDtId(List<SysMenuEntity> departmentList, Integer dtId, List<Integer> dtIds);

    List<Tree<Integer>> findMenuByUrl(String url,String roleStr);

    /**
     * 通过id编辑
     * @param sysMenuEntity
     * @return
     */
    boolean updateOneById(SysMenuEntity sysMenuEntity,String roleStr );
}
