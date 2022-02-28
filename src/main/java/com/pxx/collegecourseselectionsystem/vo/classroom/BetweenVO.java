package com.pxx.collegecourseselectionsystem.vo.classroom;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author Gpxx
 * @Date 2022/2/26 13:50
 */
@Getter
@Setter
@ToString
@ApiModel("教室")
public class BetweenVO {
    /**
     * 教室编号
     */
    @ApiModelProperty("教室编号")
    private Integer between;
    /**
     * 教室名称
     */
    @ApiModelProperty("教室名称")
    private String betweenName;
    /**
     * 唯一标识
     */
    @ApiModelProperty("唯一标识")
    private String uuid;
    /**
     * 容纳人数
     */
    @ApiModelProperty("容纳人数")
    private Integer quantity;
}
