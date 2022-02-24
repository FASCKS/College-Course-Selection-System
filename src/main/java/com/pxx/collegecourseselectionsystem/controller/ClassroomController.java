package com.pxx.collegecourseselectionsystem.controller;

import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.service.ClassroomService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    @RequestMapping("/list")
    public R list(@Validated Pagination pagination){
        PageUtils classroomBetweenPage = classroomService.findAllClassroom(pagination);
        return R.ok().put("data",classroomBetweenPage);
    }
}
