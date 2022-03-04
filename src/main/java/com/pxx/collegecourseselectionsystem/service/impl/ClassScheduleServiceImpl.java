package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.utils.SpringSecurityUtil;
import com.pxx.collegecourseselectionsystem.entity.ClassSchedule;
import com.pxx.collegecourseselectionsystem.mapper.ClassScheduleMapper;
import com.pxx.collegecourseselectionsystem.service.ClassScheduleService;
import com.pxx.collegecourseselectionsystem.vo.course.ClassScheduleVo;
import com.pxx.collegecourseselectionsystem.vo.course.SimpleClassScheduleVo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassScheduleServiceImpl extends ServiceImpl<ClassScheduleMapper, ClassSchedule> implements ClassScheduleService {

    /**
     * 查询自己的课程表
     *
     * @return
     */
    @Override
    public ClassScheduleVo findMyClassSchedule() {
        Long userId = SpringSecurityUtil.getUserId();
        ClassScheduleVo classScheduleVo=baseMapper.findClassScheduleByUserId(userId);
        return classScheduleVo;


    }

    /**
     * 查询学生的课程表
     *
     * @param userId
     * @return
     */
    @Override
    public ClassScheduleVo findClassScheduleByUserId(Long userId) {
        ClassScheduleVo classScheduleVo=baseMapper.findClassScheduleByUserId(userId);
        return classScheduleVo;

    }

    /**
     * 查询所有课表
     */
    @Override
    public List<SimpleClassScheduleVo> findSimpleMyClassSchedule() {
        List<SimpleClassScheduleVo> classScheduleVo=baseMapper.findSimpleMyClassSchedule();
        return classScheduleVo;
    }

    /**
     * 查询自己的课表
     */
    @Override
    public SimpleClassScheduleVo findMySimpleMyClassSchedule() {
        Long userId = SpringSecurityUtil.getUserId();
        return baseMapper.findMySimpleMyClassSchedule(userId);
    }
}

