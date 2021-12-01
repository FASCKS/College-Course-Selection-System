package com.pxx.collegecourseselectionsystem.config.authorize;

import cn.hutool.core.util.StrUtil;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.ResponseUtil;
import com.pxx.collegecourseselectionsystem.config.UserGrantedAuthority;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.SignatureException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.access.AccessDeniedException;
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
import java.util.List;

/**
 * 授权
 */
@Slf4j
public class TokenAuthenticationFilter extends BasicAuthenticationFilter {
    private TokenManager tokenManager;
    private RedisTemplate<String, Object> redisTemplate;

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
        }catch (ExpiredJwtException e){
            ResponseUtil.write(response,R.error(401,"access_token expired"));
        }catch (SignatureException e){
            ResponseUtil.write(response,R.error(403,"access_token not match locally computed signature."));
        }catch (AccessDeniedException e){
            ResponseUtil.write(response,R.error(401,"Access is denied"));
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            ResponseUtil.write(response, R.error());
        }
        if (authentication != null) {
            // 将认证信息存入 Spring 安全上下文中
            SecurityContextHolder.getContext().setAuthentication(authentication);
        } else {
            ResponseUtil.write(response,R.error(403,"Token invalidation"));
        }
        chain.doFilter(request, response);
    }

    private UsernamePasswordAuthenticationToken getAuthentication(HttpServletRequest request) {
        String token = request.getHeader("access_token");
        if (token != null && !"".equals(token.trim())) {
            String userName = tokenManager.getUserFromToken(token);
            String user_access_token =(String) redisTemplate.opsForValue().get(userName + "_access_token");
            if (user_access_token ==null || !user_access_token.equals(token)){
                return null;
            }
            Collection<UserGrantedAuthority> authorities  = (List<UserGrantedAuthority>) redisTemplate.opsForValue().get(userName);
            if (!StrUtil.isEmpty(userName)) {
                return new UsernamePasswordAuthenticationToken(userName, token, authorities);
            }
            return null;
        }
        return null;
    }
}
