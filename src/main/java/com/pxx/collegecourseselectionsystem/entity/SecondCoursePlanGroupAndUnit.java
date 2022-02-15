package com.pxx.collegecourseselectionsystem.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *  @author Gpxx
 *  @Date 2022/2/15 15:14
 */
@ApiModel(value="second_course_plan_group_and_unit")
@Getter
@Setter
@ToString
@TableName(value = "second_course_plan_group_and_unit")
public class SecondCoursePlanGroupAndUnit {
    /**
     * 抢课计划分组和部门关系表
     */
    @TableId(value = "id", type = IdType.AUTO)
    @ApiModelProperty(value="抢课计划分组和部门关系表")
    private Integer id;

    /**
     * 部门id
     */
    @TableField(value = "unit_id")
    @ApiModelProperty(value="部门id")
    private Integer unitId;

    /**
     * 计划分组id
     */
    @TableField(value = "scpg_id")
    @ApiModelProperty(value="计划分组id")
    private Integer scpgId;

    public static final String COL_ID = "id";

    public static final String COL_UNIT_ID = "unit_id";

    public static final String COL_SCPG_ID = "scpg_id";
}