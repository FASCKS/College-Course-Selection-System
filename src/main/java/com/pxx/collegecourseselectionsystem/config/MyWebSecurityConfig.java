package com.pxx.collegecourseselectionsystem.config;

import cn.hutool.core.convert.Convert;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import com.pxx.collegecourseselectionsystem.service.impl.SysUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Configuration
public class MyWebSecurityConfig  extends WebSecurityConfigurerAdapter {
    @Autowired
    private SysUserServiceImpl sysUserService;
    @Autowired
    private PersistentTokenRepository tokenRepository;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    //认证用户的来源
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(sysUserService).passwordEncoder(passwordEncoder());

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        http.csrf().disable().authorizeRequests().anyRequest().permitAll().and().logout().permitAll();
        http
                .formLogin()
                .and()
                .authorizeRequests()
                //管理员都可以访问
                // 设置不需要授权的请求
                .antMatchers("/js/*",
                        "/static/",
                        "/login",
                        "/sys/users/insert"
                ).permitAll()

                // 其它任何请求都需要验证权限
                .anyRequest().authenticated()
//                // 设置自定义表单登录页面
//                .and().formLogin().loginPage("/login")
//
//                // 设置登录验证请求地址为自定义登录页配置action （"/login/form"）
//                .loginProcessingUrl("/login/form")
//
//                // 设置默认登录成功跳转页面
//                .defaultSuccessUrl("/main.html")
                // 添加记住我功能
                .and().rememberMe().tokenRepository(tokenRepository)
                // 有效期为两周
                .tokenValiditySeconds(3600 * 24 * 14)
                // 设置UserDetailsService
                .userDetailsService(sysUserService)
                // 暂时停用csrf，否则会影响验证
                .and().csrf().disable();
        //注销
        http.logout().logoutUrl("/logout").logoutSuccessUrl("/index").permitAll();
    }

}
