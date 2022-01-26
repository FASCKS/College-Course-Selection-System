package com.pxx.collegecourseselectionsystem.entity;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.pxx.collegecourseselectionsystem.annotation.Telephone;
import com.pxx.collegecourseselectionsystem.common.validator.group.Update;
import com.pxx.collegecourseselectionsystem.config.UserGrantedAuthority;
import com.pxx.collegecourseselectionsystem.entity.enums.SexEnum;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Range;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@ToString
@ApiModel("用户类")
@TableName(value = "sys_user")
public class SysUserEntity implements UserDetails {
    /**
     * 用户id
     */
    @Positive
    @NotNull(groups = Update.class)
    @ApiModelProperty(value = "用户id")
    @TableId(value = "user_id", type = IdType.AUTO)
    private Long userId;
    /**
     * 用户名称
     */
    @ApiModelProperty(value = "用户姓名")
    @NotBlank(message = "用户名不能为空")
    @TableField(value = "`name`")
    private String name;

    /**
     * 工号或学号 账号
     */
    @NotBlank
    @ApiModelProperty(value = "账号/用户名")
    @TableField(value = "`number`")
    private String number;

    /**
     * 年龄
     */
    @ApiModelProperty(value = "年龄")
    @Range(min = 16, max = 120, message = "年龄最小不能小于 16 ,最大不能大于120")
    @TableField(value = "age")
    private Integer age;


    /**
     * 密码
     */
    @ApiModelProperty(value = "密码")
    @TableField(value = "`password`")
    private String password;

    /**
     * 账号类型 1 学生 2 老师 3主任 3其它人员
     */

    @ApiModelProperty(value = "账号类型")
    @TableField(value = "`type`")
    private Integer type;

    /**
     * 邮箱
     */
    @Email
    @ApiModelProperty(value = "邮箱")
    @TableField(value = "email")
    private String email;
    /**
     * 电话号码
     */
    @Telephone
    @ApiModelProperty(value = "电话号码")
    @TableField("tel")
    private String tel;

    /**
     * 家庭地址
     */
    @ApiModelProperty(value = "家庭地址")
    @TableField(value = "address")
    private String address;

    /**
     * 头像地址
     */
    @ApiModelProperty(value = "头像路径")
    @TableField(value = "avatar")
    private String avatar;

    /**
     * 用户状态 1 开 0 关
     */
    @ApiModelProperty(value = "账户是否被锁 1 开 0 关",example = "1")
    @TableField(value = "`state`")
    private Integer state;
    /**
     * 账号是否可用
     */
    @ApiModelProperty(value = "账户是否可用 1 开 0 关",example = "1")
    @TableField(value = "enable")
    private Integer enable;


    /**
     * 乐观锁
     */
    @ApiModelProperty(value = "乐观锁")
    @Version
    @TableField(value = "revision", fill = FieldFill.INSERT)
    private Integer revision;

    /**
     * 锁定时间
     */
    @JsonIgnore
    @JsonFormat (pattern = DatePattern.NORM_DATETIME_PATTERN)
    @ApiModelProperty(value = "账号封禁的时间",example = "2022-01-22 10:33:11")
    @TableField(value = "lock_time",fill = FieldFill.INSERT)
    private Date lockTime;

    /**
     * 创建时间
     */
    @JsonIgnore
    @JsonFormat (pattern = DatePattern.NORM_DATETIME_PATTERN)
    @ApiModelProperty(value = "创建时间",hidden = true,example = "2022-01-22 10:33:11")
    @TableField(value = "created_time", fill = FieldFill.INSERT)
    private Date createdTime;

    /**
     * 创建人
     */
    @JsonIgnore
    @ApiModelProperty(value = "创建人id",hidden = true)
    @TableField(value = "created_by", fill = FieldFill.INSERT)
    private String createdBy;

