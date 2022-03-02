package com.pxx.collegecourseselectionsystem.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.CourseType;
import com.pxx.collegecourseselectionsystem.service.CourseTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

/**
 * @author Gpxx
 * @Date 2022/3/2 16:06
 */
@Api(tags = "课程类型")
@RestController
@Validated
@RequestMapping("/course/type")
public class CourseTypeController {
    @Autowired
    private CourseTypeService courseTypeService;

    @ApiOperation("课程类型列表")
    @GetMapping("/list")
    public R list(@Validated Pagination pagination) {
        Page<CourseType> courseTypePage = courseTypeService.page(new Page<>(pagination.getPage(), pagination.getLimit()));
        return R.ok().put("data",new PageUtils(courseTypePage));
    }
    @ApiOperation("课程类型详情")
    @GetMapping("/info")
    public R info(@RequestParam("id")@NotNull Integer id) {
        CourseType courseType = courseTypeService.getById(id);
        return R.ok().put("data",courseType);
    }
    @ApiOperation("课程类型新增")
    @PostMapping("/insert")
    public R insert(@RequestBody CourseType courseType){
        boolean save = courseTypeService.save(courseType);
        return R.ok().put("data",save);
    }
    @ApiOperation("课程类型编辑")
    @PostMapping("/update")
    public R update(@RequestBody CourseType courseType){
        boolean updateById = courseTypeService.updateById(courseType);
        return R.ok().put("data",updateById);
    }
    @ApiOperation("课程类型删除")
    @PostMapping("/delete")
    public R delete(@RequestParam("id")@NotNull Integer id){

     boolean delete=   courseTypeService.deleteOneById(id);
     return R.ok().put("data",delete);
    }
}
