package com.pxx.collegecourseselectionsystem.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
import com.pxx.collegecourseselectionsystem.entity.enums.CourseEnum;
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
    private CourseEnum type;
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
    @ApiModelProperty("学生id")
    @JsonProperty(access = JsonProperty.Access.READ_WRITE)
    private Long userId;
    @ApiModelProperty("单位id")
    @JsonProperty(access = JsonProperty.Access.READ_WRITE)
    private Integer unitId;
}
