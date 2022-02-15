package com.pxx.collegecourseselectionsystem.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.common.validator.group.Insert;
import com.pxx.collegecourseselectionsystem.common.validator.group.Update;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.dto.SecondCoursePlanGroupEntityDto;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import com.pxx.collegecourseselectionsystem.entity.enums.SecondCoursePlanGroupEnum;
import com.pxx.collegecourseselectionsystem.service.SecondCoursePlanGroupService;
import com.pxx.collegecourseselectionsystem.util.Global;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;
import java.util.List;

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
    public R update(@RequestBody @Validated(Update.class) SecondCoursePlanGroupEntity secondCoursePlanGroupEntity) {
        if (secondCoursePlanGroupEntity.getState().getCode() != 0) {
            return R.ok("只能编辑未开始的计划");
        }
        Integer year = secondCoursePlanGroupEntity.getYear();
        Integer code = secondCoursePlanGroupEntity.getUpOrDown().getCode();
        Integer sum = secondCoursePlanGroupService.findEndDataSum(year, code);
        if (sum == null) {
            sum = 0;
        }
        secondCoursePlanGroupEntity.setSum(++sum);
        QueryWrapper<SecondCoursePlanGroupEntity> secondCoursePlanGroupEntityQueryWrapper = new QueryWrapper<>();
        secondCoursePlanGroupEntityQueryWrapper.eq("state", 0);
        boolean update = secondCoursePlanGroupService.update(secondCoursePlanGroupEntity, secondCoursePlanGroupEntityQueryWrapper);
        return R.ok().put("data", update);
    }

    /**
     * 新增
     */
    @ApiOperation("新增")
    @PostMapping("/insert")
    public R insert(@RequestBody @Validated(Insert.class) SecondCoursePlanGroupEntity secondCoursePlanGroupEntity) {
        Integer year = secondCoursePlanGroupEntity.getYear();
        Integer code = secondCoursePlanGroupEntity.getUpOrDown().getCode();
        Integer sum = secondCoursePlanGroupService.findEndDataSum(year, code);
        if (sum == null) {
            sum = 0;
        }
        secondCoursePlanGroupEntity.setSum(++sum);
        boolean save = secondCoursePlanGroupService.save(secondCoursePlanGroupEntity);
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
            SecondCoursePlanGroupEntity secondCoursePlanGroup = secondCoursePlanGroupService.getById(id);
            return R.ok().put("data", secondCoursePlanGroup);
        }
        List<SecondCourseDto> secondCourseDtoList = secondCoursePlanGroupEntity.getSecondCourseDtoList();
        //同步库存
        //如果是正在进行中的
        if (secondCoursePlanGroupEntity.getState()== SecondCoursePlanGroupEnum.STARTED){
            for (SecondCourseDto secondCourseDto : secondCourseDtoList) {
                Integer courseSum = (Integer) redisUtil.get(Global.KILL_SECOND_COURSE + "sum:" + secondCourseDto.getId());
                if (courseSum!=null){
                    secondCourseDto.setCourseSum(courseSum);
                }
            }
        }

        return R.ok().put("data", secondCoursePlanGroupEntity);
    }

    /**
     * 删除
     */
    @ApiImplicitParam(name = "id", value = "分组id")
    @ApiOperation("删除")
    @PostMapping("/delete")
    public R delete(@RequestParam("id") Integer id) {
        SecondCoursePlanGroupEntity secondCoursePlanGroupEntity = secondCoursePlanGroupService.getById(id);
        return R.ok().put("data", secondCoursePlanGroupEntity);

    }


}
