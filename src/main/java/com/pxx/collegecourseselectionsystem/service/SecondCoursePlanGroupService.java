package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.dto.SecondCoursePlanGroupEntityDto;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;

import java.util.List;

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
        SecondCoursePlanGroupEntityDto findOneById(Integer id);

        /**
         * 获取最后一条数据
         * @return
         */
        Integer findEndDataSum(Integer year,Integer code);

        boolean saveOne(SecondCoursePlanGroupEntityDto secondCoursePlanGroupEntity);

        boolean updateOne(SecondCoursePlanGroupEntityDto secondCoursePlanGroupEntity);

        /**
         * 查询该分组下得部门id
         * @param planGroupId
         * @return
         */
        List<Integer> findUnitIdByPlanGroupId(Integer planGroupId);

        /**
         * 查询一条并且包含用户id
         * @param id
         * @return
         */
        SecondCoursePlanGroupEntityDto findOneAndUnitById(Integer id);
}
