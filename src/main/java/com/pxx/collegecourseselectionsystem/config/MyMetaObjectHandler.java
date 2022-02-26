package com.pxx.collegecourseselectionsystem.config;

import cn.hutool.core.util.IdUtil;
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
    private static final String uuid = "uuid"; //uuid

    @Override
    public void insertFill(MetaObject metaObject) {
        this.setFieldValByName(revision, 1, metaObject);
        this.setFieldValByName(createdBy, getUserName(), metaObject);
        this.setFieldValByName(updatedBy, getUserName(), metaObject);
        this.setFieldValByName(updateTime, new Date(), metaObject);
        this.setFieldValByName(createTime, new Date(), metaObject);
        this.setFieldValByName(unitId, getUnitId(), metaObject);
        this.setFieldValByName(uuid, getUuid(), metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName(updatedBy, getUserName(), metaObject);
        this.setFieldValByName(updateTime, new Date(), metaObject);
        this.setFieldValByName(unitId, getUnitId(), metaObject);
    }

    private Long getUserId() {
         Long userId =1L;
         try {
             userId = SpringSecurityUtil.getUserId();
         }catch (Exception e){
             log.error("当前链接没有用户实体");
         }
        return userId;
    }

    private String getUserName() {
         String username ="admin";
        try {
            username = SpringSecurityUtil.getUsername();
        }catch (Exception e){
            log.error("当前链接没有用户实体");
        }
        return username;
    }
    private String getUuid(){
        return IdUtil.simpleUUID();
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
