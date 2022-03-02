package com.pxx.collegecourseselectionsystem.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotNull;

/**
 * @author Gpxx
 * @Date 2022/2/10 14:56
 */
@Getter
@Setter
@ToString
public class SecondCourseDto extends SecondCourse {
    /**
     * 老师名称
     */
    @TableField(exist = false)
    @ApiModelProperty("老师名字")
    private String teacherName;
    /**
     * 课程名字
     */
    @TableField(exist = false)
    @ApiModelProperty("课程名称")
    private String courseName;
    /**
     * 课程类型
     */
    @NotNull
    @TableField(exist = false)
    @ApiModelProperty("课程类型")
    private String type;
    @TableField(exist = false)
    @ApiModelProperty("第一节上课时间")
    private Integer upTimeNumber;
    @TableField(exist = false)
    @ApiModelProperty("第二节上课时间")
    private Integer upTimeTwoNumber;
    @TableField(exist = false)
    @ApiModelProperty("星期几")
    private Integer weekNumber;
    @TableField(exist = false)
    private Integer totalSum;

    @ApiModelProperty("大楼Id")
    private Integer roofId;
    @ApiModelProperty("大楼名称")
    private String roofName;
    @ApiModelProperty("编号")
    private Integer roofNumber;
    @ApiModelProperty("层")
    private Integer floor;
    @ApiModelProperty("教室id")
    private Integer betweenId;
    @ApiModelProperty("间")
    private Integer between;
    @ApiModelProperty("教室名称")
    private String betweenType;
}
