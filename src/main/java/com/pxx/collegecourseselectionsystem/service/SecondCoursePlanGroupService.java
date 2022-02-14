package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanEntity;
    /**
 *  @author Gpxx
 *  @Date 2022/2/14 10:25
 */
public interface SecondCoursePlanGroupService extends IService<SecondCoursePlanEntity>{

        /**
         * 所有分组
         * @param pagination
         * @return
         */
        PageUtils findAllGroupPlan(Pagination pagination);
    }
