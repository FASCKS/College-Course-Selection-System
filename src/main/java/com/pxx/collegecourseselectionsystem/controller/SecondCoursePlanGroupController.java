package com.pxx.collegecourseselectionsystem.controller;

import com.pxx.collegecourseselectionsystem.common.utils.*;
import com.pxx.collegecourseselectionsystem.common.validator.group.Insert;
import com.pxx.collegecourseselectionsystem.common.validator.group.Update;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.dto.SecondCoursePlanGroupEntityDto;
import com.pxx.collegecourseselectionsystem.entity.enums.SecondCoursePlanGroupEnum;
import com.pxx.collegecourseselectionsystem.service.SecondCoursePlanGroupService;
import com.pxx.collegecourseselectionsystem.util.Global;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * @author Gpxx
 * @Date 2022/2/14 10:26
 */
@Api(tags = "抢课计划分组")
@Slf4j
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
    @ApiOperation("列表")
    @PreAuthorize("hasAnyAuthority('plan:gorup:list')")
    @GetMapping("/list")
    public R list(@Validated Pagination pagination) {
        PageUtils allGroupPlan = secondCoursePlanGroupService.findAllGroupPlan(pagination);
        return R.ok().put("data", allGroupPlan);
    }

    /**
     * 编辑
     */
    @ApiOperation("编辑")
    @PreAuthorize("hasAnyAuthority('plan:gorup:update')")
    @PostMapping("/update")
    public R update(@RequestBody @Validated(Update.class) SecondCoursePlanGroupEntityDto secondCoursePlanGroupEntity) {
        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "plan_group:" + secondCoursePlanGroupEntity.getId());
        if (hasKey) {
            log.info("{} 尝试编译一个正在进行中的计划", SpringSecurityUtil.getUsername());
            return R.ok("计划正在进行中,无法编辑.");
        }
        Integer state = secondCoursePlanGroupService.getOneByState(secondCoursePlanGroupEntity.getId());
        if (SecondCoursePlanGroupEnum.END.getCode() == state) {
           return R.error("计划已经结束");
        }


        boolean update = secondCoursePlanGroupService.updateOne(secondCoursePlanGroupEntity);
        return R.ok().put("data", update);
    }

    /**
     * 新增
     */
    @ApiOperation("新增")
    @PreAuthorize("hasAnyAuthority('plan:gorup:insert')")
    @PostMapping("/insert")
    public R insert(@RequestBody @Validated(Insert.class) SecondCoursePlanGroupEntityDto secondCoursePlanGroupEntity) {
        Date startTime = secondCoursePlanGroupEntity.getStartTime();
        Date endTime = secondCoursePlanGroupEntity.getEndTime();
/*        if (startTime.compareTo(DateUtil.date()) <= 0) {
            return R.error("开始时间小于当前时间");
        }*/
/*        if (DateUtil.betweenDay(startTime, endTime, true) < 7) {
            return R.error("计划开始时间和结束时间间隔不能小于一个星期");
        }*/

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
    @ApiImplicitParam(name = "id", value = "分组id",dataTypeClass = Integer.class)
    @ApiOperation("详情")
    @PreAuthorize("hasAnyAuthority('plan:gorup:info')")
    @GetMapping("/info")
    public R info(@RequestParam("id") @NotNull Integer id) {
        SecondCoursePlanGroupEntityDto secondCoursePlanGroupEntity = secondCoursePlanGroupService.findOneById(id);
        if (secondCoursePlanGroupEntity == null) {
            //如果没有课程
            secondCoursePlanGroupEntity = secondCoursePlanGroupService.findOneAndUnitById(id);
            return R.ok().put("data", secondCoursePlanGroupEntity);
        }
        for (SecondCourseDto secondCourseDto : secondCoursePlanGroupEntity.getSecondCourseDtoList()) {
            Integer sum = redisUtil.get(Global.KILL_SECOND_COURSE + "sum:" + secondCourseDto.getId());
            if (sum != null) {
                secondCourseDto.setCourseSum(sum);
            }

        }
        return R.ok().put("data", secondCoursePlanGroupEntity);
    }

    /**
     * 删除
     */
    @ApiImplicitParam(name = "id", value = "分组id")
    @ApiOperation("删除")
    @PreAuthorize("hasAnyAuthority('plan:gorup:delete')")
    @PostMapping("/delete")
    public R delete(@RequestParam("id") Integer planGroupId) {
        boolean hasKey = redisUtil.hasKey(Global.KILL_SECOND_COURSE + "plan_group:" + planGroupId);
        if (hasKey) {
            return R.error("计划正在进行中,无法删除。");
        }

        boolean removeById = secondCoursePlanGroupService.removeOneById(planGroupId);
        return R.ok().put("data",removeById);

    }


}
