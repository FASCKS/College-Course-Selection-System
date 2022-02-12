package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.entity.ClassSchedule;
import com.pxx.collegecourseselectionsystem.vo.course.ClassScheduleVo;
import com.pxx.collegecourseselectionsystem.vo.course.SimpleClassScheduleVo;

import java.util.List;

public interface ClassScheduleService extends IService<ClassSchedule> {

    /**
     * 查询自己的课程表
     * @return
     */
    ClassScheduleVo findMyClassSchedule();
    /**
     * 查询自己的课表
     */
    List<SimpleClassScheduleVo> findSimpleMyClassSchedule();
}

