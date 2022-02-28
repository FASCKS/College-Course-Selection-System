package com.pxx.collegecourseselectionsystem.vo.course;

import com.pxx.collegecourseselectionsystem.entity.enums.CourseUpTimeEnum;
import com.pxx.collegecourseselectionsystem.entity.enums.CourseWeekEnum;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author Gpxx
 * @Date 2022/2/14 16:30
 */
@ApiModel("课程时间表")
@Getter
@Setter
@ToString
public class ClassScheduleTime {
    @ApiModelProperty("课程id")
    private Integer courseId;
    @ApiModelProperty("授课老师")
    private String teacherName;
    @ApiModelProperty("星期几数据")
    private Integer week;
    @ApiModelProperty("星期几中文")
    private CourseWeekEnum weekName;
    @ApiModelProperty("上课时间")
    private Integer upTime;
    @ApiModelProperty("上课时间中文")
    private CourseUpTimeEnum upTimeName;
    //大楼名字
    @ApiModelProperty("大楼名称")
    private String roofName;
    //大楼序号
    @ApiModelProperty("大楼序号")
    private Integer roofNumber;
    //大楼层数
    @ApiModelProperty("大楼层数")
    private Integer floor;
    //哪一间教室
    @ApiModelProperty("哪一个教室")
    private Integer between;
    //教室名称
    @ApiModelProperty("教室类型名称")
    private String betweenName;
}