package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.entity.Classroom;
    /**
 *  @author Gpxx
 *  @Date 2022/2/24 16:24
 */
public interface ClassroomService extends IService<Classroom>{

        /**
         * 所有教室类型
         * @param pagination
         * @return
         */
        PageUtils findAllClassroom(Pagination pagination);
    }
