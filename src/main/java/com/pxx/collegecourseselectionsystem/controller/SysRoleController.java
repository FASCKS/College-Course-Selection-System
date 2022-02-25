package com.pxx.collegecourseselectionsystem.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.validator.group.Update;
import com.pxx.collegecourseselectionsystem.dto.SysRoleDto;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;
import com.pxx.collegecourseselectionsystem.service.SysRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Positive;
import java.util.List;
@Api(tags = "角色类")
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
    @ApiOperation("角色列表")
    @PreAuthorize("hasAnyAuthority('sys:role:list')")
    @GetMapping("/list")
    public R list(Pagination pagination) {
        Page<SysRoleEntity> page=new Page<>(pagination.getPage(), pagination.getLimit());

        PageUtils sysRoleEntityList = sysRoleService.findAllRole(page);
        return R.ok().put("data", sysRoleEntityList);
    }
    /**
     * 角色详情
     */
    @ApiOperation("角色详情")
    @ApiImplicitParam(name = "roleId",value = "角色id",defaultValue = "1",required = true)
    @PreAuthorize("hasAnyAuthority('sys:role:info')")
    @GetMapping("/info")
    public R info(@RequestParam("roleId") @Positive Long roleId){
        SysRoleEntity sysRoleEntity= sysRoleService.findRoleInfoByRoleId(roleId);
        return R.ok().put("data",sysRoleEntity);
    }
    /**
     * 角色更新
     */
    @ApiOperation("角色编辑")
    @PreAuthorize("hasAnyAuthority('sys:role:update')")
    @PostMapping("/update")
    public R update(@RequestBody @Validated({Update.class}) SysRoleDto sysRoleEntity){
        boolean updateOneRole = sysRoleService.updateOneRole(sysRoleEntity);
        return R.ok().put("data",updateOneRole);
    }
    /**
     * 角色删除
     */
    @ApiOperation("角色删除")
    @ApiImplicitParam(name = "roleIds",value = "角色id",required = true)
    @PreAuthorize("hasAnyAuthority('sys:role:delete')")
    @PostMapping("/delete")
    public R delete(@NotEmpty @RequestBody List<Long> roleIds){
        boolean removeById = sysRoleService.deleteRoleById(roleIds);
        return R.ok().put("data",removeById);
    }
    /**
     * 角色新增
     */
    @ApiOperation("角色新增")
    @PreAuthorize("hasAnyAuthority('sys:role:insert')")
    @PostMapping("/insert")
    public R insert(@RequestBody @Validated(Insert.class) SysRoleDto sysRoleEntity){
        boolean insertOneRole =   sysRoleService.insertOneRole(sysRoleEntity);
        return R.ok().put("data",insertOneRole);
    }
}
