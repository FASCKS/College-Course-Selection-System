package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.entity.CourseType;
    /**
 *  @author Gpxx
 *  @Date 2022/3/2 16:05
 */
public interface CourseTypeService extends IService<CourseType>{

        /**
         * 删除一条
         * @param id
         * @return
         */
        boolean deleteOneById(Integer id);
    }
