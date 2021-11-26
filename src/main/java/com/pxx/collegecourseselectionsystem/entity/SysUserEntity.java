package com.pxx.collegecourseselectionsystem.entity;

import cn.hutool.core.date.DatePattern;
import com.baomidou.mybatisplus.annotation.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.catalina.User;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Getter
@Setter
@ToString
@TableName(value = "sys_user")
public class SysUserEntity implements UserDetails {
    /**
     * 用户id
     */
    @TableId(value = "user_id", type = IdType.AUTO)
    private Long userId;

    /**
     * 用户名称
     */
    @TableField(value = "`name`")
    private String name;

    /**
     * 工号或学号
     */
    @TableField(value = "`number`")
    private String number;

    /**
     * 年龄
     */
    @TableField(value = "age")
    private Integer age;

    /**
     * 盐
     */
    @Deprecated
    @TableField(value = "salt")
    private String salt;

    /**
     * 密码
     */
    @TableField(value = "`password`")
    private String password;

    /**
     * 账号类型 1 学生 2 老师 3其它人员
     */
    @TableField(value = "`type`")
    private Integer type;

    /**
     * 邮箱
     */
    @TableField(value = "email")
    private String email;

    /**
     * 家庭地址
     */
    @TableField(value = "address")
    private String address;

    /**
     * 头像地址
     */
    @TableField(value = "avatar")
    private String avatar;

    /**
     * 用户状态 1 开 0 关
     */
    @TableField(value = "`state`")
    private Integer state;

    /**
     * 乐观锁
     */
    @Version
    @TableField(value = "revision", fill = FieldFill.INSERT)
    private Integer revision;

    /**
     * 锁定时间
     */
    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    @TableField(value = "lock_time")
    private Date lockTime;

    /**
     * 创建时间
     */
    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    @TableField(value = "created_time", fill = FieldFill.INSERT)
    private Date createdTime;

    /**
     * 创建人
     */
    @TableField(value = "created_by", fill = FieldFill.INSERT)
    private Integer createdBy;

    /**
     * 更新时间
     */
    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    @TableField(value = "updated_time", fill = FieldFill.INSERT_UPDATE)
    private Date updatedTime;

    /**
     * 更新人
     */
    @TableField(value = "updated_by", fill = FieldFill.INSERT_UPDATE)
    private Integer updatedBy;
    /**
     * 用户角色名称合集
     */
    @TableField(exist = false)
    private List<SysRoleEntity> roleEntityList;
    /**
     * 用户权限集合
     */
    @TableField(exist = false)
    private List<SysMenuEntity> menuEntityList;

    public static final String COL_ID = "id";

    public static final String COL_NAME = "name";

    public static final String COL_NUMBER = "number";

    public static final String COL_AGE = "age";

    public static final String COL_SALT = "salt";

    public static final String COL_PASSWORD = "password";

    public static final String COL_TYPE = "type";

    public static final String COL_EMAIL = "email";

    public static final String COL_ADDRESS = "address";

    public static final String COL_AVATAR = "avatar";

    public static final String COL_STATE = "state";

    public static final String COL_REVISION = "revision";

    public static final String COL_LOCK_TIME = "lock_time";

    public static final String COL_CREATED_TIME = "created_time";

    public static final String COL_CREATED_BY = "created_by";

    public static final String COL_UPDATED_TIME = "updated_time";

    public static final String COL_UPDATED_BY = "updated_by";
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        //添加角色
        if (roleEntityList!=null){
            for (SysRoleEntity role : roleEntityList) {
                authorities.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
            }
        }

        //添加权限
        if (menuEntityList!=null){
            for (SysMenuEntity sysMenuEntity : menuEntityList) {
                authorities.add(new SimpleGrantedAuthority(sysMenuEntity.getPerms()));
            }
        }

        return authorities;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return this.getNumber();
    }

    /**
     * 判断账户是否过期
     *
     * @return
     */
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    /**
     * 判断账户是否被锁
     *
     * @return
     */
    @Override
    public boolean isAccountNonLocked() {
        return state > 0;
    }

    /**
     * 当前账户密码是否过期
     *
     * @return
     */
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    /**
     * 判断当前账户是否可用
     *
     * @return
     */
    @Override
    public boolean isEnabled() {
        return true;
    }

}