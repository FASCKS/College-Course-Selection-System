package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.lang.tree.Tree;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.service.SysMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@Api(tags = "菜单")
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
        List<Tree<Integer>> list = sysMenuService.findMenuByType();
        return R.ok().put("data", list);
    }
    /**
     * 当前用户权限
     */


}
