package com.pxx.collegecourseselectionsystem.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.CourseEntity;
import com.pxx.collegecourseselectionsystem.service.CourseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Positive;

/**
 * 课程类型
 */
@Api(tags = "课程类型")
@Validated
@RestController
@RequestMapping("/user/course")
public class CourseController {
    @Autowired
    private CourseService courseService;
    @ApiOperation("课程列表")
    @PreAuthorize("hasAnyAuthority('user:course:list')")
    @GetMapping("/list")
    public R list(Pagination pagination) {
        Page<CourseEntity> courseEntityPage = courseService.page(new Page<>(pagination.getPage(), pagination.getLimit()));
        PageUtils pageUtils = new PageUtils(courseEntityPage);
        return R.ok().put("data", pageUtils);
    }
    @ApiOperation("课程详情")
    @PreAuthorize("hasAnyAuthority('user:course:info')")
    @GetMapping("/info")
    public R info(@Positive @RequestParam("courseId") Integer courseId) {
        CourseEntity courseEntity = courseService.getById(courseId);
        return R.ok().put("data", courseEntity);
    }
    @ApiOperation("课程更新")
    @PreAuthorize("hasAnyAuthority('user:course:update')")
    @PostMapping("/update")
    public R update(@RequestBody @Validated CourseEntity courseEntity) {
        boolean updateById = courseService.updateById(courseEntity);
        return R.ok().put("data", updateById);
    }
    @ApiOperation("课程新增")
    @PreAuthorize("hasAnyAuthority('user:course:insert')")
    @PostMapping("/insert")
    public R insert(@RequestBody CourseEntity courseEntity) {
        courseEntity.setId(null);
        boolean save = courseService.save(courseEntity);
        return R.ok().put("data", save);
    }
    @ApiOperation("课程删除")
    @PreAuthorize("hasAnyAuthority('user:course:delete')")
    @PostMapping("/delete")
    public R delete(@RequestParam("courseId") Integer courseId) {
        boolean removeById = courseService.removeById(courseId);
        return R.ok().put("data", removeById);
    }


}
