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
 *  @Date 2022/2/24 16:20
 */
@ApiModel(value="教室类型")
@Getter
@Setter
@ToString
@TableName(value = "classroom_between")
public class ClassroomBetween {
    @TableId(value = "id", type = IdType.AUTO)
    @ApiModelProperty(value="")
    private Integer id;

    /**
     * 类型名称
     */
    @NotBlank
    @TableField(value = "between_type")
    @ApiModelProperty(value="教室类型名称")
    private String betweenType;
    /**
     * 唯一标识码
     */
    @TableField(value = "uuid",fill = FieldFill.INSERT)
    @ApiModelProperty(value="唯一标识码")
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private String uuid;
    public static final String COL_ID = "id";

    public static final String COL_BETWEEN_TYPE = "between_type";
}