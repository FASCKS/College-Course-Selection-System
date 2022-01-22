package com.pxx.collegecourseselectionsystem.config.authorize;

import cn.hutool.json.JSONUtil;
import com.pxx.collegecourseselectionsystem.common.exception.ImageCodeAuthenticationException;
import com.pxx.collegecourseselectionsystem.common.exception.MyAuthenticationException;
import com.pxx.collegecourseselectionsystem.common.exception.TokenSignatureOrExpiredJwtException;
import com.pxx.collegecourseselectionsystem.common.utils.IPUtils;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.ResponseUtil;
import com.pxx.collegecourseselectionsystem.util.Global;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 未授权统一处理  //WebSecurity
 * 处理认证异常
 */
@Slf4j
@Component
public class UnauthorizedEntryPoint implements AuthenticationEntryPoint {
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
        String ipAddr = IPUtils.getIpAddr(request);
        log.info("ip为 {} 的用户访问未授权的url------->{}", ipAddr, request.getRequestURI());
        R r=null;
        if (authException instanceof InsufficientAuthenticationException) {
           r=R.error(403,authException.getMessage());
        }else if (authException instanceof ImageCodeAuthenticationException){
            r = R.error(Global.CAPTCHA_ERROR_CODE, authException.getMessage());
        }else if (authException instanceof TokenSignatureOrExpiredJwtException){
            r=R.error(Global.ACCESS_TOKEN_EXPIRED_CODE,authException.getMessage());
        }else if (authException instanceof MyAuthenticationException){
            r=R.error(Global.ACCESS_TOKEN_WRONG_FORMAT_CODE,authException.getMessage());
        }else {
            r=R.error(403,authException.getMessage());
        }
        ResponseUtil.write(response, JSONUtil.toJsonStr(r));

    }

}
