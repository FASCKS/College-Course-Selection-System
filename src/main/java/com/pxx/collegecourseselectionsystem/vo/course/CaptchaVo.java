package com.pxx.collegecourseselectionsystem.vo.course;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotEmpty;
@ApiModel("验证码VO类")
@Getter
@Setter
@ToString
public class CaptchaVo {
    @NotEmpty
    @ApiModelProperty(value = "验证码唯一标识")
    private String captchaUuid;
}
