package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.exception.RRException;
import com.pxx.collegecourseselectionsystem.dto.CourseDto;
import com.pxx.collegecourseselectionsystem.entity.CourseEntity;
import com.pxx.collegecourseselectionsystem.entity.CourseType;
import com.pxx.collegecourseselectionsystem.mapper.CourseMapper;
import com.pxx.collegecourseselectionsystem.service.CourseService;
import com.pxx.collegecourseselectionsystem.service.CourseTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CourseServiceImpl extends ServiceImpl<CourseMapper, CourseEntity> implements CourseService{

@Autowired
private CourseTypeService courseTypeService;
    /**
     * 统计某个课程类型的数量
     *
     * @param id
     * @return
     */
    @Override
    public Integer CountByType(Integer type) {

        return baseMapper.countByType(type);
    }

    @Override
    public Page<CourseDto> findAllCourse(Page<CourseEntity> courseEntityPage) {

        return baseMapper.findAllCourse(courseEntityPage);
    }

    /**
     * 更新
     *
     * @param courseEntity
     * @return
     */
    @Override@Transactional
    public boolean updateOneById(CourseEntity courseEntity) {
        check(courseEntity);
        boolean updateById = this.updateById(courseEntity);
        return updateById;
    }

    @Override@Transactional
    public boolean saveOneById(CourseEntity courseEntity) {
        check(courseEntity);
        boolean save = this.save(courseEntity);
        return save;
    }
    private void check(CourseEntity courseEntity){
        CourseType courseType = courseTypeService.getById(courseEntity.getType());
        if (courseType==null){
            throw new RRException("不存在的课程类型");
        }
    }
}
