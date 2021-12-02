package com.pxx.collegecourseselectionsystem.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * spring boot默认静态资源的路径是/static ，也就是说不用配置也可以访问静态资源文件，引入activity工作流后，直接访问static下的静态资源就访问不了了。
 */
@Configuration
@Slf4j
@EnableWebMvc
public class StaticResourceConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
    }
}
