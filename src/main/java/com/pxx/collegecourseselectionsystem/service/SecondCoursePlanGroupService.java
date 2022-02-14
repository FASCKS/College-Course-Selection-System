package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
    /**
 *  @author Gpxx
 *  @Date 2022/2/14 10:25
 */
public interface SecondCoursePlanGroupService extends IService<SecondCoursePlanGroupEntity>{

        /**
         * 所有分组
         * @param pagination
         * @return
         */
        PageUtils findAllGroupPlan(Pagination pagination);

        /**
         * 查询一条通过id
         * @param id
         * @return
         */
        SecondCoursePlanGroupEntity findOneById(Integer id);
    }
