package com.pxx.collegecourseselectionsystem.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/2/14 11:10
 */
@Getter
@Setter
@ToString
public class SecondCoursePlanGroupEntityDto extends SecondCoursePlanGroupEntity {
    @TableField(exist = false)
    @ApiModelProperty("计划集合")
    private List<SecondCourseDto> secondCourseDtoList;
    @TableField(exist = false)
    @ApiModelProperty("上课时间")
    private Integer upTimeNumber;
    @TableField(exist = false)
    @ApiModelProperty("星期几")
    private Integer weekNumber;
    /**
     * 影响部门
     */
    @TableField(exist = false)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private List<SecondCoursePlanGroupAndUnitDto> secondCoursePlanGroupAndUnitDto;
    /**
     * 影响部门
     */
    @TableField(exist = false)
    @ApiModelProperty("影响部门的id集合")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private List<Integer> unitIds;
}
