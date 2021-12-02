package com.pxx.collegecourseselectionsystem.controller;

import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;
import com.pxx.collegecourseselectionsystem.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.Positive;
import java.util.List;
@Validated
@RestController
@RequestMapping("/sys/role")
public class SysRoleController {
    @Autowired
    private SysRoleService sysRoleService;

    /**
     * 角色列表
     * @return
     */
    @GetMapping("/list")
    public R list() {
        List<SysRoleEntity> sysRoleEntityList = sysRoleService.list();
        return R.ok().put("data", sysRoleEntityList);
    }
    /**
     * 角色详情
     */
    @GetMapping("/info")
    public R info(@RequestParam("roleId") @Positive Long roleId){
        SysRoleEntity sysRoleEntity= sysRoleService.findRoleInfoByRoleId(roleId);
        return R.ok().put("data",sysRoleEntity);
    }
    /**
     * 角色更新
     */

}
