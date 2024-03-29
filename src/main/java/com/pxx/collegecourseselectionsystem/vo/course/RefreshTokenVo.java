package com.pxx.collegecourseselectionsystem.vo.course;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotEmpty;

@Getter
@Setter
@ToString
@ApiModel(value = "刷新tokenVo")
public class RefreshTokenVo {
    @ApiModelProperty(value = "刷新refreshToken")
    @NotEmpty(message = "refreshToken 不能为空")
    private String refreshToken;
}
