package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.lang.tree.Tree;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.SysUnitEntity;
import com.pxx.collegecourseselectionsystem.service.SysUnitService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api(tags = "部门模块")
@Validated
@RestController
@RequestMapping("/sys/unit")
public class SysUnitController {
    @Autowired
    private SysUnitService sysUnitService;


    @GetMapping("/tree/list")
    @Operation(summary = "树形部门列表")
    @PreAuthorize("hasAnyAuthority('sys:unit:tree:list')")
    public R list() {
        List<Tree<Integer>> sysUnitEntities = sysUnitService.findAllUnit();
        return R.ok().put("data", sysUnitEntities);
    }

    @GetMapping("/info")
    @Operation(summary = "部门详情")
    @ApiImplicitParam(name = "unitId", value = "用户id", dataTypeClass = Integer.class, required = true, paramType = "query")
    @PreAuthorize("hasAnyAuthority('sys:unit:info')")
    public R info(@RequestParam("unitId") Integer unitId) {
        SysUnitEntity sysUnitEntity = sysUnitService.getById(unitId);
        return R.ok().put("data", sysUnitEntity);
    }

    @PostMapping("/insert")
    @Operation(summary = "部门新增")
    @PreAuthorize("hasAnyAuthority('sys:unit:insert')")
    public R insert(@RequestBody SysUnitEntity sysUnitEntity) {
        boolean save = sysUnitService.save(sysUnitEntity);
        return R.ok().put("data", save);
    }

    @PostMapping("/update")
    @Operation(summary = "部门编辑")
    @PreAuthorize("hasAnyAuthority('sys:unit:update' ,'sys:unit:info')")
    public R update(@RequestBody SysUnitEntity sysUnitEntity) {
        boolean update = sysUnitService.updateById(sysUnitEntity);
        return R.ok().put("data", update);
    }

    @PostMapping("/delete")
    @Operation(summary = "部门删除")
    @PreAuthorize("hasAnyAuthority('sys:unit:delete')")
    public R delete(@RequestParam("unitId") Integer unitId) {
        //删除当前部门和子部门
        boolean removeById = sysUnitService.removeById(unitId);
        return R.ok().put("data", removeById);
    }
}
