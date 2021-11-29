package com.pxx.collegecourseselectionsystem.config;

import com.pxx.collegecourseselectionsystem.config.authorize.MyAuthenticationSuccessHandler;
import com.pxx.collegecourseselectionsystem.service.impl.SysUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
@Deprecated
//@Configuration
public class MyWebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private SysUserServiceImpl sysUserService;
    @Autowired
    private PersistentTokenRepository tokenRepository;
    @Autowired
    private MyAuthenticationSuccessHandler myAuthenticationSuccessHandler;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

@Autowired
private LoginValidateAuthenticationProvider loginValidateAuthenticationProvider;
    //认证用户的来源
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .authenticationProvider(loginValidateAuthenticationProvider)
                .userDetailsService(sysUserService)
                .passwordEncoder(bCryptPasswordEncoder);

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        http.csrf().disable().authorizeRequests().anyRequest().permitAll().and().logout().permitAll();
        http
                .formLogin()
                //登录成功处理器
                .successHandler(myAuthenticationSuccessHandler)
                .and()
                .authorizeRequests()
                .antMatchers(
                        "/swagger-ui.html"
                        , "/webjars/**"
                        , "/v2/**"
                        , "/swagger-resources/**",
                        "/js/*",
                        "/static/",
                        "/login"
                        , "/sys/users/insert"
                        ,"/sys/menu/list"
                ).permitAll()
                // 记住我
                .and()
                .rememberMe()
                .tokenRepository(tokenRepository)
                .tokenValiditySeconds(3600 * 24 * 14)
                .userDetailsService(sysUserService)
                // 暂时停用csrf，否则会影响验证
                .and().csrf().disable();
        //注销
        http.logout().logoutUrl("/logout").logoutSuccessUrl("/index").permitAll();
    }

}
