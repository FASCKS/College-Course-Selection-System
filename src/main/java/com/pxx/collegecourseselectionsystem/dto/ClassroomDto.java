package com.pxx.collegecourseselectionsystem.dto;

import com.pxx.collegecourseselectionsystem.entity.Classroom;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author Gpxx
 * @Date 2022/2/24 16:30
 */
@Getter@Setter@ToString
public class ClassroomDto extends Classroom {
    /**
     * 教室类型
     */
    private  String ClassroomBetweenName;
    /**
     * 大楼类型
     */
    private  String ClassroomRoof;
}
