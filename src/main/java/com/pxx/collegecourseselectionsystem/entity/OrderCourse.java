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

/**
 *  @author Galen
 *  @Date 2022/2/10 14:49
 */
@ApiModel(value="order_course")
@Getter
@Setter
@ToString
@TableName(value = "order_course")
public class OrderCourse {
    /**
     * 自增id
     */
    @TableId(value = "order_id", type = IdType.AUTO)
    @ApiModelProperty(value="自增id")
    private Integer orderId;

    /**
     * 用户id
     */
    @TableField(value = "user_id")
    @ApiModelProperty(value="用户id")
    private Long userId;

    /**
     * 课程id
     */
    @TableField(value = "course_id")
    @ApiModelProperty(value="课程id")
    private Integer courseId;

    /**
     * 抢课id
     */
    @TableField(value = "second_course_id")
    @ApiModelProperty(value="抢课id")
    private Integer secondCourseId;

    public static final String COL_ORDER_ID = "order_id";

    public static final String COL_USER_ID = "user_id";

    public static final String COL_COURSE_ID = "course_id";

    public static final String COL_SECOND_COURSE_ID = "second_course_id";
}