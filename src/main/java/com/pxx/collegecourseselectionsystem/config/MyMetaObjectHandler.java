package com.pxx.collegecourseselectionsystem.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
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
        this.setFieldValByName(createdBy, getUserName(), metaObject);
        this.setFieldValByName(updatedBy, getUserName(), metaObject);
        this.setFieldValByName(updateTime, new Date(), metaObject);
        this.setFieldValByName(createTime, new Date(), metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName(updatedBy, getUserName(), metaObject);
        this.setFieldValByName(updateTime, new Date(), metaObject);
    }

    private Long getUserId() {
//        final Long userId = SpringSecurityUtil.getUserId();
        return 1L;
    }

    private String getUserName() {
//        final String username = SpringSecurityUtil.getUsername();
        return "admin";
    }

}
