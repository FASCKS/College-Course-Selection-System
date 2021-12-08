package com.pxx.collegecourseselectionsystem.controller;

import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;
import com.pxx.collegecourseselectionsystem.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

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
    @PreAuthorize("hasAnyAuthority('sys:role:list')")
    @GetMapping("/list")
    public R list() {
        List<SysRoleEntity> sysRoleEntityList = sysRoleService.list();
        return R.ok().put("data", sysRoleEntityList);
    }
    /**
     * 角色详情
     */
    @PreAuthorize("hasAnyAuthority('sys:role:info')")
    @GetMapping("/info")
    public R info(@RequestParam("roleId") @Positive Long roleId){
        SysRoleEntity sysRoleEntity= sysRoleService.findRoleInfoByRoleId(roleId);
        return R.ok().put("data",sysRoleEntity);
    }
    /**
     * 角色更新
     */
    @PreAuthorize("hasAnyAuthority('sys:role:update')")
    @PostMapping("/update")
    public R update(@RequestBody SysRoleEntity sysRoleEntity){
        boolean updateOneRole = sysRoleService.updateOneRole(sysRoleEntity);
        return R.ok().put("data",updateOneRole);
    }
    /**
     * 角色删除
     */
    @PreAuthorize("hasAnyAuthority('sys:role:delete')")
    @PostMapping("/delete")
    public R delete(@RequestParam("roleId") Long roleId){
        boolean removeById = sysRoleService.removeById(roleId);
        return R.ok().put("data",removeById);
    }
    /**
     * 角色新增
     */
    @PreAuthorize("hasAnyAuthority('sys:role:insert')")
    @PostMapping("/insert")
    public R insert(@RequestBody SysRoleEntity sysRoleEntity){
        boolean insertOneRole =   sysRoleService.insertOneRole(sysRoleEntity);
        return R.ok().put("data",insertOneRole);
    }
}
