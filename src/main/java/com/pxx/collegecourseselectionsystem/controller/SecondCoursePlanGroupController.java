package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.date.DateUtil;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.common.validator.group.Insert;
import com.pxx.collegecourseselectionsystem.common.validator.group.Update;
import com.pxx.collegecourseselectionsystem.dto.SecondCoursePlanGroupEntityDto;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import com.pxx.collegecourseselectionsystem.service.SecondCoursePlanGroupService;
import com.pxx.collegecourseselectionsystem.util.Global;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;
import java.util.Date;

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
    @Autowired
    private RedisUtil redisUtil;


    /**
     * 分组列表
     */
    @ApiOperation("分组列表")
    @GetMapping("/list")
    public R list(Pagination pagination) {
        PageUtils allGroupPlan = secondCoursePlanGroupService.findAllGroupPlan(pagination);
        return R.ok().put("data", allGroupPlan);
    }

    /**
     * 编辑
     */
    @ApiOperation("编辑")
    @PostMapping("/update")
    public R update(@RequestBody @Validated(Update.class) SecondCoursePlanGroupEntityDto secondCoursePlanGroupEntity) {
        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "plan_group:" + secondCoursePlanGroupEntity.getId());
        if (hasKey) {
            return R.ok("计划正在进行中,无法编辑.");
        }
        boolean update = secondCoursePlanGroupService.updateOne(secondCoursePlanGroupEntity);
        return R.ok().put("data", update);
    }

    /**
     * 新增
     */
    @ApiOperation("新增")
    @PostMapping("/insert")
    public R insert(@RequestBody @Validated(Insert.class) SecondCoursePlanGroupEntityDto secondCoursePlanGroupEntity) {
        Date startTime = secondCoursePlanGroupEntity.getStartTime();
        Date endTime = secondCoursePlanGroupEntity.getEndTime();
/*        if (startTime.compareTo(DateUtil.date()) <= 0) {
            return R.error("开始时间小于当前时间");
        }*/
        if (DateUtil.betweenDay(startTime, endTime, true) < 7) {
            return R.error("计划开始时间和结束时间间隔不能小于一个星期");
        }

        Integer year = secondCoursePlanGroupEntity.getYear();
        Integer code = secondCoursePlanGroupEntity.getUpOrDown().getCode();
        Integer sum = secondCoursePlanGroupService.findEndDataSum(year, code);
        if (sum == null) {
            sum = 0;
        }
        secondCoursePlanGroupEntity.setSum(++sum);
        boolean save = secondCoursePlanGroupService.saveOne(secondCoursePlanGroupEntity);
        return R.ok().put("data", save);
    }

    /**
     * 详情
     */
    @ApiImplicitParam(name = "id", value = "分组id")
    @ApiOperation("详情")
    @GetMapping("/info")
    public R info(@RequestParam("id") @NotNull Integer id) {
        SecondCoursePlanGroupEntityDto secondCoursePlanGroupEntity = secondCoursePlanGroupService.findOneById(id);
        if (secondCoursePlanGroupEntity == null) {
             secondCoursePlanGroupEntity = secondCoursePlanGroupService.findOneAndUnitById(id);
            return R.ok().put("data", secondCoursePlanGroupEntity);
        }
        secondCoursePlanGroupEntity.setSecondCourseDtoList(redisUtil.get(Global.KILL_SECOND_COURSE+"all:"+id));

        return R.ok().put("data", secondCoursePlanGroupEntity);
    }

    /**
     * 删除
     */
    @ApiImplicitParam(name = "id", value = "分组id")
    @ApiOperation("删除")
    @PostMapping("/delete")
    public R delete(@RequestParam("id") Integer planGroupId) {
        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "plan_group:" + planGroupId);
        if (hasKey) {
            return R.ok("计划正在进行中,无法删除。");
        }

        SecondCoursePlanGroupEntity secondCoursePlanGroupEntity = secondCoursePlanGroupService.getById(planGroupId);
        return R.ok().put("data", secondCoursePlanGroupEntity);

    }


}
