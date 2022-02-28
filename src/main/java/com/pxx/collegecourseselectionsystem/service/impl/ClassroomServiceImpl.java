package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.exception.RRException;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.dto.ClassroomRoofDto;
import com.pxx.collegecourseselectionsystem.entity.Classroom;
import com.pxx.collegecourseselectionsystem.entity.ClassroomBetween;
import com.pxx.collegecourseselectionsystem.entity.ClassroomRoof;
import com.pxx.collegecourseselectionsystem.mapper.ClassroomMapper;
import com.pxx.collegecourseselectionsystem.service.ClassroomBetweenService;
import com.pxx.collegecourseselectionsystem.service.ClassroomRoofService;
import com.pxx.collegecourseselectionsystem.service.ClassroomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/2/24 16:24
 */
@Service
public class ClassroomServiceImpl extends ServiceImpl<ClassroomMapper, Classroom> implements ClassroomService {
    @Autowired
    private ClassroomBetweenService classroomBetweenService;
    @Autowired
    private ClassroomRoofService classroomRoofService;

    /**
     * 所有教室类型
     *
     * @param pagination
     * @return
     */
    @Override
    public PageUtils findAllClassroom(Pagination pagination) {
        Page<ClassroomRoofDto> classroomRoofDtoPage = new Page<>(pagination.getPage(), pagination.getLimit());

        long size = classroomRoofDtoPage.getSize();
        long current = (classroomRoofDtoPage.getCurrent() - 1) * size;

        classroomRoofDtoPage.setTotal(baseMapper.findAllClassroomCount());
        List<ClassroomRoofDto> allClassroom = baseMapper.findAllClassroom(current, size);

        classroomRoofDtoPage.setRecords(allClassroom);
        return new PageUtils(classroomRoofDtoPage);
    }

    /**
     * 新增个教室
     *
     * @param classroom
     * @return
     */
    @Transactional
    @Override
    public boolean insertOne(Classroom classroom) {
        this.check(classroom);

        int insert = baseMapper.insert(classroom);

        return insert > 0;
    }

    /**
     * 查询一条
     *
     * @param id
     * @return
     */
    @Override
    public Classroom findOneById(Integer id) {
        return baseMapper.findOne(id);
    }

    /**
     * 更新一条
     *
     * @param classroom
     * @return
     */
    @Override
    @Transactional
    public boolean updateOne(Classroom classroom) {
        this.check(classroom);
        int update = baseMapper.updateById(classroom);
        return update > 0;
    }

    /**
     * 检测是否重复
     */
    private void check(Classroom classroom) {
        {
            //先检查是否有这个大楼类型
            ClassroomRoof classroomRoof = classroomRoofService.getById(classroom.getRoof());
            if (classroomRoof == null) {
                throw new RRException("大楼类型不存在");
            }
            ClassroomBetween classroomBetween = classroomBetweenService.getById(classroom.getBetween());
            if (classroomBetween == null) {
                throw new RRException("教室类型不存在");
            }
        }
        //检查是否重复添加
        Classroom oneByRoofAndBetweenAndFloor = baseMapper.findOneByRoofAndBetweenAndFloor(classroom.getRoof(), classroom.getBetween(), classroom.getFloor());
        if (oneByRoofAndBetweenAndFloor != null) {
            throw new RRException("教室已经存在");
        }
    }
}
