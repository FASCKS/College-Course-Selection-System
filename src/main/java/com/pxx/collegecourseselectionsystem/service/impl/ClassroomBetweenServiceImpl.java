package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.ClassroomBetween;
import com.pxx.collegecourseselectionsystem.mapper.ClassroomBetweenMapper;
import com.pxx.collegecourseselectionsystem.mapper.ClassroomMapper;
import com.pxx.collegecourseselectionsystem.service.ClassroomBetweenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Gpxx
 * @Date 2022/2/24 16:20
 */
@Service
public class ClassroomBetweenServiceImpl extends ServiceImpl<ClassroomBetweenMapper, ClassroomBetween> implements ClassroomBetweenService {
    @Autowired
    private ClassroomMapper classroomMapper;

    /**
     * 删除类型判断你是否关联教室
     *
     * @param id
     * @return
     */
    @Override
    public boolean removeOneById(Integer id) {
        return baseMapper.deleteById(id) > 0;
    }

    /**
     * 更新一条
     *
     * @param classroomBetween
     * @return
     */
    @Override@Transactional
    public boolean updateOneById(ClassroomBetween classroomBetween) {

        this.parameter(classroomBetween);

        boolean updateById = this.updateById(classroomBetween);
        return updateById;
    }
    private void parameter(ClassroomBetween classroomBetween){
        classroomMapper.updateByBetweenTypeId(classroomBetween.getId(),classroomBetween.getBetweenType());
    }
}
