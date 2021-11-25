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

@Slf4j
@RequestMapping("/sys/users")
@RestController
public class SysUserController {
    @Autowired
    private SysUserService sysUserService;

    @PostMapping("/insert")
    public R insertUser(@RequestBody SysUserEntity sysUserEntity) {
        boolean save = sysUserService.save(sysUserEntity);
        return R.ok().put("data", save);
    }
}
