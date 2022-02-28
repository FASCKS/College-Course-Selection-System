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
    /**
     * 班级名称
     */
    private String className;
    /**
     * 用户名称
     */
    private String userName;
    private List<ClassBook> classBook;

}






