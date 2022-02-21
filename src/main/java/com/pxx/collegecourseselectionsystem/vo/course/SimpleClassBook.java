package com.pxx.collegecourseselectionsystem.vo.course;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/2/12 14:03
 */
@Getter
@Setter
@ToString
@ApiModel("简单课程集合")
public class SimpleClassBook {
    @ApiModelProperty("简单课程id")
    private Integer courseId;
    private List<SimpleClassScheduleTime> classScheduleTimes;
    @ApiModelProperty("课程状态，是临时课程还是学生已有课程    1 临时课程 0 已有课程")
    private int state;
}
