package com.pxx.collegecourseselectionsystem.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.pxx.collegecourseselectionsystem.common.validator.group.Insert;
import com.pxx.collegecourseselectionsystem.common.validator.group.Update;
import com.pxx.collegecourseselectionsystem.entity.enums.CourseUpTimeEnum;
import com.pxx.collegecourseselectionsystem.entity.enums.CourseWeekEnum;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
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
    @Null(groups = Insert.class)
    @NotNull(groups = Update.class)
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
    @TableField(value = "teacher")
    @ApiModelProperty(value = "授课老师 id")
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
     * 上课时间 如果是 第一节课和第二节课连在一起，则需要填写该值，如果默认一节课，则默认0
     */
    @NotNull
    @TableField(value = "up_time_two")
    @ApiModelProperty(value = "上课时间 如果是 第一节课和第二节课连在一起，则需要填写该值，如果默认一节课，则默认0")
    private CourseUpTimeEnum upTimeTwo;
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
    @JsonIgnore
    @Deprecated
    @TableField(exist = false)
    @ApiModelProperty(value = "开始得时间")
    private Date startTime;

    /**
     * 结束时间
     */
    @JsonIgnore
    @Deprecated
    @TableField(exist = false)
    @ApiModelProperty(value = "结束时间")
    private Date endTime;
    /**
     * 发布状态
     */
    @Deprecated
    @JsonIgnore
    @TableField(value = "state")
    @ApiModelProperty(value = "发布状态")
    private Integer state;
    /**
     * 教室
     */
    @TableField(value = "classroom_id")
    private Integer classroomId;
    /**
     * 计划分组
     */
    @NotNull(groups = Update.class)
    @NotNull(groups = Insert.class)
    @TableField(value = "plan_group_id")
    @ApiModelProperty(value = "计划分组")
    private Integer planGroupId;

    public static final String COL_ID = "id";

    public static final String COL_COURSE_ID = "course_id";

    public static final String COL_TEACHER = "teacher";

    public static final String COL_COURSE_SUM = "course_sum";

    public static final String COL_UP_TIME = "up_time";

    public static final String COL_WEEK = "week";

    public static final String COL_START_TIME = "start_time";

    public static final String COL_END_TIME = "end_time";
}