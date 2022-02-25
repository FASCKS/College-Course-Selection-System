package com.pxx.collegecourseselectionsystem.controller;

import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.Classroom;
import com.pxx.collegecourseselectionsystem.service.ClassroomService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * @author Gpxx
 * @Date 2022/2/24 16:25
 */
@Validated
@Api(tags = "教室管理")
@AllArgsConstructor
@RestController
@RequestMapping("/Classroom")
public class ClassroomController {
    private ClassroomService classroomService;

    @ApiOperation("教室管理列表")
    @GetMapping("/list")
    public R list(@Validated Pagination pagination){
        PageUtils classroomBetweenPage = classroomService.findAllClassroom(pagination);
        return R.ok().put("data",classroomBetweenPage);
    }
    @ApiOperation("教室新增")
    @PostMapping("/insert")
    public R insert(@Validated @RequestBody Classroom classroom){
        boolean insertOne =classroomService.insertOne(classroom);
        return R.ok().put("data",insertOne);
    }
    @ApiOperation("删除")
    @PostMapping("/delete")
    public R delete(@RequestParam("id") Integer id){
        boolean removeById =classroomService.removeById(id);
        return R.ok().put("data",removeById);
    }
    @ApiOperation("详情")
    @GetMapping("/info")
    public R info(@RequestParam("id") Integer id){
        Classroom classroom =classroomService.findOneById(id);
        return R.ok().put("data",classroom);
    }
    @ApiOperation("编辑")
    @GetMapping("/update")
    public R update(@Validated @RequestBody Classroom classroom){
        boolean updateOne =classroomService.updateOne(classroom);
        return R.ok().put("data",updateOne);
    }
}
