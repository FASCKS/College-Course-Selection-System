package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.ClassroomRoof;
import com.pxx.collegecourseselectionsystem.mapper.ClassroomRoofMapper;
import com.pxx.collegecourseselectionsystem.service.ClassroomRoofService;
import org.springframework.stereotype.Service;
/**
 *  @author Gpxx
 *  @Date 2022/2/24 16:11
 */
@Service
public class ClassroomRoofServiceImpl extends ServiceImpl<ClassroomRoofMapper, ClassroomRoof> implements ClassroomRoofService{

    /**
     * 删除一条判断是否关联教室
     *
     * @param id
     * @return
     */
    @Override
    public boolean removeOneById(Integer id) {
        int delete = baseMapper.deleteById(id);
        return delete>0;
    }
}
