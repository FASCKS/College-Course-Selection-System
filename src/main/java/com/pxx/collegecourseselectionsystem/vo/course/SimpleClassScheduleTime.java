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
    //大楼序号
    private Integer roofNumber;
    //大楼层数
    private Integer floor;
    //哪一间教室
    private Integer between;

}
