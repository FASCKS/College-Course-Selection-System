package com.pxx.collegecourseselectionsystem.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.pxx.collegecourseselectionsystem.entity.enums.CourseEnum;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@TableName(value = "course")
public class CourseEntity {
    /**
     * 课程id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 课程名称
     */
    @TableField(value = "`name`")
    private String name;

    /**
     * 课程类型 1公共课 2选修课 3必修课 4人文素质
     */
    @TableField(value = "`type`")
    private CourseEnum type;

    /**
     * 学分
     */
    @TableField(value = "credit")
    private Integer credit;

    public static final String COL_ID = "id";

    public static final String COL_NAME = "name";

    public static final String COL_TYPE = "type";

    public static final String COL_CREDIT = "credit";
}