package com.pxx.collegecourseselectionsystem.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
    @TableField(value = "name_type")
    @ApiModelProperty(value="大楼类型名称")
    private String nameType;

    public static final String COL_ID = "id";

    public static final String COL_NAME_TYPE = "name_type";
}