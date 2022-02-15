package com.pxx.collegecourseselectionsystem.vo.course;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/2/12 13:47
 */
@ApiModel("简单课程表")
@Getter@Setter@ToString
public class SimpleClassScheduleVo {
    @ApiModelProperty("用户id")
    private Long userId;
    @ApiModelProperty("课程集合")
    private List<SimpleClassBook> classBook;
}