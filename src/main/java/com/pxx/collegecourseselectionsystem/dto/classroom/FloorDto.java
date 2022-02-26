package com.pxx.collegecourseselectionsystem.dto.classroom;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/2/26 13:49
 */
@Getter@Setter@ToString@ApiModel("楼层")
public class FloorDto {
    /**
     * 当前楼层
     */
    @ApiModelProperty("当前楼层")
    private Integer floor;
    /**
     * 教室集合
     */
    @ApiModelProperty("教室集合")
    private List<BetweenDto> betweenDtoList;
}
