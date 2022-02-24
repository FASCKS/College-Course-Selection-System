package com.pxx.collegecourseselectionsystem.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotEmpty;
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

    /**
     * 影响部门
     */
    @NotEmpty
    @TableField(exist = false)
    @ApiModelProperty("影响部门的id集合")
    private List<Integer> unitIds;
}
