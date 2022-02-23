package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.lang.tree.Tree;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import com.pxx.collegecourseselectionsystem.service.SysMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;
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
     *
     * @return
     */
    @ApiOperation("返回所有菜单")
    @GetMapping("/list")
    public R list() {
        List<Tree<Integer>> list = sysMenuService.findMenuByType(0, 1);
        return R.ok().put("data", list);
    }

    /**
     * 通过url返回菜单
     */
    @ApiOperation("通过url返回菜单")
    @GetMapping("/get/menu")
    public R getMenuByUrl(@RequestParam("url") String url) {
        List<Tree<Integer>> menuByUrl = sysMenuService.findMenuByUrl(url);
        return R.ok().put("data",menuByUrl);
    }

    /**
     * 返回菜单和权限
     */
    @ApiOperation("返回菜单和权限")
    @PreAuthorize("hasAnyAuthority('sys:menu:list:menu')")
    @GetMapping("/list/menu")
    public R listMenu() {
        List<Tree<Integer>> list = sysMenuService.findAllMenuByType(0, 1, 2);
        return R.ok().put("data", list);
    }

    /**
     * 新增菜单
     */
    @ApiOperation("菜单新增")
    @PreAuthorize("hasAnyAuthority('sys:menu:insert')")
    @PostMapping("/insert")
    public R insert(@RequestBody @Validated SysMenuEntity sysMenuEntity) {
        if (sysMenuEntity.getType() == 2) {
            sysMenuEntity.setPerms(sysMenuEntity.getPerms().trim());
            sysMenuEntity.setUrl(null);
        }
        if (sysMenuEntity.getType() == 1 || sysMenuEntity.getType() == 0) {
            sysMenuEntity.setPerms(null);
        }
        boolean save = sysMenuService.save(sysMenuEntity);

        return R.ok().put("data", save);
    }

    /**
     * 菜单编辑
     */
    @PreAuthorize("hasAnyAuthority('sys:menu:update')")
    @ApiOperation("菜单编辑")
    @PostMapping("/update")
    public R update(@RequestBody @Validated SysMenuEntity sysMenuEntity) {
        boolean update = sysMenuService.updateById(sysMenuEntity);
        return R.ok().put("data", update);
    }

    /**
     * 菜单删除
     */
    @ApiOperation("菜单删除")
    @PreAuthorize("hasAnyAuthority('sys:menu:delete')")
    @GetMapping("/delete")
    public R delete(@RequestParam("id") @NotNull Integer id) {

        boolean delete = sysMenuService.deleteOneByMenuId(id);

        return R.ok().put("data", delete);
    }


}
