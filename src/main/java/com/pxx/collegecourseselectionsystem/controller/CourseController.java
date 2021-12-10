package com.pxx.collegecourseselectionsystem.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.CourseEntity;
import com.pxx.collegecourseselectionsystem.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Positive;

/**
 * 课程类型
 */
@Validated
@RestController
@RequestMapping("/user/course")
public class CourseController {
    @Autowired
    private CourseService courseService;

    @PreAuthorize("hasAnyAuthority('user:course:list')")
    @GetMapping("/list")
    public R list(Pagination pagination) {
        Page<CourseEntity> courseEntityPage = courseService.page(new Page<>(pagination.getPage(), pagination.getLimit()));
        PageUtils pageUtils = new PageUtils(courseEntityPage);
        return R.ok().put("data", pageUtils);
    }

    @PreAuthorize("hasAnyAuthority('user:course:info')")
    @GetMapping("/info")
    public R info(@Positive @RequestParam("courseId") Integer courseId) {
        CourseEntity courseEntity = courseService.getById(courseId);
        return R.ok().put("data", courseEntity);
    }

    @PreAuthorize("hasAnyAuthority('user:course:update')")
    @PostMapping("/update")
    public R update(@RequestBody @Validated CourseEntity courseEntity) {
        boolean updateById = courseService.updateById(courseEntity);
        return R.ok().put("data", updateById);
    }

    @PreAuthorize("hasAnyAuthority('user:course:insert')")
    @PostMapping("/insert")
    public R insert(@RequestBody CourseEntity courseEntity) {
        courseEntity.setId(null);
        boolean save = courseService.save(courseEntity);
        return R.ok().put("data", save);
    }

    @PreAuthorize("hasAnyAuthority('user:course:delete')")
    @PostMapping("/delete")
    public R delete(@RequestParam("courseId") Integer courseId) {
        boolean removeById = courseService.removeById(courseId);
        return R.ok().put("data", removeById);
    }


}
