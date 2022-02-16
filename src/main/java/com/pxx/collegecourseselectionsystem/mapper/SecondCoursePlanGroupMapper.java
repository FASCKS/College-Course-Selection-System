package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.dto.SecondCoursePlanGroupEntityDto;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/2/14 10:25
 */
@Mapper
public interface SecondCoursePlanGroupMapper extends BaseMapper<SecondCoursePlanGroupEntity> {


    /**
     * 查询一条通过id
     *
     * @param id
     * @return
     */
    SecondCoursePlanGroupEntityDto findOneById(@Param("id") Integer id);

    /**
     * 最后一条数据
     *
     * @param year
     * @param code
     * @return
     */
    Integer findEndDataSum(@Param("year") Integer year, @Param("code") Integer code);

    /**
     * 查询数据总数
     *
     * @return
     */
    Integer findAllGroupPlanCount();

    List<SecondCoursePlanGroupEntityDto> findAllGroupPlan(@Param("index") Long index, @Param("size") Long size);
}