package com.pxx.collegecourseselectionsystem.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
import com.pxx.collegecourseselectionsystem.entity.enums.CourseEnum;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

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
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @TableField(exist = false)
    @ApiModelProperty("老师名字")
    private String teacherName;
    /**
     * 课程名字
     */
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @TableField(exist = false)
    @ApiModelProperty("课程名称")
    private String courseName;
    /**
     * 课程类型
     */
    @TableField(exist = false)
    @ApiModelProperty("课程类型")
    private CourseEnum type;

    /**
     * 影响部门
     */
    @TableField(exist = false)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private List<SecondCoursePlanGroupAndUnitDto> secondCoursePlanGroupAndUnitDto;
    /**
     * 影响部门
     */
    @TableField(exist = false)
    @ApiModelProperty("影响部门的id集合")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private List<Integer> unitIds;
}
