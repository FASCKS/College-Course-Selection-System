package com.pxx.collegecourseselectionsystem.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.pxx.collegecourseselectionsystem.common.utils.SpringSecurityUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

@Slf4j
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    private static final String createdBy = "createdBy"; //创建人
    private static final String createTime = "createdTime"; // 创建时间
    private static final String updatedBy = "updatedBy"; //更新人
    private static final String updateTime = "updatedTime"; //更新时间
    private static final String revision = "revision"; //乐观锁
    private static final String unitId = "unitId"; //权限范围

    @Override
    public void insertFill(MetaObject metaObject) {
        this.setFieldValByName(revision, 1, metaObject);
        this.setFieldValByName(createdBy, getUserName(), metaObject);
        this.setFieldValByName(updatedBy, getUserName(), metaObject);
        this.setFieldValByName(updateTime, new Date(), metaObject);
        this.setFieldValByName(createTime, new Date(), metaObject);
        this.setFieldValByName(unitId, getUnitId(), metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName(updatedBy, getUserName(), metaObject);
        this.setFieldValByName(updateTime, new Date(), metaObject);
        this.setFieldValByName(unitId, getUnitId(), metaObject);
    }

    private Long getUserId() {
//        final Long userId = SpringSecurityUtil.getUserId();
        return 1L;
    }

    private String getUserName() {
//        final String username = SpringSecurityUtil.getUsername();
        return "admin";
    }

    private Integer getUnitId() {
        Integer unitId = 1;
        try {
            unitId = SpringSecurityUtil.getEntity().getUnitId();
        } catch (Exception e) {
            log.error("当前链接没有用户实体");
        }
        return unitId;
    }
}
