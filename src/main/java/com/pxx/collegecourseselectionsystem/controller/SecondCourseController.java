package com.pxx.collegecourseselectionsystem.controller;

import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.service.OrderCourseService;
import com.pxx.collegecourseselectionsystem.service.SecondCourseService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
import java.util.List;

/**
 * @author pxx
 * @Date 2022/2/10 14:49
 */
@Validated
@Api(tags = "抢课")
@RestController
@RequestMapping("/second")
public class SecondCourseController {
    @Autowired
    private SecondCourseService secondCourseService;
    @Autowired
    private OrderCourseService orderCourseService;

    @PreAuthorize("hasAnyAuthority('ccss:second:list')")
    @GetMapping("/list")
    public List<SecondCourseDto> list() {
        return secondCourseService.findAllSecondCourse();
    }

    /**
     * 抢课链接
     * @param secondCourseId
     * @return
     */
    @GetMapping("/go/course/{id}")
    public R goCourse(@PathVariable("id") Integer secondCourseId) {

        boolean checkTime = secondCourseService.checkTime(secondCourseId);
        if (!checkTime) {
            return R.error("时间未开始或已经结束");
        }
        return null;
    }
    /**
     * 发布抢课内容
     */

    /**
     * 添加选课
     */
    @PostMapping("/insert")
    public R insert(@RequestBody @Validated SecondCourseDto secondCourseDto) {
        if (secondCourseDto.getStartTime().compareTo(secondCourseDto.getEndTime()) <= 0) {
            return R.error("开始时间不能小于结束时间");
        }
        secondCourseDto.setState(0);
        boolean insert = secondCourseService.insertOne(secondCourseDto);
        return R.ok().put("data", insert);
    }

    /**
     * 删除选课
     */
    @PostMapping("/delete")
    public R delete(@NotEmpty @RequestBody List<Integer> course) {
        boolean removeBatchByIds = secondCourseService.removeBatchByIds(course);
        return R.ok().put("data", removeBatchByIds);
    }

    /**
     * 编辑
     */
    @PostMapping("/update")
    public R update(@RequestBody @Validated SecondCourseDto secondCourseDto) {
        boolean update = secondCourseService.updateById(secondCourseDto);
        return R.ok().put("data", update);
    }

}
