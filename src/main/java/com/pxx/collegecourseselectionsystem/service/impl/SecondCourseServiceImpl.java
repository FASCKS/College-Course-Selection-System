package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
import com.pxx.collegecourseselectionsystem.mapper.SecondCourseMapper;
import com.pxx.collegecourseselectionsystem.service.SecondCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Galen
 * @Date 2022/2/10 14:48
 */
@Service
public class SecondCourseServiceImpl extends ServiceImpl<SecondCourseMapper, SecondCourse> implements SecondCourseService {

    @Autowired
    private SecondCourseMapper secondCourseMapper;
    @Override
    public int updateBatch(List<SecondCourse> list) {
        return baseMapper.updateBatch(list);
    }

    @Override
    public int batchInsert(List<SecondCourse> list) {
        return baseMapper.batchInsert(list);
    }

    @Override
    public int insertOrUpdate(SecondCourse record) {
        return baseMapper.insertOrUpdate(record);
    }

    @Override
    public int insertOrUpdateSelective(SecondCourse record) {
        return baseMapper.insertOrUpdateSelective(record);
    }

    @Override
    public List<SecondCourseDto> findAllSecondCourse() {
        return secondCourseMapper.findAllSecondCourse();
    }
}

