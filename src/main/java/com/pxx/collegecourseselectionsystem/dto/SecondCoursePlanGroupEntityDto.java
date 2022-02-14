package com.pxx.collegecourseselectionsystem.dto;

import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/2/14 11:10
 */@Getter@Setter@ToString
public class SecondCoursePlanGroupEntityDto extends SecondCoursePlanGroupEntity {
     @ApiModelProperty("计划集合")
    private List<SecondCourseDto> secondCourseDtoList;
}
