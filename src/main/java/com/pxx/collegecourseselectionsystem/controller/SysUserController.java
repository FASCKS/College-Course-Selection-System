package com.pxx.collegecourseselectionsystem.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import com.pxx.collegecourseselectionsystem.service.SysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Positive;

@Validated
@RequestMapping("/sys/users")
@RestController
@Api(tags = "用户模块",value = "用户UserController")
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
    @ApiOperation("分页用户列表")
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
    @ApiOperation("用户新增")
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
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId",value = "用户id",dataTypeClass = Long.class,required = true,paramType = "query")
    })
    @ApiOperation("用户删除")
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
    @ApiOperation("用户编辑")
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
    @ApiImplicitParam(name = "userId",value = "用户id",dataTypeClass = Long.class,required = true,paramType = "query")
    @ApiOperation("用户详情")
    @PreAuthorize("hasAnyAuthority('sys:user:info')")
    @PostMapping("/info")
    public R info(@RequestParam("userId") @Positive Long userId){
        boolean removeById = sysUserService.removeById(userId);
        return R.ok().put("data",removeById);
    }

    /**
     * 获得当前登录用户信息
     * @return
     */
    @ApiOperation("当前登录用户信息")
    @GetMapping("/my")
    public R my(){
        String username = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
       SysUserEntity sysUserEntity= sysUserService.findOneByUserName(username);
        sysUserEntity.setPassword(null);
        return R.ok().put("data",sysUserEntity);

    }

}
