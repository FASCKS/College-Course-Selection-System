package com.pxx.collegecourseselectionsystem.config.authorize;

import com.pxx.collegecourseselectionsystem.service.impl.SysUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
@EnableWebSecurity
@Configuration
public class TokenWebSecurityConfig extends WebSecurityConfigurerAdapter {
    //自定义查询数据库用户名密码和权限信息
    @Autowired
    private SysUserServiceImpl userDetailsService;
    //token 管理工具类（生成 token）
    @Autowired
    private TokenManager tokenManager;
    //密码管理工具类
    @Autowired
    private BCryptPasswordEncoder defaultPasswordEncoder;
    //redis 操作工具类
    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 配置设置
     */
//设置退出的地址和 token，redis 操作地址
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.exceptionHandling()
//                .authenticationEntryPoint(new UnauthorizedEntryPoint())
                .and().csrf().disable()
                .authorizeRequests()
                .antMatchers("/login","/favicon.ico").permitAll()
                .anyRequest().authenticated()
                .and().formLogin().loginPage("/login")
                .and().logout().logoutUrl("/logout")
                .addLogoutHandler(new TokenLogoutHandler(tokenManager, redisTemplate))
                .and()
                .addFilter(new TokenLoginFilter(authenticationManager(), tokenManager, redisTemplate))
                .addFilter(new TokenAuthenticationFilter(authenticationManager(), tokenManager, redisTemplate))
                .httpBasic();
    }
    @Override
    public void configure(AuthenticationManagerBuilder auth)  throws Exception
    {
        auth.userDetailsService( userDetailsService).passwordEncoder(defaultPasswordEncoder);
    }
    /**
     * 配置哪些请求不拦截
     */
    @Override
    public void configure(WebSecurity web)  throws Exception {
        web.ignoring().antMatchers( "/api/**","/login");
    }
}
