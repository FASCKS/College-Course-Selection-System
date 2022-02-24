package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.ClassroomBetween;
import com.pxx.collegecourseselectionsystem.mapper.ClassroomBetweenMapper;
import com.pxx.collegecourseselectionsystem.service.ClassroomBetweenService;
import org.springframework.stereotype.Service;
/**
 *  @author Gpxx
 *  @Date 2022/2/24 16:20
 */
@Service
public class ClassroomBetweenServiceImpl extends ServiceImpl<ClassroomBetweenMapper, ClassroomBetween> implements ClassroomBetweenService{

    /**
     * 删除类型判断你是否关联教室
     *
     * @param id
     * @return
     */
    @Override
    public boolean removeOneById(Integer id) {
        return baseMapper.deleteById(id)>0;
    }
}
