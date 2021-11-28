package com.pxx.collegecourseselectionsystem.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;

import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import org.apache.ibatis.reflection.MetaObject;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    private static final String createdBy = "createdBy"; //创建人
    private static final String createTime = "createdTime"; // 创建时间
    private static final String updatedBy = "updatedBy"; //更新人
    private static final String updateTime = "updatedTime"; //更新时间
    private static final String revision = "revision"; //乐观锁

    @Override
    public void insertFill(MetaObject metaObject) {
        this.setFieldValByName(revision, 1, metaObject);
        this.setFieldValByName(createdBy, getName(), metaObject);
        this.setFieldValByName(updatedBy,getName(),metaObject);
        this.setFieldValByName(updateTime, new Date(), metaObject);
        this.setFieldValByName(createTime, new Date(), metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName(updatedBy, getName(), metaObject);
        this.setFieldValByName(updateTime, new Date(), metaObject);
    }

    private Integer getName() {
//        SysUserEntity userDetails = (SysUserEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

/*        Object principal = SecurityUtils.getSubject().getPrincipal();
        if (principal instanceof User) {
            String userName = ((User) principal).getUserName();
            return userName;
        }
        if (principal instanceof Personnel) {
            Personnel personnel = (Personnel) principal;
            return personnel.getName();
        }*/

        return 1;
    }


}
