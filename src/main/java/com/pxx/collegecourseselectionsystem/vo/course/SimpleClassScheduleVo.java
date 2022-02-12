package com.pxx.collegecourseselectionsystem.vo.course;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/2/12 13:47
 */
@Getter@Setter@ToString
public class SimpleClassScheduleVo {
    private Long userId;
    private List<SimpleClassBook> classBook;
}