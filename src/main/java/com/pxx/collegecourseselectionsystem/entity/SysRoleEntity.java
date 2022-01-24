package com.pxx.collegecourseselectionsystem.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.List;

/**
    * 角色
    */
@Api(tags = "角色类")
@Getter
@Setter
@ToString
@TableName(value = "sys_role")
public class SysRoleEntity {
    @ApiModelProperty("角色id")
    @TableId(value = "role_id", type = IdType.AUTO)
    private Long roleId;

    /**
     * 角色名称
     */
    @ApiModelProperty("角色名称")
    @TableField(value = "role_name")
    private String roleName;

    /**
     * 备注
     */
    @ApiModelProperty("角色备注")
    @TableField(value = "remark")
    private String remark;

    /**
     * 乐观锁
     */
    @JsonIgnore
    @TableField(value = "REVISION")
    private Integer revision;

    /**
     * 创建人
     */
    @JsonIgnore
    @TableField(value = "created_by",fill = FieldFill.INSERT)
    private String createdBy;

    /**
     * 创建时间
     */
    @JsonIgnore
    @TableField(value = "created_time",fill = FieldFill.INSERT)
    private Date createdTime;

    /**
     * 更新人
     */
    @JsonIgnore
    @TableField(value = "updated_by",fill = FieldFill.INSERT_UPDATE)
    private String updatedBy;

    /**
     * 更新时间
     */
    @JsonIgnore
    @TableField(value = "updated_time",fill = FieldFill.INSERT_UPDATE)
    private Date updatedTime;
    /**
     * 权限集合
     */
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @TableField(exist = false)
    private List<SysMenuEntity> sysMenuEntities;
    /**
     * 新增得菜单id数组
     */
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @TableField(exist = false)
    @ApiModelProperty("新增权限需要得菜单id")
    private List<Long> MenuAuthorityIds;

    public static final String COL_ROLE_ID = "role_id";

    public static final String COL_ROLE_NAME = "role_name";

    public static final String COL_REMARK = "remark";

    public static final String COL_REVISION = "REVISION";

    public static final String COL_CREATED_BY = "created_by";

    public static final String COL_CREATED_TIME = "created_time";

    public static final String COL_UPDATED_BY = "updated_by";

    public static final String COL_UPDATED_TIME = "updated_time";
}