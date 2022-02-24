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

import javax.validation.constraints.NotNull;

/**
 *  @author Gpxx
 *  @Date 2022/2/24 16:24
 */
@ApiModel(value="教室管理")
@Getter
@Setter
@ToString
@TableName(value = "classroom")
public class Classroom {
    /**
     * 自增id
     */
    @TableId(value = "id", type = IdType.AUTO)
    @ApiModelProperty(value="自增id")
    private Integer id;

    /**
     * 栋
     */
    @NotNull
    @TableField(value = "roof")
    @ApiModelProperty(value="栋")
    private Integer roof;

    /**
     * 层数
     */
    @NotNull
    @TableField(value = "`floor`")
    @ApiModelProperty(value="层数")
    private Integer floor;

    /**
     * 间
     */
    @NotNull
    @TableField(value = "`between`")
    @ApiModelProperty(value="间")
    private Integer between;

    /**
     * 大楼类型 1 教学楼 2科技楼 3实验楼 4办公楼 11男学生宿舍 12 女学生宿舍 13男职工宿舍 14女职工宿舍 15混搭学生宿舍 16混搭职工宿舍
     */
    @NotNull
    @TableField(value = "roof_type_id")
    @ApiModelProperty(value="大楼类型 1 教学楼 2科技楼 3实验楼 4办公楼 11男学生宿舍 12 女学生宿舍 13男职工宿舍 14女职工宿舍 15混搭学生宿舍 16混搭职工宿舍")
    private Integer roofTypeId;

    /**
     * 教室类型 1 实验室 2 普通教室 11 单人间 12双人间 13三人间 14四人间 15五人间 16六人间 17七人间 18八人间
     */
    @NotNull
    @TableField(value = "between_type_id")
    @ApiModelProperty(value="教室类型 1 实验室 2 普通教室 11 单人间 12双人间 13三人间 14四人间 15五人间 16六人间 17七人间 18八人间")
    private Integer betweenTypeId;

    /**
     * 容纳人数
     */
    @NotNull
    @TableField(value = "`number`")
    @ApiModelProperty(value="容纳人数")
    private Integer number;

    public static final String COL_ID = "id";

    public static final String COL_ROOF = "roof";

    public static final String COL_FLOOR = "floor";

    public static final String COL_BETWEEN = "between";

    public static final String COL_ROOF_TYPE_ID = "roof_type_id";

    public static final String COL_BETWEEN_TYPE_ID = "between_type_id";

    public static final String COL_NUMBER = "number";
}