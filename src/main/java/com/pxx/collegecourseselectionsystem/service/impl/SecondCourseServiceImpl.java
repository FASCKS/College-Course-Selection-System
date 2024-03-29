package com.pxx.collegecourseselectionsystem.service.impl;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.exception.RRException;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.ClassSchedule;
import com.pxx.collegecourseselectionsystem.entity.Classroom;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import com.pxx.collegecourseselectionsystem.mapper.SecondCourseMapper;
import com.pxx.collegecourseselectionsystem.service.ClassroomService;
import com.pxx.collegecourseselectionsystem.service.SecondCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * @author Galen
 * @Date 2022/2/10 14:48
 */
@Service
public class SecondCourseServiceImpl extends ServiceImpl<SecondCourseMapper, SecondCourse> implements SecondCourseService {

    @Autowired
    private SecondCourseMapper secondCourseMapper;
    @Autowired
    private ClassroomService classroomService;


    @Override
    public List<SecondCourseDto> findAllSecondCourse(Integer planGroupId) {
        return secondCourseMapper.findAllSecondCourse(planGroupId);
    }

    /**
     * 检查课程是否在时间之内
     *
     * @return
     */
    @Override
    public boolean checkTime(SecondCourseDto secondCourseDto) {

        Date startTime = secondCourseDto.getStartTime();
        Date endTime = secondCourseDto.getEndTime();
        DateTime date = DateUtil.date();
        if (date.compareTo(startTime) < 0) {
            return false;
        }
        if (date.compareTo(endTime) > 0) {
            return false;
        }


        return true;
    }

    /**
     * 检查课程是否在时间之内
     *
     * @param secondCourseDto@return
     */
    @Override
    public boolean checkTime(SecondCoursePlanGroupEntity secondCourseDto) {
        Date startTime = secondCourseDto.getStartTime();
        Date endTime = secondCourseDto.getEndTime();
        DateTime date = DateUtil.date();
        if (date.compareTo(startTime) < 0) {
            return false;
        }
        if (date.compareTo(endTime) > 0) {
            return false;
        }


        return true;
    }

    /**
     * 新增数据
     *
     * @param secondCourseDto
     * @return
     */
    @Override@Transactional
    public boolean insertOne(SecondCourse secondCourseDto) {
        SecondCourse secondCourse = secondCourseMapper.findOneByCourseIdAndUpTimeAndWeek(secondCourseDto.getCourseId(), secondCourseDto.getUpTime(), secondCourseDto.getWeek());
        if (secondCourse != null) {
            return false;
        }
        //检查是否有这个教室
        Classroom classroom = classroomService.getById(secondCourseDto.getClassroomId());
        if (classroom==null){
            throw new RRException("教室不存在");
        }
        boolean save = this.save(secondCourseDto);


        return save;
    }

    /**
     * 将临时表中的数据加到课程表
     *
     * @return
     */
    @Override
    public List<ClassSchedule> findAllOrderCourseAndSecondCourseData() {

        return secondCourseMapper.findAllOrderCourseAndSecondCourseData();
    }
    @Override
    public List<ClassSchedule> findAllOrderCourseAndSecondCourseDataTwo() {

        return secondCourseMapper.findAllOrderCourseAndSecondCourseDataTwo();
    }

    /**
     * 通过用户id查询数量
     *
     * @param list
     * @return
     */
    @Override
    public Integer findCountByUserId(Collection<Long> list) {
        return baseMapper.findCountByUserId(list);
    }

    /**
     * 通过组获取所有
     *
     * @param planGroupId
     * @return
     */
    @Override
    public List<SecondCourse> findAllByPlanGroupId(Integer planGroupId) {
        QueryWrapper<SecondCourse> secondCourseQueryWrapper=new QueryWrapper<>();
        secondCourseQueryWrapper.eq("plan_group_id",planGroupId);
        return baseMapper.selectList(secondCourseQueryWrapper);
    }
}

