package com.pxx.collegecourseselectionsystem.controller;

import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.service.ClassScheduleService;
import com.pxx.collegecourseselectionsystem.vo.course.ClassScheduleVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 课程表
 */
@Api(tags = "课程表", value = "课程表")
@RestController
@RequestMapping("course/classSchedule")
public class ClassScheduleController {
    @Autowired
    private ClassScheduleService classScheduleService;

    @ApiOperation("学生自己的课程表")
    @PreAuthorize("hasAnyAuthority('course:classSchedule:user:course')")
    @GetMapping("/user/course")
    public R courseByUserId() {
        ClassScheduleVo classScheduleVo = classScheduleService.findMyClassSchedule();
        return R.ok().put("data", classScheduleVo);
    }
}
