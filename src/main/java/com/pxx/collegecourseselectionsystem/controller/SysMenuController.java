package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.util.StrUtil;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.SpringSecurityUtil;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import com.pxx.collegecourseselectionsystem.service.SysMenuService;
import com.pxx.collegecourseselectionsystem.service.SysRoleMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

@Api(tags = "菜单")
@Validated
@RestController
@RequestMapping("sys/menu")
public class SysMenuController {
    @Autowired
    private SysMenuService sysMenuService;
    @Autowired
    private SysRoleMenuService sysRoleMenuService;

    /**
     * 返回菜单
     *
     * @return
     */
    @ApiOperation("返回所有菜单")
    @GetMapping("/list")
    public R list() {
        String userRoleIds = SpringSecurityUtil.getEntity().getUserRoleIds();
        List<Tree<Integer>> list = sysMenuService.findMenuByType(userRoleIds, 0, 1);
        return R.ok().put("data", list);
    }

    /**
     * 通过url返回菜单 查询当前用户拥有的权限
     */
    @ApiOperation("通过url返回菜单")
    @GetMapping("/get/menu")
    public R getMenuByUrl(@RequestParam("url") @NotBlank String url) {
        String userRoleIds = SpringSecurityUtil.getEntity().getUserRoleIds();
        List<Tree<Integer>> menuByUrl = sysMenuService.findMenuByUrl(url, userRoleIds);
        return R.ok().put("data", menuByUrl);
    }

    /**
     * 返回菜单和权限
     */
    @ApiOperation("返回菜单列表")
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
     * 菜单详情
     */
    @ApiOperation("菜单详情")
    @PreAuthorize("hasAnyAuthority('sys:menu:info')")
    @GetMapping("/insert/{menuId}")
    public R info(@PathVariable("menuId") @NotNull Integer menuId) {
        SysMenuEntity sysMenuEntity = sysMenuService.getById(menuId);
        return R.ok().put("data", sysMenuEntity);

    }

    /**
     * 菜单编辑
     */
    @PreAuthorize("hasAnyAuthority('sys:menu:update')")
    @ApiOperation("菜单编辑")
    @PostMapping("/update")
    public R update(@RequestBody @Validated SysMenuEntity sysMenuEntity) {
        {
            SysMenuEntity sysMenu = sysMenuService.findOneByUrl(sysMenuEntity.getUrl());
            if (sysMenu==null){
                return R.error("url不存在");
            }
        }
        if (sysMenuEntity.getType() == 2) {
            sysMenuEntity.setPerms(sysMenuEntity.getPerms().trim());
            sysMenuEntity.setUrl(null);
        }
        if (sysMenuEntity.getType() == 1 || sysMenuEntity.getType() == 0) {
            sysMenuEntity.setPerms(null);
        }
        //获取菜单关联的角色
        List<Long> longList = sysRoleMenuService.findRoleIdsByMenuId(sysMenuEntity.getMenuId());
        String roleStr = StrUtil.join("_", longList.iterator());
        boolean update = sysMenuService.updateOneById(sysMenuEntity, roleStr);
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
