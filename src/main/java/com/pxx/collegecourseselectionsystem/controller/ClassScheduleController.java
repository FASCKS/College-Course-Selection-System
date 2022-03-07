package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.entity.*;
import com.pxx.collegecourseselectionsystem.service.*;
import com.pxx.collegecourseselectionsystem.vo.course.ClassBook;
import com.pxx.collegecourseselectionsystem.vo.course.ClassScheduleTime;
import com.pxx.collegecourseselectionsystem.vo.course.ClassScheduleVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 课程表
 */
@Validated
@Api(tags = "课程表", value = "课程表")
@RestController
@RequestMapping("course/classSchedule")
public class ClassScheduleController {
    @Autowired
    private ClassScheduleService classScheduleService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SysUnitService sysUnitService;
    @Autowired
    private ClassroomService classroomService;

    @ApiOperation("学生自己的课程表")
    @PreAuthorize("hasAnyAuthority('course:classSchedule:user:course')")
    @GetMapping("/user/course")
    public R courseByUserId() {
        ClassScheduleVo classScheduleVo = classScheduleService.findMyClassSchedule();
        return R.ok().put("data", classScheduleVo);
    }

    @ApiOperation("某个学生的课程表")
    @PreAuthorize("hasAnyAuthority('course:classSchedule:find:course')")
    @GetMapping("/find/course")
    public R findScheduleByUserId(@NotNull @RequestParam("userId") Long userId) {
        ClassScheduleVo classScheduleVo = classScheduleService.findClassScheduleByUserId(userId);
        return R.ok().put("data", classScheduleVo);
    }

    @ApiOperation("初始化课程设置")
    @PreAuthorize("hasAnyAuthority('course:classSchedule:initialization')")
    @PostMapping("/initialization")
    public R initialization(@RequestBody @Validated @NotEmpty List<ClassSchedule> classScheduleList) {
        //获取所有课程
        List<CourseEntity> courseEntityList = courseService.list();
        //获取所有课程
        List<SysUserEntity> sysUserEntityList = sysUserService.list();
        //所有部门
        List<SysUnitEntity> sysUnitEntityList = sysUnitService.list();
        //所有教室
        List<Classroom> classroomList = classroomService.list();
        //符合条件的课程id
        List<ClassSchedule> classSchedules = classScheduleList.stream()
                //过滤不存在的课程
                .filter(classSchedule -> {
                            for (CourseEntity courseEntity : courseEntityList) {
                                boolean equals = courseEntity.getId().equals(classSchedule.getCourseId());
                                return equals;
                            }
                            return false;
                        }
                )
                //过滤不存在的学生
                .filter(classSchedule -> {
                    for (SysUserEntity sysUserEntity : sysUserEntityList) {
                        boolean equals = sysUserEntity.getUserId().equals(classSchedule.getUserId());
                        return equals;
                    }
                    return false;
                })
                //过滤不存在的老师
                .filter(classSchedule -> {
                    for (SysUserEntity sysUserEntity : sysUserEntityList) {
                        boolean equals = sysUserEntity.getUserId().equals(classSchedule.getTeacher());
                        return equals;
                    }
                    return false;
                })
                //过滤不存在的部门
                .filter(classSchedule -> {
                    for (SysUnitEntity sysUnitEntity : sysUnitEntityList) {
                        boolean equals = sysUnitEntity.getUnitId().equals(classSchedule.getUnitId());
                        return equals;
                    }
                    return false;
                })
                //过滤所有教室
                .filter(classSchedule -> {
                    for (Classroom classroom : classroomList) {
                        boolean equals = classroom.getId().equals(classroom.getId());
                        return equals;
                    }
                    return false;
                }).map(classSchedule -> {
                    classSchedule.setCreateTime(DateUtil.date());
                    return classSchedule;
                }).collect(Collectors.toList());

        boolean saveBatch = classScheduleService.saveBatch(classSchedules);


        return R.ok().put("data", saveBatch);
    }


    @ApiOperation("导出课程表 Excel 表格")
    @PreAuthorize("hasAnyAuthority('course:classSchedule:get:user:course')")
    @GetMapping("/get/classSchedule")
    public void getClassSchedule(HttpServletResponse httpServletResponse) throws IOException {
        ClassScheduleVo classScheduleVo = classScheduleService.findMyClassSchedule();
        List<ClassBook> classBook = classScheduleVo.getClassBook();

        String[][] temps = new String[9][7];
        for (ClassBook simpleClassBook : classBook) {
            List<ClassScheduleTime> classScheduleTimes = simpleClassBook.getClassScheduleTimes();
            for (ClassScheduleTime classScheduleTime : classScheduleTimes) {
                Integer upTime = classScheduleTime.getUpTime();
                Integer week = classScheduleTime.getWeek();
                //给空间空出空间
                if (upTime >= 5) {
                    upTime++;
                }
                temps[upTime - 1][week] = simpleClassBook.getCourseName();
            }
        }

        int sum = 0;
        //给左边加上序号
        for (int i = 0; i < 9; i++) {
            sum++;
            if (i == 4) {
                i++;
                temps[i][0] = Convert.toStr(sum);
                continue;
            }
            temps[i][0] = Convert.toStr(sum);
        }
        List<List<String>> listList = new ArrayList<>();
        for (String[] rows : temps) {
            List<String> course = CollUtil.newArrayList(rows);
            listList.add(course);
        }
        // 通过工具类创建writer，默认创建xls格式
        ExcelWriter writer = ExcelUtil.getWriter();
        //跳过当前行，既第一行，非必须，在此演示用
        writer.passCurrentRow();
        //合并单元格后的标题行，使用默认标题样式
        writer.merge(listList.get(0).size() - 1, "课程表");
        //合并上午和下午之间的单元格
        writer.merge(6, 6, 0, listList.get(0).size() - 1, "", true);
        // 一次性写出内容，使用默认样式，强制输出标题
        writer.write(listList, true);

        //response为HttpServletResponse对象
        httpServletResponse.setContentType("application/vnd.ms-excel;charset=utf-8");
        //test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=课程表.xls");
        ServletOutputStream out = httpServletResponse.getOutputStream();

        writer.flush(out, true);
        // 关闭writer，释放内存
        writer.close();
        //此处记得关闭输出Servlet流
        IoUtil.close(out);

    }
}
