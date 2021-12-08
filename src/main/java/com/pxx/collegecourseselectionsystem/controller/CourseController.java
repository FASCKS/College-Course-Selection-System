package com.pxx.collegecourseselectionsystem.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.CourseEntity;
import com.pxx.collegecourseselectionsystem.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user/course")
public class CourseController {
    @Autowired
    private CourseService courseService;

    @PreAuthorize("hasAnyAuthority('user:course:list')")
    @RequestMapping("/list")
    public R list(Pagination pagination) {
        Page<CourseEntity> courseEntityPage = courseService.page(new Page<>(pagination.getPage(), pagination.getLimit()));
        PageUtils pageUtils = new PageUtils(courseEntityPage);
        return R.ok().put("data", pageUtils);
    }
    @PreAuthorize("hasAnyAuthority('user:course:info')")
    @RequestMapping("/info")
    public R info(@RequestParam("courseId") Integer courseId){
        CourseEntity courseEntity = courseService.getById(courseId);
        return R.ok().put("data",courseEntity);
    }


}
