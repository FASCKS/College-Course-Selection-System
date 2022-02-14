package com.pxx.collegecourseselectionsystem.controller;

import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.service.SecondCoursePlanGroupService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Gpxx
 * @Date 2022/2/14 10:26
 */
@Api(tags = "抢课计划分组")
@RestController
@RequestMapping("/plan")
public class SecondCoursePlanGroupController {
    @Autowired
    private SecondCoursePlanGroupService secondCoursePlanGroupService;
    /**
     * 分组列表
     */
    @GetMapping("/group/list")
    private R list(Pagination pagination){
     PageUtils allGroupPlan= secondCoursePlanGroupService.findAllGroupPlan(pagination);
     return R.ok().put("data",allGroupPlan);
    }
    /**
     * 分组列表
     */



}
