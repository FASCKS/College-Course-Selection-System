package com.pxx.collegecourseselectionsystem.vo.course;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author Gpxx
 * @Date 2022/2/12 14:04
 */
@Getter
@Setter
@ToString
public class SimpleClassScheduleTime {
    private Integer courseId;
    private Integer week;
    private Integer upTime;
}
