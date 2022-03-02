package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.exception.RRException;
import com.pxx.collegecourseselectionsystem.entity.ClassroomRoof;
import com.pxx.collegecourseselectionsystem.mapper.ClassroomRoofMapper;
import com.pxx.collegecourseselectionsystem.service.ClassroomRoofService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Gpxx
 * @Date 2022/2/24 16:11
 */
@Service
public class ClassroomRoofServiceImpl extends ServiceImpl<ClassroomRoofMapper, ClassroomRoof> implements ClassroomRoofService {

    /**
     * 删除一条判断是否关联教室
     *
     * @param id
     * @return
     */
    @Override
    public boolean removeOneById(Integer id) {
        int delete = baseMapper.deleteById(id);
        return delete > 0;
    }

    /**
     * 新增一条
     *
     * @param classroomRoof
     * @return
     */
    @Override@Transactional
    public boolean insertOne(ClassroomRoof classroomRoof) {
        this.check(classroomRoof);
        int insert = baseMapper.insert(classroomRoof);
        return insert > 0;
    }

    /**
     * 编辑
     *
     * @param classroomRoof
     * @return
     */
    @Override@Transactional
    public boolean updateOneById(ClassroomRoof classroomRoof) {
        this.check(classroomRoof);
        int update = baseMapper.updateById(classroomRoof);
        return update>0;
    }

    private void check(ClassroomRoof classroomRoof){
        //检测名字和编号是否相同
        QueryWrapper<ClassroomRoof> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(ClassroomRoof.COL_ROOF_NAME, classroomRoof.getRoofName().trim())
                .eq("roof_number", classroomRoof.getRoofNumber());
        Long selectCount = baseMapper.selectCount(queryWrapper);
        if (selectCount>0){
            throw new RRException(classroomRoof.getRoofName()+" "+classroomRoof.getRoofNumber()+"已经存在");
        }
    }
}
