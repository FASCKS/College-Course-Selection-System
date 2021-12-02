package com.pxx.collegecourseselectionsystem.common.utils;

import org.springframework.security.core.context.SecurityContextHolder;

public class SpringSecurityUtil {
    /**
     * 获取当前用户的用户名
     * @return
     */
    public static String getUsername(){
        String username = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return username;
    }
}
