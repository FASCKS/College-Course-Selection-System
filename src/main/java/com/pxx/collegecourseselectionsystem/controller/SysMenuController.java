package com.pxx.collegecourseselectionsystem.controller;

import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import com.pxx.collegecourseselectionsystem.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("sys/menu")
public class SysMenuController {
    @Autowired
    private SysMenuService sysMenuService;

    /**
     * 返回菜单
     *
     * @return
     */
    @GetMapping("/list")
    public R list() {
        List<SysMenuEntity> list = sysMenuService.findMenuByType();
        List<SysMenuEntity> tree = createTree(list, 0);
        return R.ok().put("data", tree);

    }

    /**
     * 改成树
     */
    private List<SysMenuEntity> createTree(List<SysMenuEntity> src, Integer pid) {
        List<SysMenuEntity> newTree = new ArrayList<>();
        for (SysMenuEntity sysMenuEntity : src) {
            Integer menuId = sysMenuEntity.getParentId();
            if (Objects.equals(menuId, pid)) {
                newTree.add(sysMenuEntity);
                sysMenuEntity.setMenuEntities(createTree(src, sysMenuEntity.getMenuId()));
            }
        }
        return newTree;
    }


}
