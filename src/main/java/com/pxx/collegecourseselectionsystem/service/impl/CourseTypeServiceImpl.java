package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.exception.RRException;
import com.pxx.collegecourseselectionsystem.entity.CourseType;
import com.pxx.collegecourseselectionsystem.mapper.CourseTypeMapper;
import com.pxx.collegecourseselectionsystem.service.CourseService;
import com.pxx.collegecourseselectionsystem.service.CourseTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *  @author Gpxx
 *  @Date 2022/3/2 16:05
 */
@Service
public class CourseTypeServiceImpl extends ServiceImpl<CourseTypeMapper, CourseType> implements CourseTypeService{

    @Autowired
    private CourseService courseService;
    /**
     * 删除一条
     *
     * @param id
     * @return
     */
    @Override@Transactional
    public boolean deleteOneById(Integer id) {
     Integer count=   courseService.CountByType(id);
     if (count!=0){
         throw new RRException("类型下关联"+count+"个课程");
     }
        boolean removeById = this.removeById(id);
        return removeById;
    }
}
