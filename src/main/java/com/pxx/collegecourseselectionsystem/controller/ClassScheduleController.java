package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.service.ClassScheduleService;
import com.pxx.collegecourseselectionsystem.vo.course.ClassBook;
import com.pxx.collegecourseselectionsystem.vo.course.ClassScheduleTime;
import com.pxx.collegecourseselectionsystem.vo.course.ClassScheduleVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 课程表
 */
@Api(tags = "课程表", value = "课程表")
@RestController
@RequestMapping("course/classSchedule")
public class ClassScheduleController {
    @Autowired
    private ClassScheduleService classScheduleService;

    @ApiOperation("学生自己的课程表")
    @PreAuthorize("hasAnyAuthority('course:classSchedule:user:course')")
    @GetMapping("/user/course")
    public R courseByUserId() {
        ClassScheduleVo classScheduleVo = classScheduleService.findMyClassSchedule();
        return R.ok().put("data", classScheduleVo);
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
