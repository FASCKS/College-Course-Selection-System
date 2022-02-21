package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupAndUnit;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author Gpxx
 * @Date 2022/2/15 15:14
 */
@Mapper
public interface SecondCoursePlanGroupAndUnitMapper extends BaseMapper<SecondCoursePlanGroupAndUnit> {
    Integer removeByScpgId(@Param("scpgId") Integer scpgId);
}