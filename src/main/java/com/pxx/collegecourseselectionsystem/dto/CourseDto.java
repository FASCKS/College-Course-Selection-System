package com.pxx.collegecourseselectionsystem.dto;

import com.pxx.collegecourseselectionsystem.entity.CourseEntity;
import com.pxx.collegecourseselectionsystem.entity.CourseType;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author Gpxx
 * @Date 2022/3/2 16:44
 */

@Getter
@Setter@ToString
public class CourseDto extends CourseEntity {
   private   CourseType courseType;
}
