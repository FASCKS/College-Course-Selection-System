package com.pxx.collegecourseselectionsystem.config.authorize;

import cn.hutool.core.date.DateUtil;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import lombok.extern.slf4j.Slf4j;
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
@Slf4j
@Configuration
public class MyAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        SysUserEntity sysUserEntity =(SysUserEntity) authentication.getPrincipal();
        log.info("用户  {}  于  {}  登录成功",sysUserEntity.getName(), DateUtil.date());
    }
}
