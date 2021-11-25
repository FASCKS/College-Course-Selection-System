package com.pxx.collegecourseselectionsystem.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;


@Configuration
public class RepositoryConfig {
    @Bean
    public PersistentTokenRepository tokenRepository(DataSource dataSource) {
        JdbcTokenRepositoryImpl tokenRepository = new JdbcTokenRepositoryImpl();
        tokenRepository.setDataSource(dataSource);
//         tokenRepository.setCreateTableOnStartup(true); // 第一次启动时可使用此功能自动创建表，第二次要关闭，否则表已存在会启动报错
        return tokenRepository;
    }
}
