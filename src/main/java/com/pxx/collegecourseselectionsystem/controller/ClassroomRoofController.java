package com.pxx.collegecourseselectionsystem.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.ClassroomRoof;
import com.pxx.collegecourseselectionsystem.service.ClassroomRoofService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * @author Gpxx
 * @Date 2022/2/24 16:12
 */
@Validated
@Api(tags = "大楼类型")
@AllArgsConstructor
@RestController
@RequestMapping("/ClassroomRoof")
public class ClassroomRoofController {
    private ClassroomRoofService classroomRoofService;

    @ApiOperation("大楼类型列表")
    @RequestMapping("/list")
    public R list(@Validated Pagination pagination){
        Page<ClassroomRoof> classroomRoofPage = classroomRoofService.page(new Page<>(pagination.getPage(), pagination.getLimit()));
        return R.ok().put("data",new PageUtils(classroomRoofPage));
    }
    @ApiOperation("大楼类型详情")
    @GetMapping("/info")
    public R list(@RequestParam("id") Integer id){
        ClassroomRoof classroomRoof = classroomRoofService.getById(id);
        return R.ok().put("data",classroomRoof);
    }
    @ApiOperation("大楼类型新增")
    @GetMapping("/insert")
    public R insert(@RequestBody ClassroomRoof classroomRoof){
        boolean save = classroomRoofService.save(classroomRoof);
        return R.ok().put("data",save);
    }
    @ApiOperation("大楼类型编辑")
    @GetMapping("/update")
    public R update(@RequestBody ClassroomRoof classroomRoof){
        boolean save = classroomRoofService.updateById(classroomRoof);
        return R.ok().put("data",save);
    }
    @ApiOperation("大楼类型删除")
    @GetMapping("/delete")
    public R update(@RequestParam("id") Integer id){
        boolean save = classroomRoofService.removeOneById(id);
        return R.ok().put("data",save);
    }
}
