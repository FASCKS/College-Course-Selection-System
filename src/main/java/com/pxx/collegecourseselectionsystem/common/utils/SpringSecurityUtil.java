package com.pxx.collegecourseselectionsystem.common.utils;

import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import org.springframework.security.core.context.SecurityContextHolder;

public class SpringSecurityUtil {
    /**
     * 获取当前用户的用户名
     * @return
     */
    public static String getUsername(){
       SysUserEntity sysUserEntity=(SysUserEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return sysUserEntity.getUsername();
    }
    public static SysUserEntity getEntity(){
        SysUserEntity sysUserEntity=(SysUserEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return sysUserEntity;
    }
    public static Long getUserId(){
        SysUserEntity sysUserEntity=(SysUserEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return sysUserEntity.getUserId();
    }
}
