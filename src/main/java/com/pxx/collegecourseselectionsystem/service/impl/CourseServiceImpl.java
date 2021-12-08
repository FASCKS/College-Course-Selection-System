package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.CourseEntity;
import com.pxx.collegecourseselectionsystem.mapper.CourseMapper;
import com.pxx.collegecourseselectionsystem.service.CourseService;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CourseServiceImpl extends ServiceImpl<CourseMapper, CourseEntity> implements CourseService{

    @Override
    public int updateBatch(List<CourseEntity> list) {
        return baseMapper.updateBatch(list);
    }
    @Override
    public int batchInsert(List<CourseEntity> list) {
        return baseMapper.batchInsert(list);
    }
    @Override
    public int insertOrUpdate(CourseEntity record) {
        return baseMapper.insertOrUpdate(record);
    }
    @Override
    public int insertOrUpdateSelective(CourseEntity record) {
        return baseMapper.insertOrUpdateSelective(record);
    }
}
