package com.pxx.collegecourseselectionsystem.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.validator.group.Update;
import com.pxx.collegecourseselectionsystem.dto.SysUserDto;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import com.pxx.collegecourseselectionsystem.service.SysUserService;
import com.pxx.collegecourseselectionsystem.util.Global;
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

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import java.util.Date;
import java.util.List;

@Validated
@RequestMapping("/sys/users")
@RestController
@Api(tags = "用户模块", value = "用户UserController")
public class SysUserController {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    /**
     * 查询所有用户
     *
     * @param pagination 分页对象
     * @return
     */
    @ApiImplicitParams({
            @ApiImplicitParam(name = "type",value = "账号类型 1 学生 2 老师 3主任 3其它人员",required = true,example = "1"),
            @ApiImplicitParam(name = "name",value = "人员名字",required = false,example = "张三")

    })
    @ApiOperation("分页用户列表")
    @PreAuthorize("hasAnyAuthority('sys:user:list')")
    @GetMapping("/list")
    public R list(Pagination pagination,
                  @NotNull @RequestParam("type") Integer type,
                   @RequestParam(value = "name",required = false) String name) {
        PageUtils allUser = sysUserService.findAllUser(
                new Page<>(pagination.getPage(), pagination.getLimit()),
                type,
                name);
        return R.ok().put("data", allUser);
    }

    /**
     * 添加用户
     *
     * @param sysUserEntity 用户实体
     * @return true 成功 false 失败
     */
    @ApiOperation("用户新增")
    @PreAuthorize("hasAnyAuthority('sys:user:insert')")
    @PostMapping("/insert")
    public R insertUser(@Validated @RequestBody SysUserDto sysUserEntity) {
        String password = sysUserEntity.getPassword();
        sysUserEntity.setPassword(passwordEncoder.encode(password));
        sysUserEntity.setUserId(null);
        sysUserEntity.setEnable(1);
        sysUserEntity.setState(1);
        sysUserEntity.setLockTime(new Date());
        sysUserEntity.setLastLoginTime(new Date());
        boolean save = sysUserService.insertOneUser(sysUserEntity);
        return R.ok().put("data", save);
    }

    /**
     * 删除用户
     *
     * @param userIds 多个用户id
     * @return
     */
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userIds", value = "用户id",required = true)
    })
    @ApiOperation("用户删除")
    @PreAuthorize("hasAnyAuthority('sys:user:delete')")
    @PostMapping("/delete")
    public R delete(@NotEmpty @RequestBody List<Long> userIds) {
        if (userIds.contains(Global.SUPER_ADMINISTRATOR_USER_ID)){
            return R.error("不能删除超级管理员");
        }
        boolean removeById = sysUserService.removeBatchByIds(userIds);
        return R.ok().put("data", removeById);
    }

    /**
     * 更新用户
     *
     * @param sysUserEntity 用户实体
     * @return
     */
    @ApiOperation("用户编辑")
    @PreAuthorize("hasAnyAuthority('sys:user:update')")
    @PostMapping("/update")
    public R update(@RequestBody @Validated(Update.class) SysUserDto sysUserEntity) {
        sysUserEntity.setPassword(null);
        sysUserEntity.setNumber(null);
        boolean updateById = sysUserService.updateOneUser(sysUserEntity);
        return R.ok().put("data", updateById);
    }

    /**
     * 用户详情
     *
     * @param userId 用户id
     * @return
     */
    @ApiImplicitParam(name = "userId", value = "用户id", dataTypeClass = Long.class, required = true, paramType = "path")
    @ApiOperation("用户详情")
    @PreAuthorize("hasAnyAuthority('sys:user:info','sys:user:update')")
    @PostMapping("/info/{userId}")
    public R info(@PathVariable("userId") @Positive Long userId) {
        SysUserDto sysUserEntity = sysUserService.findOneByUserId(userId);
        return R.ok().put("data", sysUserEntity);
    }

    /**
     * 获得当前登录用户信息
     *
     * @return
     */
    @ApiOperation("当前登录用户信息")
    @GetMapping("/my")
    public R my() {
        String username = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        SysUserEntity sysUserEntity = sysUserService.findOneByUserName(username);
        sysUserEntity.setPassword(null);
        return R.ok().put("data", sysUserEntity);
    }

    /**
     * 更新密码
     * 可更新选定用户
     */
    @PreAuthorize("hasAnyAuthority('sys:user:password')")
    @ApiOperation("更新密码")
    @PostMapping("/password")
    public R password(
          @Positive @NotNull(message = "用户名不能为空") @RequestParam("userId") Long userId,
          @NotEmpty(message = "旧密码不能为空") @RequestParam("password") String password,
          @NotEmpty(message = "新密码不能为空")  @RequestParam("newPassword") String newPassword) {

        boolean updateById = sysUserService.updateOneUserPassword(userId, password, newPassword);

        return R.ok().put("data",updateById);
    }
    /**
     * 只能更新自己密码
     */
    @PreAuthorize("hasAnyAuthority('sys:my:password')")
    @ApiOperation("更新密码")
    @PostMapping("/my/password")
    public R password(
            @NotEmpty(message = "旧密码不能为空") @RequestParam("password") String password,
            @NotEmpty(message = "新密码不能为空")  @RequestParam("newPassword") String newPassword) {

        boolean updateById = sysUserService.updateOneUserPassword(null, password, newPassword);

        return R.ok().put("data",updateById);
    }
    /**
     * 管理员重置密码
     */
    @PreAuthorize("hasAnyAuthority('sys:user:reset')")
    @ApiOperation("重置密码为固定值")
    @PostMapping("/reset/password")
    public R resetPassword(@Positive @NotNull(message = "用户名不能为空") @RequestParam("userId") Long userId){
        boolean resetPassword = sysUserService.updateOneUserPassword(userId, null, "123456");
        return R.ok().put("data",resetPassword);
    }
}
