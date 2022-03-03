package com.pxx.collegecourseselectionsystem.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *  @author Gpxx
 *  @Date 2022/3/2 16:05
 */
@ApiModel(value="课程类型")
@Getter
@Setter
@ToString
@TableName(value = "course_type")
public class CourseType {
    @TableId(value = "id", type = IdType.AUTO)
    @ApiModelProperty(value="")
    private Integer id;

    /**
     * 课程类型名字
     */
    @TableField(value = "`name`")
    @ApiModelProperty(value="课程类型名字")
    private String name;

    /**
     * 唯一标识
     */
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @TableField(value = "uuid",fill = FieldFill.INSERT)
    @ApiModelProperty(value="唯一标识")
    private String uuid;

    public static final String COL_ID = "id";

    public static final String COL_NAME = "name";

    public static final String COL_UUID = "uuid";

}