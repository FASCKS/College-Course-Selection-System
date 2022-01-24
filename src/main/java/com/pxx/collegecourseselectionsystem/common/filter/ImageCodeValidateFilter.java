package com.pxx.collegecourseselectionsystem.common.filter;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONObject;
import com.pxx.collegecourseselectionsystem.common.exception.ImageCodeAuthenticationException;
import com.pxx.collegecourseselectionsystem.common.utils.BodyReaderHttpServletRequestWrapper;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.config.authorize.UnauthorizedEntryPoint;
import com.pxx.collegecourseselectionsystem.util.Global;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

/**
 * 图形验证码过滤器
 */
@Component
@Slf4j
public class ImageCodeValidateFilter extends OncePerRequestFilter {
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private UnauthorizedEntryPoint unauthorizedEntryPoint;
    private static final String CAPTCHA_NAME = "captchaUuid";
    private static final String CAPTCHA_CODE = "captchaCode";
    @Value("${captcha}")
    private boolean captcha;

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
        if ("POST".equals(method) && "/login".equals(request.getRequestURI()) && captcha) {
            ServletRequest requestWrapper = new BodyReaderHttpServletRequestWrapper(request);
            ServletInputStream inputStream = requestWrapper.getInputStream();
            String body = IOUtils.toString(inputStream, StandardCharsets.UTF_8);
            JSONObject jsonObject = new JSONObject(body);
            String captchaUuid = Global.CAPTCHA_PREFIX_NAME + "_" + (String) jsonObject.get(CAPTCHA_NAME);
            String captchaCode = Convert.toStr(jsonObject.get(CAPTCHA_CODE)).toLowerCase().trim();
            String redisCaptchaCode = Convert.toStr(redisUtil.get(captchaUuid)).toLowerCase();
            /*
             * 验证码认证失败
             */
            if (StrUtil.isBlank(redisCaptchaCode) || !redisCaptchaCode.equals(captchaCode)) {
                unauthorizedEntryPoint.commence(request, response, new ImageCodeAuthenticationException("验证码错误！"));
                return;
            }
            /*
             * 不管是否验证成功。都要删除验证码
             */
//            redisUtil.del(captchaUuid);
            filterChain.doFilter(requestWrapper, response);
        }else{
            filterChain.doFilter(request, response);
        }

    }
}
