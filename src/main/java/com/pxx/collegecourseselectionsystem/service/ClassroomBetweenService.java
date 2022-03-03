package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.entity.ClassroomBetween;
    /**
 *  @author Gpxx
 *  @Date 2022/2/24 16:20
 */
public interface ClassroomBetweenService extends IService<ClassroomBetween>{

        /**
         * 删除类型判断你是否关联教室
         * @param id
         * @return
         */
        boolean removeOneById(Integer id);

        /**
         * 更新一条
         * @param classroomBetween
         * @return
         */
        boolean updateOneById(ClassroomBetween classroomBetween);
    }
