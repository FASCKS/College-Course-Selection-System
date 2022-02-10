package com.pxx.collegecourseselectionsystem.dto;

import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author Gpxx
 * @Date 2022/2/10 14:56
 */
@Getter@Setter@ToString
public class SecondCourseDto extends SecondCourse {
    /**
     * 老师名称
     */
    private String teacherName;

}
