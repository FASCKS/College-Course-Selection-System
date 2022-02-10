package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.dto.SecondCourseDto;
import com.pxx.collegecourseselectionsystem.entity.SecondCourse;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Galen
 * @Date 2022/2/10 14:48
 */
@Mapper
public interface SecondCourseMapper extends BaseMapper<SecondCourse> {
    int updateBatch(List<SecondCourse> list);

    int batchInsert(@Param("list") List<SecondCourse> list);

    int insertOrUpdate(SecondCourse record);

    int insertOrUpdateSelective(SecondCourse record);

    List<SecondCourseDto> findAllSecondCourse();
}