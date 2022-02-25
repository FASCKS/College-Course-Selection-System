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

        /**
         * 新增个教室
         * @param classroom
         * @return
         */
        boolean insertOne(Classroom classroom);

        /**
         * 查询一条
         * @param id
         * @return
         */
        Classroom findOneById(Integer id);

        /**
         * 更新一条
         * @param classroom
         * @return
         */
        boolean updateOne(Classroom classroom);
    }
