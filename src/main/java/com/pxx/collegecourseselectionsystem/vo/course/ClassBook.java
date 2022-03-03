package com.pxx.collegecourseselectionsystem.vo.course;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/2/14 16:29
 */
 @Getter
@Setter
@ToString
 @ApiModel("课程集合类")
public class ClassBook {
     @ApiModelProperty("课程id")
    private Integer courseId;
    @ApiModelProperty("课程名称")

    private String courseName;
    @ApiModelProperty("0 不是网课 1 是网课")

    private Integer onlineClass;
    private List<ClassScheduleTime> classScheduleTimes;
}
