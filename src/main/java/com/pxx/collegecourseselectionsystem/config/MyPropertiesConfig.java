package com.pxx.collegecourseselectionsystem.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/3/2 14:57
 */
@Data
@Component
@ConfigurationProperties(prefix = "ccss")
public class MyPropertiesConfig {
    private List<String> tables;
}
