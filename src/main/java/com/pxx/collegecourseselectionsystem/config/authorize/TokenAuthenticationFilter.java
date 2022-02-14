package com.pxx.collegecourseselectionsystem.config.authorize;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.spring.SpringUtil;
import com.pxx.collegecourseselectionsystem.common.exception.MyAuthenticationException;
import com.pxx.collegecourseselectionsystem.common.exception.TokenSignatureOrExpiredJwtException;
import com.pxx.collegecourseselectionsystem.config.UserGrantedAuthority;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import com.pxx.collegecourseselectionsystem.util.Global;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;

/**
 * 授权
 */
@Slf4j
public class TokenAuthenticationFilter extends BasicAuthenticationFilter {
    private TokenManager tokenManager;
    private RedisTemplate<String, Object> redisTemplate;
    private final UnauthorizedEntryPoint unauthorizedEntryPoint=SpringUtil.getBean(UnauthorizedEntryPoint.class);


    public TokenAuthenticationFilter(AuthenticationManager authManager, TokenManager tokenManager, RedisTemplate redisTemplate) {
        super(authManager);
        this.tokenManager = tokenManager;
        this.redisTemplate = redisTemplate;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        UsernamePasswordAuthenticationToken authentication = null;
        try {
            authentication = getAuthentication(request);
        }catch (ExpiredJwtException | SignatureException e){
            //token过期 或 token签名不匹配
            unauthorizedEntryPoint.commence(request,response,new TokenSignatureOrExpiredJwtException("Full authentication is required to access this resource"));
            return;
        }catch (MalformedJwtException malformedJwtException){
            //token 格式错误异常
            unauthorizedEntryPoint.commence(request,response,new MyAuthenticationException("access_token wrong format"));
            return;
        }

        // 将认证信息存入 Spring 安全上下文中
        SecurityContextHolder.getContext().setAuthentication(authentication);
        chain.doFilter(request, response);
    }

    private UsernamePasswordAuthenticationToken getAuthentication(HttpServletRequest request) {
        String token = request.getHeader("access_token");
        if (token != null && !"".equals(token.trim())) {
            String userName = tokenManager.getUserFromToken(token);
            String user_access_token =(String) redisTemplate.opsForHash().get("UserDetail:"+userName, "access_token");

            if (user_access_token ==null || !user_access_token.equals(token)){
                return null;
            }
            Collection<UserGrantedAuthority> authorities  = Convert.toList(UserGrantedAuthority.class,redisTemplate.opsForHash().get(Global.REDIS_USER_DETAIL+userName,"authorities"));
            if (!StrUtil.isEmpty(userName)) {
                SysUserEntity sysUserEntity =(SysUserEntity) redisTemplate.opsForHash().get("UserDetail:"+userName, "entity");
                return new UsernamePasswordAuthenticationToken(sysUserEntity, token, authorities);
            }
            return null;
        }
        return null;
    }
}
