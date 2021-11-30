package com.pxx.collegecourseselectionsystem.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import com.pxx.collegecourseselectionsystem.service.SysUserService;
import io.swagger.annotations.Api;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Positive;

@Validated
@RequestMapping("/sys/users")
@RestController
@Api(tags = "用户管理")
public class SysUserController {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    /**
     * 查询所有用户
     * @param pagination 分页对象
     * @return
     */
    @Operation(summary ="查询所有用户")
    @PreAuthorize("hasAnyAuthority('sys:user:list')")
    @GetMapping("/list")
    public R list(Pagination pagination){
        PageUtils allUser = sysUserService.findAllUser(new Page<>(pagination.getPage(), pagination.getLimit()));
        return R.ok().put("data",allUser);
    }
    /**
     * 添加用户
     * @param sysUserEntity 用户实体
     * @return true 成功 false 失败
     */
    @PreAuthorize("hasAnyAuthority('sys:user:insert')")
    @PostMapping("/insert")
    public R insertUser(@RequestBody SysUserEntity sysUserEntity) {
        String password = sysUserEntity.getPassword();
        sysUserEntity.setPassword(passwordEncoder.encode(password));
        boolean save = sysUserService.save(sysUserEntity);
        return R.ok().put("data", save);
    }

    /**
     * 删除用户
     * @param userId 用户id
     * @return
     */
    @PreAuthorize("hasAnyAuthority('sys:user:delete')")
    @PostMapping("/delete")
    public R delete(@RequestParam("userId") @Positive Long userId){
        boolean removeById = sysUserService.removeById(userId);
        return R.ok().put("data",removeById);
    }

    /**
     * 更新用户
     * @param sysUserEntity 用户实体
     * @return
     */
    @PreAuthorize("hasAnyAuthority('sys:user:update')")
    @PostMapping("/update")
    public R update(@RequestBody SysUserEntity sysUserEntity){
        boolean updateById = sysUserService.updateById(sysUserEntity);
        return R.ok().put("data",updateById);
    }

    /**
     * 用户详情
     * @param userId 用户id
     * @return
     */
    @PreAuthorize("hasAnyAuthority('sys:user:info')")
    @PostMapping("/info")
    public R info(@RequestParam("userId") @Positive Long userId){
        boolean removeById = sysUserService.removeById(userId);
        return R.ok().put("data",removeById);
    }
}
