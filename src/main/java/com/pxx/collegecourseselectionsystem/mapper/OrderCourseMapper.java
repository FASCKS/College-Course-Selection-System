package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.OrderCourse;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Galen
 * @Date 2022/2/10 14:49
 */
@Mapper
public interface OrderCourseMapper extends BaseMapper<OrderCourse> {
    void deleteAll();

    /**
     * 通过分组获取所有抢课订单
     *
     * @param planGroupId
     * @return
     */
    List<SecondCourseDto> findAllByPlanGroupId(@Param("planGroupId") Integer planGroupId);
}