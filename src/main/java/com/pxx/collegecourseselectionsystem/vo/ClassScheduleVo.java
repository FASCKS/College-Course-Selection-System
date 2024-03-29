package com.pxx.collegecourseselectionsystem.vo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import java.util.Date;

/**
 * @author Gpxx
 * @Date 2022/3/7 14:45
 */
@Getter@ToString@Setter
public class ClassScheduleVo {

    /**
     * 课程id
     */
    @NotNull
    @TableField(value = "course_id")
    @ApiModelProperty(value = "课程id")
    private Integer courseId;

    /**
     * 上课时间 第几节    总共   按大学课表算
     */
    @Min(1)
    @Max(11)
    @Positive
    @NotNull
    @TableField(value = "up_time")
    @ApiModelProperty(value = "上课时间 第几节    总共   按大学课表算")
    private Integer upTime;

    /**
     * 星期几
     */
    @Min(1)
    @Max(7)
    @Positive
    @NotNull
    @TableField(value = "week")
    @ApiModelProperty(value = "星期几")
    private Integer week;

    /**
     * 学生id
     */
    @NotNull
    @TableField(value = "user_id")
    @ApiModelProperty(value = "学生id")
    private Long userId;

    /**
     * 所属部门
     */
    @TableField(value = "unit_id")
    @ApiModelProperty(value = "所属部门")
    private Integer unitId;

    /**
     * 创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    @ApiModelProperty(value = "创建时间")
    private Date createTime;
    @NotNull
    @TableField(value = "teacher")
    @ApiModelProperty("老师id")
    private Long teacher;
    @NotNull
    @TableField(value = "classroom_id")
    @ApiModelProperty("教室id")
    private Integer classroomId;
    public static final String COL_ID = "id";
}
