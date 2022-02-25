package com.pxx.collegecourseselectionsystem.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.ClassroomBetween;
import com.pxx.collegecourseselectionsystem.service.ClassroomBetweenService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * @author Gpxx
 * @Date 2022/2/24 16:21
 */
@Validated
@Api(tags = "教室类型")
@AllArgsConstructor
@RestController
@RequestMapping("/ClassroomBetween")
public class ClassroomBetweenController {
    private ClassroomBetweenService classroomBetweenService;

    @ApiOperation("教室类型列表")
    @GetMapping("/list")
    public R list(@Validated Pagination pagination){
        Page<ClassroomBetween> classroomBetweenPage = classroomBetweenService.page(new Page<>(pagination.getPage(), pagination.getLimit()));
        return R.ok().put("data",new PageUtils(classroomBetweenPage));
    }
    @ApiOperation("教室类型详情")
    @GetMapping("/info")
    public R list(@RequestParam("id") Integer id){
        ClassroomBetween classroomBetween = classroomBetweenService.getById(id);
        return R.ok().put("data",classroomBetween);
    }
    @ApiOperation("教室类型新增")
    @GetMapping("/insert")
    public R insert(@RequestBody ClassroomBetween classroomBetween){
        boolean save = classroomBetweenService.save(classroomBetween);
        return R.ok().put("data",save);
    }
    @ApiOperation("教室类型编辑")
    @GetMapping("/update")
    public R update(@RequestBody ClassroomBetween classroomBetween){
        boolean save = classroomBetweenService.updateById(classroomBetween);
        return R.ok().put("data",save);
    }
    @ApiOperation("教室类型删除")
    @GetMapping("/delete")
    public R update(@RequestParam("id") Integer id){
        boolean save = classroomBetweenService.removeOneById(id);
        return R.ok().put("data",save);
    }
}
