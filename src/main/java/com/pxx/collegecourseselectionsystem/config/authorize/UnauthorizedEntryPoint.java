package com.pxx.collegecourseselectionsystem.config.authorize;

import com.pxx.collegecourseselectionsystem.common.utils.IPUtils;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.ResponseUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 未授权统一处理  //WebSecurity
 * 处理认证异常
 */
@Slf4j
public class UnauthorizedEntryPoint implements AuthenticationEntryPoint {
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
        String ipAddr = IPUtils.getIpAddr(request);
        log.info("ip为 {} 的用户访问未授权的url------->{}", ipAddr, request.getRequestURI());
        String message = authException.getMessage();
        ResponseUtil.write(response, R.error(403,message));
    }

}
