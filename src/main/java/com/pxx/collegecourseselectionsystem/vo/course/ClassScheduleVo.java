package com.pxx.collegecourseselectionsystem.vo.course;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class ClassScheduleVo {
    private Long userId;
    private String className;
    private String userName;
    private List<ClassBook> classBook;
}

@Getter
@Setter
@ToString
class ClassBook {
    private Integer courseId;
    private String courseName;
    private List<ClassScheduleTime> classScheduleTimes;
}

@Getter
@Setter
@ToString
class ClassScheduleTime {
    private Integer courseId;
    private String teacherName;
    private Integer week;
    private Integer upTime;
}


