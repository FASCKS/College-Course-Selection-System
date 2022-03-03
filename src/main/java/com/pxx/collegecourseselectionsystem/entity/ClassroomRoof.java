package com.pxx.collegecourseselectionsystem.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;

/**
 *  @author Gpxx
 *  @Date 2022/2/24 16:11
 */
@ApiModel(value="大楼类型")
@Getter
@Setter
@ToString
@TableName(value = "classroom_roof")
public class ClassroomRoof {
    @TableId(value = "id", type = IdType.AUTO)
    @ApiModelProperty(value="")
    private Integer id;

    /**
     * 类型名称
     */
    @NotBlank
    @TableField(value = "roof_name")
    @ApiModelProperty(value="大楼名称")
    private String roofName;
    /**
     * 唯一标识码
     */
    @TableField(value = "`uuid`",fill = FieldFill.INSERT)
    @ApiModelProperty(value="唯一标识码")
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private String uuid;
    /**
     * 编号
     */
    @NotBlank
    @TableField(value = "roof_number")
    @ApiModelProperty("编号")
    private Integer roofNumber;

    public static final String COL_ID = "id";
    public static final String COL_UUID = "uuid";
    public static final String COL_ROOF_NAME = "roof_name";
}