package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupAndUnit;
    /**
 *  @author Gpxx
 *  @Date 2022/2/15 15:14
 */
public interface SecondCoursePlanGroupAndUnitService extends IService<SecondCoursePlanGroupAndUnit>{

        /**
         * 删除所有通过 scpgid
         * @param id
         */
        Integer removeByScpgId(Integer scpgId);
    }
