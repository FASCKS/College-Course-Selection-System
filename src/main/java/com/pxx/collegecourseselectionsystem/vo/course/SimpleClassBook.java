package com.pxx.collegecourseselectionsystem.vo.course;

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
public class SimpleClassBook {
    private Integer courseId;
    private List<SimpleClassScheduleTime> classScheduleTimes;
}
