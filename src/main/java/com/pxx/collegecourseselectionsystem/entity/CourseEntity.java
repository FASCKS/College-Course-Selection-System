package com.pxx.collegecourseselectionsystem.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.pxx.collegecourseselectionsystem.entity.enums.CourseEnum;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@ToString
@ApiModel(value = "课程表")
@TableName(value = "course")
public class CourseEntity {
    /**
     * 课程id
     */
    @ApiModelProperty("课程id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 课程名称
     */
    @NotEmpty
    @ApiModelProperty(value = "课程名称")
    @TableField(value = "`name`")
    private String name;

    /**
     * 课程类型 1公共课 2选修课 3必修课 4人文素质
     */
    @NotNull
    @ApiModelProperty("课程类型 课程类型 1公共课 2选修课 3必修课 4人文素质")
    @TableField(value = "`type`")
    private CourseEnum type;

    /**
     * 学分
     */
    @NotNull
    @ApiModelProperty(value = "学分",example = "2")
    @TableField(value = "credit")
    private Integer credit;

    public static final String COL_ID = "id";

    public static final String COL_NAME = "name";

    public static final String COL_TYPE = "type";

    public static final String COL_CREDIT = "credit";
}