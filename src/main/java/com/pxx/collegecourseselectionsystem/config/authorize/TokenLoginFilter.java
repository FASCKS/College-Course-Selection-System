package com.pxx.collegecourseselectionsystem.config.authorize;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ReUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.spring.SpringUtil;
import cn.hutool.json.JSONObject;
import com.pxx.collegecourseselectionsystem.common.exception.MyAuthenticationException;
import com.pxx.collegecourseselectionsystem.common.utils.*;
import com.pxx.collegecourseselectionsystem.entity.SysLogEntity;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import com.pxx.collegecourseselectionsystem.service.SysLogService;
import com.pxx.collegecourseselectionsystem.service.SysUnitService;
import com.pxx.collegecourseselectionsystem.service.SysUserService;
import com.pxx.collegecourseselectionsystem.service.impl.SysLogServiceImpl;
import com.pxx.collegecourseselectionsystem.service.impl.SysUnitServiceImpl;
import com.pxx.collegecourseselectionsystem.service.impl.SysUserServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Slf4j
public class TokenLoginFilter extends UsernamePasswordAuthenticationFilter {
    private AuthenticationManager authenticationManager;
    private TokenManager tokenManager;
    public static final String SPRING_SECURITY_FORM_USERNAME_KEY = "username";
    public static final String SPRING_SECURITY_FORM_PASSWORD_KEY = "password";
    private  SysLogService sysLogService ;
    private  SysUserService sysUserService ;
    private SysUnitService sysUnitService=SpringUtil.getBean(SysUnitServiceImpl.class);


    public TokenLoginFilter(AuthenticationManager authenticationManager, TokenManager tokenManager) {
        this.sysLogService=SpringUtil.getBean(SysLogServiceImpl.class);
        this.sysUserService=SpringUtil.getBean(SysUserServiceImpl.class);
        this.authenticationManager = authenticationManager;
        this.tokenManager = tokenManager;
        this.setPostOnly(true);
        this.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher("/login", "POST"));
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest req, HttpServletResponse res) throws AuthenticationException {
        ServletRequest requestWrapper;
        String username = null;
        String password = null;
        try {
             requestWrapper = new BodyReaderHttpServletRequestWrapper(req);
            ServletInputStream inputStream = requestWrapper.getInputStream();
            String body = IOUtils.toString(inputStream, StandardCharsets.UTF_8);
            JSONObject jsonObject = new JSONObject(body);
            username = (String) jsonObject.get(SPRING_SECURITY_FORM_USERNAME_KEY);
            password = (String) jsonObject.get(SPRING_SECURITY_FORM_PASSWORD_KEY);
        } catch (IOException e) {
            throw new MyAuthenticationException("Full authentication is required to access this resource");
        }
        username = (username != null) ? username : "";
        username = username.trim();
        password = (password != null) ? password : "";
        username = username.trim();
        if (StrUtil.isBlank(username) || StrUtil.isBlank(password)){
            throw new MyAuthenticationException("用户名或密码不能为空.");
        }
        //用户名匹配中文，英文字母和数字及下划线
        boolean matchUserName = ReUtil.isMatch("^[\\u4e00-\\u9fa5_a-zA-Z0-9]+$", username);
        if (!matchUserName){
            throw new MyAuthenticationException("用户名格式错误,不能含有特殊字符.");
        }
        boolean matchPassword = ReUtil.isMatch("^[_a-zA-Z0-9]+$", password);
        if (!matchPassword){
            throw new MyAuthenticationException("密码格式错误,不能含有特殊字符.");
        }

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
        RedisUtil cache = SpringUtil.getBean(RedisUtil.class);//redis工具


        Map<String, Object> redisMap = new HashMap<>(4);


        SysUserEntity user = (SysUserEntity) auth.getPrincipal();
        String accessIdToken = tokenManager.createAccessIdToken(user.getUsername());
        String refreshToken = tokenManager.createRefreshIdToken(user.getUsername());
        //缓存用户所能看到部门
        Set<Integer> unitIdByUserId = sysUnitService.findUnitIdByUserId(user.getUserId());
        redisMap.put("unit_ids",unitIdByUserId);
        //缓存用户权限
        redisMap.put("authorities", user.getAuthorities());
        //缓存用户当前的 access_token
        redisMap.put("access_token", accessIdToken);
        //缓存用户当前的 access_token
        redisMap.put("refresh_token", refreshToken);
        //缓存当前实体
//        user.setRoleEntityList(null);
        user.setMenuEntityList(null);
        user.setPassword(null);
        redisMap.put("entity", user);

//        缓存当前登录用户 refreshToken 创建的起始时间，这个会在刷新accessToken方法中 判断是否要重新生成(刷新)refreshToken时用到
        redisMap.put("start_time", System.currentTimeMillis());
        cache.hmset("UserDetail:"+user.getUsername(), redisMap);
        //记录日志
        SysLogEntity sysLogEntity = new SysLogEntity();
        sysLogEntity.setUsername(user.getUsername());
        sysLogEntity.setOperation("登录平台");
        sysLogEntity.setTime(0L);
        sysLogEntity.setCreateDate(DateUtil.date());
        sysLogEntity.setIp(IPUtils.getIpAddr(req));
        sysLogService.save(sysLogEntity);
        //记录登录时间
        user.setLastLoginTime(DateUtil.date());
        sysUserService.updateById(user);
        log.info("用户  {}  于  {}  登录成功", user.getUsername(), DateUtil.date());
        ResponseUtil.write(res, R.ok()
                .put("access_token", accessIdToken)
                .put("refresh_token", refreshToken)
        );
    }

    /**
     * 登录失败
     */
    @Override
    protected void unsuccessfulAuthentication(HttpServletRequest request,
                                              HttpServletResponse response,
                                              AuthenticationException e) throws IOException, ServletException {

        SysLogServiceImpl sysLogService = SpringUtil.getBean(SysLogServiceImpl.class);
        SysLogEntity sysLogEntity = new SysLogEntity();
        sysLogEntity.setOperation("尝试登录");
        sysLogEntity.setTime(0L);
        sysLogEntity.setCreateDate(DateUtil.date());
        sysLogEntity.setIp(IPUtils.getIpAddr(request));

        sysLogService.save(sysLogEntity);

        log.info("ip为 {} 的用户在 {} 登录失败", IPUtils.getIpAddr(request), DateUtil.date());
        if (e instanceof BadCredentialsException) {
            ResponseUtil.write(response, R.error(403, "用户名或密码错误!"));
        } else {
            ResponseUtil.write(response, R.error(403, e.getMessage()));
        }

    }


}
