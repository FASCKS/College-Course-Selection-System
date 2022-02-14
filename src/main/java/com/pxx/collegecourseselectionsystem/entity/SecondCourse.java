package com.pxx.collegecourseselectionsystem.entity;

import cn.hutool.core.date.DatePattern;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.pxx.collegecourseselectionsystem.entity.enums.CourseUpTimeEnum;
import com.pxx.collegecourseselectionsystem.entity.enums.CourseWeekEnum;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * @author Galen
 * @Date 2022/2/10 14:48
 */
@ApiModel(value = "second_course")
@Getter
@Setter
@ToString
@TableName(value = "second_course")
public class SecondCourse {
    public static final String COL_USER_ID = "user_id";
    /**
     * 抢课自增id
     */
    @TableId(value = "id", type = IdType.AUTO)
    @ApiModelProperty(value = "抢课自增id")
    private Integer id;

    /**
     * 课程id
     */
    @NotNull
    @TableField(value = "course_id")
    @ApiModelProperty(value = "课程id")
    private Integer courseId;

    /**
     * 授课老师
     */
    @NotNull
    @JsonIgnore
    @TableField(value = "teacher")
    @ApiModelProperty(value = "授课老师")
    private Long teacher;

    /**
     * 课程剩余数量
     */
    @NotNull
    @TableField(value = "course_sum")
    @ApiModelProperty(value = "课程剩余数量")
    private Integer courseSum;

    /**
     * 上课时间
     */
    @NotNull
    @TableField(value = "up_time")
    @ApiModelProperty(value = "上课时间")
    private CourseUpTimeEnum upTime;

    /**
     * 星期几
     */
    @NotNull
    @TableField(value = "week")
    @ApiModelProperty(value = "星期几")
    private CourseWeekEnum week;

    /**
     * 开始得时间
     */
    @NotNull

    @JsonFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    @TableField(value = "start_time")
    @ApiModelProperty(value = "开始得时间")
    private Date startTime;

    /**
     * 结束时间
     */
    @NotNull
    @JsonFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    @TableField(value = "end_time")
    @ApiModelProperty(value = "结束时间")
    private Date endTime;
    /**
     * 发布状态
     */
    @JsonIgnore
    @TableField(value = "state")
    @ApiModelProperty(value = "发布状态")
    private Integer state;


    public static final String COL_ID = "id";

    public static final String COL_COURSE_ID = "course_id";

    public static final String COL_TEACHER = "teacher";

    public static final String COL_COURSE_SUM = "course_sum";

    public static final String COL_UP_TIME = "up_time";

    public static final String COL_WEEK = "week";

    public static final String COL_START_TIME = "start_time";

    public static final String COL_END_TIME = "end_time";
}