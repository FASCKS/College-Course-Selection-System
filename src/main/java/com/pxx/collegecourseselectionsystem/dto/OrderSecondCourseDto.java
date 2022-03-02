package com.pxx.collegecourseselectionsystem.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author Gpxx
 * @Date 2022/3/2 17:11
 */
@Getter@Setter@ToString
public class OrderSecondCourseDto extends SecondCourseDto {
    @ApiModelProperty("学生id")
    private Long userId;
    @ApiModelProperty("单位id")
    private Integer unitId;
}
