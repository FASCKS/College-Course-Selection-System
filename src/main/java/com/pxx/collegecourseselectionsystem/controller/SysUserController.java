package com.pxx.collegecourseselectionsystem.controller;

import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import com.pxx.collegecourseselectionsystem.service.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/sys/users")
@RestController
public class SysUserController {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    /**
     * 添加用户
     * @param sysUserEntity 用户实体
     * @return true 成功 false 失败
     */
    @PostMapping("/insert")
    public R insertUser(@RequestBody SysUserEntity sysUserEntity) {
        String password = sysUserEntity.getPassword();
        sysUserEntity.setPassword(passwordEncoder.encode(password));
        boolean save = sysUserService.save(sysUserEntity);
        return R.ok().put("data", save);
    }

}
