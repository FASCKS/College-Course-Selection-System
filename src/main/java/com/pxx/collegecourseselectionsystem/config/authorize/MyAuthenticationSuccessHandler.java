package com.pxx.collegecourseselectionsystem.config.authorize;

import cn.hutool.core.date.DateUtil;
import com.pxx.collegecourseselectionsystem.entity.SysLogEntity;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import com.pxx.collegecourseselectionsystem.service.SysLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 登录成功处理器
 */
@Slf4j@Deprecated
@Configuration
public class MyAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Autowired
    private SysLogService sysLogService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        SysUserEntity sysUserEntity =(SysUserEntity) authentication.getPrincipal();
        log.info("用户  {}  于  {}  登录成功",sysUserEntity.getUsername(), DateUtil.date());
        SysLogEntity sysLogEntity=new SysLogEntity();
        sysLogEntity.setUsername(sysUserEntity.getUsername());
        sysLogEntity.setOperation("登录平台");
        sysLogEntity.setMethod(" com.pxx.collegecourseselectionsystem.config.authorize.MyAuthenticationSuccessHandler.onAuthenticationSuccess()");
        sysLogService.save(sysLogEntity);

    }
}
