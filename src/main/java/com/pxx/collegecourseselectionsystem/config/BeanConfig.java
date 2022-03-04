package com.pxx.collegecourseselectionsystem.config;

import org.springframework.amqp.support.converter.DefaultClassMapper;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class BeanConfig {
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Bean
    public Jackson2JsonMessageConverter jsonMessageConverter() {

        Jackson2JsonMessageConverter jsonConverter = new Jackson2JsonMessageConverter();
        jsonConverter.setClassMapper(classMapper());
        return jsonConverter;
    }

    @Bean
    public DefaultClassMapper classMapper() {

        DefaultClassMapper classMapper = new DefaultClassMapper();
        Map<String, Class<?>> idClassMapping = new HashMap<>();


        classMapper.setIdClassMapping(idClassMapping);
        return classMapper;
    }
}
