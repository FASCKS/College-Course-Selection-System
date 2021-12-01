package com.pxx.collegecourseselectionsystem.common.utils;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
@ApiModel("分页类")
@Getter@Setter@ToString
public class Pagination {
    @ApiModelProperty(name = "limit",value = "每页显示数量",required = true)
    @NotNull
    @Positive(message = "每页显示不能小于1")
    private Integer limit;
    @ApiModelProperty(name = "page",value = "当前页",required = true)
    @NotNull
    @Positive(message ="当前页数不能小于1")
    private Integer page;


}
