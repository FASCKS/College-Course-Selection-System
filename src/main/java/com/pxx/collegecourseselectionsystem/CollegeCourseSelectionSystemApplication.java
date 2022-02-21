package com.pxx.collegecourseselectionsystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import springfox.documentation.oas.annotations.EnableOpenApi;
@EnableCaching  //开启缓存
@EnableOpenApi
@EnableGlobalMethodSecurity(prePostEnabled = true)
@SpringBootApplication
public class CollegeCourseSelectionSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(CollegeCourseSelectionSystemApplication.class, args);
    }

}
