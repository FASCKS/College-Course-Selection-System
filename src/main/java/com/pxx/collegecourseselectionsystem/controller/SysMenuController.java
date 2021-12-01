package com.pxx.collegecourseselectionsystem.controller;

import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import com.pxx.collegecourseselectionsystem.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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
        return R.ok().put("data", list);
    }
    /**
     * 当前用户权限
     */


}
