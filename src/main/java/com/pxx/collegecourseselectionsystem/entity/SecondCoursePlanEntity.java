package com.pxx.collegecourseselectionsystem.entity;

import cn.hutool.core.date.DatePattern;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.pxx.collegecourseselectionsystem.entity.enums.SecondCoursePlanGroupEnum;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

/**
 *  @author Gpxx
 *  @Date 2022/2/14 10:25
 */
@ApiModel(value="second_course_plan")
@Getter
@Setter
@ToString
@TableName(value = "second_course_plan")
public class SecondCoursePlanEntity {
    @TableId(value = "id", type = IdType.AUTO)
    @ApiModelProperty(value="")
    private Integer id;

    /**
     * 年份
     */
    @TableField(value = "`year`")
    @ApiModelProperty(value="年份")
    private Integer year;

    /**
     * 0 上学期  1 下学期
     */
    @TableField(value = "up_or_down")
    @ApiModelProperty(value="0 上学期  1 下学期")
    private SecondCoursePlanGroupEnum upOrDown;

    /**
     * 开始时间
     */
    @JsonFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    @TableField(value = "start_time")
    @ApiModelProperty(value="开始时间")
    private Date startTime;

    /**
     * 结束时间
     */
    @JsonFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    @TableField(value = "end_time")
    @ApiModelProperty(value="结束时间")
    private Date endTime;

    /**
     * 计划状态  0 未开始  1  进行中  2 已结束
     */
    @TableField(value = "`state`")
    @ApiModelProperty(value="计划状态  0 未开始  1  进行中  2 已结束")
    private SecondCoursePlanGroupEnum state;

    public static final String COL_ID = "id";

    public static final String COL_YEAR = "year";

    public static final String COL_UP_OR_DOWN = "up_or_down";

    public static final String COL_START_TIME = "start_time";

    public static final String COL_END_TIME = "end_time";

    public static final String COL_STATE = "state";
}