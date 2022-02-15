package com.pxx.collegecourseselectionsystem.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupAndUnit;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author Gpxx
 * @Date 2022/2/15 15:17
 */
@Getter
@Setter
@ToString
public class SecondCoursePlanGroupAndUnitDto extends SecondCoursePlanGroupAndUnit {
    /**
     * 部门id
     */
    @TableField(exist = false)
    @ApiModelProperty("部门名称")
    private String unitName;
}
