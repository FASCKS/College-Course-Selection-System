package com.pxx.collegecourseselectionsystem.config.authorize;

import com.pxx.collegecourseselectionsystem.config.LoginValidateAuthenticationProvider;
import com.pxx.collegecourseselectionsystem.service.impl.SysUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.time.Duration;
import java.util.Collections;

//@EnableWebSecurity
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
    private RedisTemplate<String, Object> redisTemplate;
    @Autowired
    private LoginValidateAuthenticationProvider loginValidateAuthenticationProvider;

    @Autowired
    private SysUserServiceImpl sysUserService;
    @Autowired
    private PersistentTokenRepository tokenRepository;
    @Autowired
    private TokenLogoutHandler tokenLogoutHandler;
    /**
     * 配置设置
     */
//设置退出的地址和 token，redis 操作地址
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.exceptionHandling()
                .authenticationEntryPoint(new UnauthorizedEntryPoint())
                .and().cors()
                .configurationSource(corsConfigurationSource())
                .and().csrf().disable()
                .authorizeRequests()
                .anyRequest().authenticated()
                .and().logout().logoutUrl("/logout")
                .addLogoutHandler(tokenLogoutHandler)
                .and()
                .addFilter(new TokenLoginFilter(authenticationManager(), tokenManager, redisTemplate))
                .addFilter(new TokenAuthenticationFilter(authenticationManager(), tokenManager, redisTemplate)).httpBasic();


    }
    @Override
    public void configure(AuthenticationManagerBuilder auth)  throws Exception
    {
        auth.authenticationProvider(loginValidateAuthenticationProvider).userDetailsService( userDetailsService).passwordEncoder(defaultPasswordEncoder);
    }

    /**
     * 此方法配置的资源路径不会进入 Spring Security 机制进行验证
     */
    @Override
    public void configure(WebSecurity web)  throws Exception {
        web.ignoring().antMatchers(
                        "/swagger-resources/**",
                        "/webjars/**",
                        "/v2/**",
                        "/swagger-ui.html/**"
                )
                .antMatchers(HttpMethod.GET,"/login");
    }

    /**
     * 跨域支持
     * @return
     */
    @Bean

    public CorsConfigurationSource corsConfigurationSource() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowCredentials(true);
        configuration.setAllowedOriginPatterns(Collections.singletonList("*"));
        configuration.setAllowedMethods(Collections.singletonList("*"));
        configuration.setAllowedHeaders(Collections.singletonList("*"));
        configuration.setMaxAge(Duration.ofHours(1));
        source.registerCorsConfiguration("/**", configuration);
        return source;

    }

}