    /**
     * 更新时间
     */
    @JsonIgnore
    @JsonFormat (pattern = DatePattern.NORM_DATETIME_PATTERN)
    @ApiModelProperty(value = "更新时间",hidden = true)
    @TableField(value = "updated_time", fill = FieldFill.INSERT_UPDATE)
    private Date updatedTime;
    /**
     * 登录
     */
    @JsonIgnore
    @JsonFormat (pattern = DatePattern.NORM_DATETIME_PATTERN)
    @ApiModelProperty(value = "登录时间",example = "2022-01-22 10:33:11")
    @TableField(value = "last_login_time", fill = FieldFill.INSERT_UPDATE)
    private Date lastLoginTime;

    /**
     * 更新人
     */
    @JsonIgnore
    @ApiModelProperty(value = "更新人id",hidden = true)
    @TableField(value = "updated_by", fill = FieldFill.INSERT_UPDATE)
    private String updatedBy;
    /**
     * 用户部门
     */
    @ApiModelProperty(value = "部门id")
    @TableField(value = "unit_id")
    private Integer unitId;
    /**
     * 性别 0 女 1 男 2 保密
     */
    @ApiModelProperty(value = "性别")
    @TableField("sex")
    private SexEnum sex;
    /**
     * 用户角色名称合集
     */
    @ApiModelProperty(value = "用户角色名称合集",hidden = true)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @TableField(exist = false)
    private List<SysRoleEntity> roleEntityList;
    /**
     * 用户权限集合
     */
    @ApiModelProperty(value = "用户权限集合",hidden = true)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @TableField(exist = false)
    private List<SysMenuEntity> menuEntityList;



    public static final String COL_ID = "id";

    public static final String COL_NAME = "name";
    public static final String COL_UNIT_ID = "unit_id";

    public static final String COL_NUMBER = "number";

    public static final String COL_AGE = "age";
    public static final String COL_SEX = "sex";

    public static final String COL_SALT = "salt";

    public static final String COL_PASSWORD = "password";

    public static final String COL_TYPE = "type";

    public static final String COL_EMAIL = "email";
    public static final String COL_TEL = "tel";

    public static final String COL_ADDRESS = "address";

    public static final String COL_AVATAR = "avatar";

    public static final String COL_STATE = "state";
    public static final String COL_ENABLE = "enable";

    public static final String COL_REVISION = "revision";

    public static final String COL_LOCK_TIME = "lock_time";

    public static final String COL_CREATED_TIME = "created_time";

    public static final String COL_CREATED_BY = "created_by";

    public static final String COL_UPDATED_TIME = "updated_time";

    public static final String COL_UPDATED_BY = "updated_by";
    @JsonIgnore
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<UserGrantedAuthority> authorities = new ArrayList<>();
        //添加角色
        if (roleEntityList != null) {
            for (SysRoleEntity role : roleEntityList) {
                if (StrUtil.isNotBlank(role.getRoleName())) {
                    authorities.add(new UserGrantedAuthority("ROLE_" + role.getRoleName()));
                }
            }
        }

        //添加权限
        if (menuEntityList != null) {
            for (SysMenuEntity sysMenuEntity : menuEntityList) {
                if (StrUtil.isNotBlank(sysMenuEntity.getPerms())) {
                    authorities.add(new UserGrantedAuthority(sysMenuEntity.getPerms()));
                }
            }
        }

        return authorities;
    }
    @Override
    public String getPassword() {
        return this.password;
    }
    @JsonIgnore
    @Override
    public String getUsername() {
        return this.getNumber();
    }

    /**
     * 判断账户是否过期
     *
     * @return
     */
    @JsonIgnore
    @Override
    public boolean isAccountNonExpired() {
        return this.lockTime.compareTo(DateUtil.date()) < 0;
    }

    /**
     * 判断账户是否被锁
     *
     * @return
     */
    @JsonIgnore
    @Override
    public boolean isAccountNonLocked() {
        return state > 0;
    }

    /**
     * 当前账户密码是否过期
     *
     * @return
     */
    @JsonIgnore
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    /**
     * 判断当前账户是否可用
     *
     * @return
     */
    @JsonIgnore
    @Override
    public boolean isEnabled() {
        return this.enable > 0;
    }

}