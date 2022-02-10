package com.pxx.collegecourseselectionsystem.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
@TableName(value = "sys_unit")
@ApiModel("部门表")
public class SysUnitEntity {
    /**
     * 部门id
     */
    @ApiModelProperty(value = "部门id")
    @TableId(value = "unit_id", type = IdType.AUTO)
    private Integer unitId;

    /**
     * 部门名字
     */
    @ApiModelProperty(value = "部门名称")
    @TableField(value = "`name`")
    private String name;

    /**
     * 父亲id
     */
    @ApiModelProperty(value = "父亲id")
    @TableField(value = "pid")
    private Integer pid;

    /**
     * 部门代码
     */
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @TableField(value = "code")
    private String code;
    /**
     * 子部门
     */
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @TableField(exist = false)
    private List<SysUnitEntity> unitEntityList;

    public static final String COL_UNIT_ID = "unit_id";

    public static final String COL_NAME = "name";

    public static final String COL_PID = "pid";

    public static final String COL_CODE = "code";
}