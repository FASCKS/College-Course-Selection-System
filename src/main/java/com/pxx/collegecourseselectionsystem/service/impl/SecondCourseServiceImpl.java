package com.pxx.collegecourseselectionsystem.service.impl;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.ClassSchedule;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import com.pxx.collegecourseselectionsystem.mapper.SecondCourseMapper;
import com.pxx.collegecourseselectionsystem.service.SecondCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    private RedisUtil redisUtil;


    @Override
    public List<SecondCourseDto> findAllSecondCourse(Integer planGroupId) {
        return secondCourseMapper.findAllSecondCourse(planGroupId);
    }

    /**
     * 检查课程是否在时间之内
     *
     * @param secondCourseId
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
    @Override
    public boolean insertOne(SecondCourseDto secondCourseDto) {
        SecondCourse secondCourse = secondCourseMapper.findOneByCourseIdAndUpTimeAndWeek(secondCourseDto.getCourseId(), secondCourseDto.getUpTime(), secondCourseDto.getWeek());
        if (secondCourse != null) {
            return false;
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
}

