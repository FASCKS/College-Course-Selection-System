package com.pxx.collegecourseselectionsystem.vo.course;

import com.pxx.collegecourseselectionsystem.entity.enums.CourseUpTimeEnum;
import com.pxx.collegecourseselectionsystem.entity.enums.CourseWeekEnum;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author Gpxx
 * @Date 2022/2/14 16:30
 */
@Getter
@Setter
@ToString
public class ClassScheduleTime {
    private Integer courseId;
    private String teacherName;
    private Integer week;
    private CourseWeekEnum weekName;
    private Integer upTime;
    private CourseUpTimeEnum upTimeName;
}