package com.pxx.collegecourseselectionsystem.entity;

import cn.hutool.core.date.DatePattern;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.pxx.collegecourseselectionsystem.common.validator.group.Insert;
import com.pxx.collegecourseselectionsystem.common.validator.group.Update;
import com.pxx.collegecourseselectionsystem.entity.enums.SecondCoursePlanGroupEnum;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import java.util.Date;

/**
 *  @author Gpxx
 *  @Date 2022/2/14 10:25
 */
@ApiModel(value="second_course_plan")
@Getter
@Setter
@ToString
@TableName(value = "second_course_plan_group")
public class SecondCoursePlanGroupEntity {
    @Null(groups = Insert.class)
    @NotNull(groups = Update.class)
    @TableId(value = "id", type = IdType.AUTO)
    @ApiModelProperty(value="")
    private Integer id;

    /**
     * 年份
     */
    @NotNull
    @TableField(value = "`year`")
    @ApiModelProperty(value="年份")
    private Integer year;

    /**
     * 0 上学期  1 下学期
     */
    @NotNull
    @TableField(value = "up_or_down")
    @ApiModelProperty(value="0 上学期  1 下学期")
    private SecondCoursePlanGroupEnum upOrDown;

    /**
     * 开始时间
     */
    @NotNull
    @JsonFormat(pattern = DatePattern.NORM_DATETIME_PATTERN,timezone = "GMT+8")
    @TableField(value = "start_time")
    @ApiModelProperty(value="开始时间")
    private Date startTime;

    /**
     * 结束时间
     */
    @NotNull
    @JsonFormat(pattern = DatePattern.NORM_DATETIME_PATTERN,timezone = "GMT+8")
    @TableField(value = "end_time")
    @ApiModelProperty(value="结束时间")
    private Date endTime;

    /**
     * 计划状态  0 未开始  1  进行中  2 已结束
     */
    @NotNull
    @TableField(value = "`state`")
    @ApiModelProperty(value="计划状态  0 未开始  1  进行中  2 已结束")
    private SecondCoursePlanGroupEnum state;

    /**
     * 计划状态  0 未开始  1  进行中  2 已结束
     */
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @TableField(value = "sum")
    @ApiModelProperty(value="第几次选课")
    private Integer sum;

    public static final String COL_ID = "id";

    public static final String COL_YEAR = "year";

    public static final String COL_UP_OR_DOWN = "up_or_down";

    public static final String COL_START_TIME = "start_time";

    public static final String COL_END_TIME = "end_time";

    public static final String COL_STATE = "state";
}