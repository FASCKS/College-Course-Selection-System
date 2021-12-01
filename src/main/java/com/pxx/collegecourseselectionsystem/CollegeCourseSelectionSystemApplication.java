package com.pxx.collegecourseselectionsystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import springfox.documentation.oas.annotations.EnableOpenApi;

@EnableOpenApi
@EnableGlobalMethodSecurity(prePostEnabled = true)
@SpringBootApplication
public class CollegeCourseSelectionSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(CollegeCourseSelectionSystemApplication.class, args);
    }

}
