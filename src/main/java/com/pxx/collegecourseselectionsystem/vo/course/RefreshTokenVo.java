package com.pxx.collegecourseselectionsystem.vo.course;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotEmpty;

@Getter
@Setter
@ToString
public class RefreshTokenVo {
    @NotEmpty(message = "refreshToken 不能为空")
    private String refreshToken;
}
