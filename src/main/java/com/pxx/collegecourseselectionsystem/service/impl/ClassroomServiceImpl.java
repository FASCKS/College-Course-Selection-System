package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.entity.Classroom;
import com.pxx.collegecourseselectionsystem.mapper.ClassroomMapper;
import com.pxx.collegecourseselectionsystem.service.ClassroomService;
import org.springframework.stereotype.Service;
/**
 *  @author Gpxx
 *  @Date 2022/2/24 16:24
 */
@Service
public class ClassroomServiceImpl extends ServiceImpl<ClassroomMapper, Classroom> implements ClassroomService{

    /**
     * 所有教室类型
     *
     * @param pagination
     * @return
     */
    @Override
    public PageUtils findAllClassroom(Pagination pagination) {
        IPage<Classroom> classroomIPage= baseMapper.findAllClassroom(new Page<>(pagination.getPage(),pagination.getLimit()));
        return new PageUtils(classroomIPage);
    }
}
