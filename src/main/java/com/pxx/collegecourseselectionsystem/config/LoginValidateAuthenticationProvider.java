package com.pxx.collegecourseselectionsystem.config;

import cn.hutool.core.util.StrUtil;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import com.pxx.collegecourseselectionsystem.service.impl.SysUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

/**
 * 登录流程
 */
@Component
public class LoginValidateAuthenticationProvider implements AuthenticationProvider {
    @Autowired
    private SysUserServiceImpl sysUserService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        //获取输入的用户名
        String username = authentication.getName();
        //获取输入的明文
        String rawPassword = (String) authentication.getCredentials();
        //查询用户是否存在
        SysUserEntity userEntity = (SysUserEntity) sysUserService.loadUserByUsername(username);

        if (!userEntity.isEnabled()) {
            throw new DisabledException("该账户已被禁用，请联系管理员");
        } else if (!userEntity.isAccountNonLocked()) {
            throw new LockedException("该账号已被锁定");
        } else if (!userEntity.isAccountNonExpired()) {
            throw new AccountExpiredException(StrUtil.format("该账号被封禁至 {} ，请联系管理员", userEntity.getLockTime()));
        } else if (!userEntity.isCredentialsNonExpired()) {
            throw new CredentialsExpiredException("该账户的登录凭证已过期，请重新登录");
        }

        //验证密码
        if (!bCryptPasswordEncoder.matches(rawPassword,userEntity.getPassword())){
            throw new BadCredentialsException("密码或用户名错误!");
        }

        return new UsernamePasswordAuthenticationToken(userEntity, rawPassword);

    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}
