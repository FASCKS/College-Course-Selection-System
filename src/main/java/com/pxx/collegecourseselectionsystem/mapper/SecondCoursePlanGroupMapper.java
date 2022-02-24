package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.dto.SecondCoursePlanGroupEntityDto;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * @author Gpxx
 * @Date 2022/2/14 10:25
 */
@Mapper@InterceptorIgnore(tenantLine = "1")
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
    @InterceptorIgnore(tenantLine = "false")
    @Deprecated
    Integer findAllGroupPlanCount();
    @InterceptorIgnore(tenantLine = "false")
    IPage<SecondCoursePlanGroupEntity> findAllGroupPlan(Page<SecondCoursePlanGroupEntity> planGroupEntityDtoPage);

    List<Integer> findUnitIdByPlanGroupId(@Param("planGroupId") Integer planGroupId);
    @InterceptorIgnore(tenantLine = "false")
    SecondCoursePlanGroupEntityDto findOneAndUnitById(@Param("planGroupId") Integer planGroupId);

    /**
     * 查询状态
     *
     * @param id
     */
    @InterceptorIgnore(tenantLine = "false")
    Integer getOneByState(@Param("id") Integer id);
}