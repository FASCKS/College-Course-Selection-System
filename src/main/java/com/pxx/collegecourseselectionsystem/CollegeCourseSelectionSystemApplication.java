package com.pxx.collegecourseselectionsystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;

@EnableGlobalMethodSecurity(prePostEnabled = true)
@SpringBootApplication
public class CollegeCourseSelectionSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(CollegeCourseSelectionSystemApplication.class, args);
    }

}
