package com.pxx.collegecourseselectionsystem.config.authorize;

import cn.hutool.core.date.DateUtil;
import cn.hutool.extra.spring.SpringUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pxx.collegecourseselectionsystem.common.utils.IPUtils;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.ResponseUtil;
import com.pxx.collegecourseselectionsystem.entity.SysLogEntity;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import com.pxx.collegecourseselectionsystem.service.impl.SysLogServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
@Slf4j
public class TokenLoginFilter extends UsernamePasswordAuthenticationFilter {
    private AuthenticationManager authenticationManager;
    private TokenManager tokenManager;
    private RedisTemplate<String, Object> redisTemplate;
    public static final String SPRING_SECURITY_FORM_USERNAME_KEY = "username";
    public static final String SPRING_SECURITY_FORM_PASSWORD_KEY = "password";
    private static final AntPathRequestMatcher DEFAULT_ANT_PATH_REQUEST_MATCHER = new AntPathRequestMatcher("/login", "POST");


    public TokenLoginFilter(AuthenticationManager authenticationManager, TokenManager tokenManager, RedisTemplate redisTemplate) {
        this.authenticationManager = authenticationManager;
        this.tokenManager = tokenManager;
        this.redisTemplate = redisTemplate;
        this.setPostOnly(true);
        this.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher("/login", "POST"));
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest req, HttpServletResponse res) throws AuthenticationException {
        String username = null;
        String password = null;
        try {
            Map<String,String> map =new ObjectMapper().readValue(req.getInputStream(), Map.class);
            username = map.get(SPRING_SECURITY_FORM_USERNAME_KEY);
            password = map.get(SPRING_SECURITY_FORM_PASSWORD_KEY);
        } catch (IOException e) {
            log.error("json解析错误,传入的用户名 {} ，密码 {} ",SPRING_SECURITY_FORM_USERNAME_KEY,SPRING_SECURITY_FORM_PASSWORD_KEY);
            e.printStackTrace();
        }

        username = (username != null) ? username : "";
        username = username.trim();
        password = (password != null) ? password : "";
        username = username.trim();


        UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password);
        setDetails(req, authRequest);

        return authenticationManager.authenticate(authRequest);

    }

    /**
     * 登录成功
     */
    @Override
    protected void successfulAuthentication(HttpServletRequest req,
                                            HttpServletResponse res, FilterChain chain,
                                            Authentication auth) throws IOException, ServletException {
        SysUserEntity user = (SysUserEntity) auth.getPrincipal();
        String token = tokenManager.createToken(user.getUsername());

        redisTemplate.opsForValue().set(user.getUsername(),user.getAuthorities());

        SysLogServiceImpl sysLogService = SpringUtil.getBean(SysLogServiceImpl.class);

        log.info("用户  {}  于  {}  登录成功",user.getUsername(), DateUtil.date());
        SysLogEntity sysLogEntity=new SysLogEntity();
        sysLogEntity.setUsername(user.getUsername());
        sysLogEntity.setOperation("登录平台");
        sysLogEntity.setTime(0L);
        sysLogEntity.setCreateDate(DateUtil.date());
        sysLogEntity.setIp(IPUtils.getIpAddr(req));
        sysLogService.save(sysLogEntity);

        ResponseUtil.write(res, R.ok().put("token", token));
    }

    /**
     * 登录失败
     */
    @Override
    protected void unsuccessfulAuthentication(HttpServletRequest request,
                                              HttpServletResponse response,
                                              AuthenticationException e) throws IOException, ServletException {

        SysLogServiceImpl sysLogService = SpringUtil.getBean(SysLogServiceImpl.class);
        SysLogEntity sysLogEntity=new SysLogEntity();
        sysLogEntity.setOperation("尝试登录");
        sysLogEntity.setTime(0L);
        sysLogEntity.setCreateDate(DateUtil.date());
        sysLogEntity.setIp(IPUtils.getIpAddr(request));

        sysLogService.save(sysLogEntity);

        log.info("ip为 {} 的用户在 {} 登录失败",IPUtils.getIpAddr(request),DateUtil.date());
        ResponseUtil.write(response, R.error(403,e.getMessage()));

    }


}
