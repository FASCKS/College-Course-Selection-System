package com.pxx.collegecourseselectionsystem.controller;

import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.validator.group.Insert;
import com.pxx.collegecourseselectionsystem.common.validator.group.Update;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import com.pxx.collegecourseselectionsystem.service.SecondCoursePlanGroupService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * @author Gpxx
 * @Date 2022/2/14 10:26
 */
@Api(tags = "抢课计划分组")
@Validated
@RestController

@RequestMapping("/plan/group")
public class SecondCoursePlanGroupController {
    @Autowired
    private SecondCoursePlanGroupService secondCoursePlanGroupService;

    /**
     * 分组列表
     */
    @GetMapping("/list")
    public R list(Pagination pagination) {
        PageUtils allGroupPlan = secondCoursePlanGroupService.findAllGroupPlan(pagination);
        return R.ok().put("data", allGroupPlan);
    }

    /**
     * 编辑
     */
    @PostMapping("/update")
    public R update(@RequestBody @Validated(Update.class) SecondCoursePlanGroupEntity secondCoursePlanGroupEntity) {
        boolean update = secondCoursePlanGroupService.updateById(secondCoursePlanGroupEntity);
        return R.ok().put("data", update);
    }

    /**
     * 新增
     */
    @PostMapping("/insert")
    public R insert(@RequestBody @Validated(Insert.class) SecondCoursePlanGroupEntity secondCoursePlanGroupEntity) {
        boolean save = secondCoursePlanGroupService.save(secondCoursePlanGroupEntity);
        return R.ok().put("data", save);
    }

    /**
     * 详情
     */
    @GetMapping("/info")
    public R info(@RequestParam("id") Integer id) {
        SecondCoursePlanGroupEntity secondCoursePlanGroupEntity = secondCoursePlanGroupService.getById(id);
        return R.ok().put("data", secondCoursePlanGroupEntity);
    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    public R delete(@RequestParam("id") Integer id) {
        SecondCoursePlanGroupEntity secondCoursePlanGroupEntity = secondCoursePlanGroupService.getById(id);
        return R.ok().put("data", secondCoursePlanGroupEntity);

    }


}
