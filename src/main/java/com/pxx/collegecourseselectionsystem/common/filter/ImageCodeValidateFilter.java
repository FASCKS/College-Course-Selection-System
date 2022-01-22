package com.pxx.collegecourseselectionsystem.common.filter;

import cn.hutool.core.util.StrUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pxx.collegecourseselectionsystem.common.exception.ImageCodeAuthenticationException;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.config.authorize.UnauthorizedEntryPoint;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * 图形验证码过滤器
 */
@Component
@Slf4j
public class ImageCodeValidateFilter extends OncePerRequestFilter {
    @Autowired
    private RedisUtil redisUtil;
    private static final String CAPTCHA_NAME = "captchaUuid";
    private static final String CAPTCHA_CODE = "captchaCode";
    @Autowired
    private UnauthorizedEntryPoint unauthorizedEntryPoint;

    /**
     * Same contract as for {@code doFilter}, but guaranteed to be
     * just invoked once per request within a single request thread.
     * See {@link #shouldNotFilterAsyncDispatch()} for details.
     * <p>Provides HttpServletRequest and HttpServletResponse arguments instead of the
     * default ServletRequest and ServletResponse ones.
     *
     * @param request
     * @param response
     * @param filterChain
     */
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String method = request.getMethod();
        if ("POST".equals(method)) {
            ServletInputStream inputStream = request.getInputStream();
            Map<String, String> map = new ObjectMapper().readValue(inputStream, Map.class);
            String captchaUuid = map.get(CAPTCHA_NAME);
            String captchaCode = map.get(CAPTCHA_CODE);
            String redisCaptchaCode = (String) redisUtil.get(captchaUuid);
            if (StrUtil.isNotBlank(redisCaptchaCode) && redisCaptchaCode.equals(captchaCode)) {
                /*
                 * 验证码认证失败
                 */
                ImageCodeAuthenticationException imageCodeAuthenticationException = new ImageCodeAuthenticationException("验证码错误！");
                unauthorizedEntryPoint.commence(request, response, imageCodeAuthenticationException);
            }
        }
        filterChain.doFilter(request, response);
    }
}
