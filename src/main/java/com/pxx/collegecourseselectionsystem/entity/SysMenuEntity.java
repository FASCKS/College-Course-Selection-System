package com.pxx.collegecourseselectionsystem.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * 菜单管理
 */
@Api(tags = "菜单类")
@Getter
@Setter
@ToString
@TableName(value = "sys_menu")
public class SysMenuEntity {
    @ApiModelProperty("菜单id")
    @TableId(value = "menu_id", type = IdType.AUTO)
    private Integer menuId;

    /**
     * 父菜单ID，一级菜单为0
     */
    @ApiModelProperty("菜单父id")
    @NotNull
    @TableField(value = "parent_id")
    private Integer parentId;

    /**
     * 菜单名称
     */
    @ApiModelProperty("菜单名称")
    @NotBlank
    @TableField(value = "`name`")
    private String name;

    /**
     * 菜单URL
     */
    @ApiModelProperty("菜单url")
    @TableField(value = "url")
    private String url;

    /**
     * 授权(多个用逗号分隔，如：user:list,user:create)
     */

    @ApiModelProperty("菜单权限符")
    @TableField(value = "perms")
    private String perms;

    /**
     * 类型   0：目录   1：菜单   2：按钮
     */
    @ApiModelProperty("菜单类型   0：目录   1：菜单   2：按钮")
    @NotNull
    @TableField(value = "`type`")
    private Integer type;

    /**
     * 菜单图标
     */
    @ApiModelProperty("菜单图标")
    @JsonIgnore
    @TableField(value = "icon")
    private String icon;

    /**
     * 排序
     */
    @ApiModelProperty("排序")
    @NotNull
    @TableField(value = "order_num")
    private Integer orderNum;


    @ApiModelProperty("状态   1   开启  0  关闭")
    @NotNull
    @TableField(value = "`status`")
    private Integer status;


    public static final String COL_MENU_ID = "menu_id";

    public static final String COL_PARENT_ID = "parent_id";

    public static final String COL_NAME = "name";

    public static final String COL_URL = "url";

    public static final String COL_PERMS = "perms";

    public static final String COL_TYPE = "type";

    public static final String COL_ICON = "icon";

    public static final String COL_ORDER_NUM = "order_num";

    public static final String COL_STATUS = "status";
}