package com.pxx.collegecourseselectionsystem.controller;

import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.service.OrderCourseService;
import com.pxx.collegecourseselectionsystem.service.SecondCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author pxx
 * @Date 2022/2/10 14:49
 */
@RestController
@RequestMapping("/second")
public class SecondCourseController {
    @Autowired
    private SecondCourseService secondCourseService;
    @Autowired
    private OrderCourseService orderCourseService;

    @PreAuthorize("hasAnyAuthority('ccss:second:list')")
    @GetMapping("/list")
    public List<SecondCourseDto> list() {
        return secondCourseService.findAllSecondCourse();
    }

    @GetMapping("/go/course/{id}")
    public R goCourse(@PathVariable("id") Integer secondCourseId) {
        return null;
    }

}
