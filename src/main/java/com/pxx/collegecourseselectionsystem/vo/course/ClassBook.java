package com.pxx.collegecourseselectionsystem.vo.course;

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
public class ClassBook {
    private Integer courseId;
    private String courseName;
    private List<ClassScheduleTime> classScheduleTimes;
}
