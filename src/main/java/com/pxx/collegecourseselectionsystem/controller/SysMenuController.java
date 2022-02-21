package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.lang.tree.Tree;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import com.pxx.collegecourseselectionsystem.service.SysMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api(tags = "菜单")
@Validated
@RestController
@RequestMapping("sys/menu")
public class SysMenuController {
    @Autowired
    private SysMenuService sysMenuService;

    /**
     * 返回菜单
     * @return
     */
    @ApiOperation("返回所有菜单")
    @GetMapping("/list")
    public R list() {
        List<Tree<Integer>> list = sysMenuService.findMenuByType(0,1);
        return R.ok().put("data", list);
    }
    /**
     * 返回菜单和权限
     */
    @ApiOperation("返回菜单和权限")
    @GetMapping("/list/menu")
    public R listMenu() {
        List<Tree<Integer>> list = sysMenuService.findMenuByType(0,1,2);
        return R.ok().put("data", list);
    }
    /**
     * 新增菜单
     */
    @ApiOperation("菜单新增")
    @PostMapping("/insert")
    public R insert(@RequestBody @Validated SysMenuEntity sysMenuEntity) {
        boolean save = sysMenuService.save(sysMenuEntity);

        return R.ok().put("data", save);
    }

    /**
     * 菜单编辑
     */
    @ApiOperation("菜单编辑")
    @PostMapping("/update")
    public R update(@RequestBody @Validated SysMenuEntity sysMenuEntity) {
        boolean update = sysMenuService.updateById(sysMenuEntity);
        return R.ok().put("data", update);
    }

}
