package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.entity.ClassroomRoof;
    /**
 *  @author Gpxx
 *  @Date 2022/2/24 16:11
 */
public interface ClassroomRoofService extends IService<ClassroomRoof>{

        /**
         * 删除一条判断是否关联教室
         * @param id
         * @return
         */
        boolean removeOneById(Integer id);

        /**
         * 新增一条
         * @param classroomRoof
         * @return
         */
        boolean insertOne(ClassroomRoof classroomRoof);

        /**
         * 编辑
         * @param classroomRoof
         * @return
         */
        boolean updateOneById(ClassroomRoof classroomRoof);
    }
