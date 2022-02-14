package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 *  @author Gpxx
 *  @Date 2022/2/14 10:25
 */
@Mapper
public interface SecondCoursePlanGroupMapper extends BaseMapper<SecondCoursePlanGroupEntity> {
    IPage<SecondCoursePlanGroupEntity> findAllGroupPlan(Page<SecondCoursePlanGroupEntity> secondCoursePlanEntityPage);

    /**
     * 查询一条通过id
     * @param id
     * @return
     */
    SecondCoursePlanGroupEntity findOneById(Integer id);
}