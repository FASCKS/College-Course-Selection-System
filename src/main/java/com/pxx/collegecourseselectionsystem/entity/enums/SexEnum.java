package com.pxx.collegecourseselectionsystem.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.Getter;

@Getter
public enum SexEnum  {
    MAN(1,"男"),
    Female(0,"女"),
    Secrecy(2,"保密");

    SexEnum(int code, String descp) {
        this.code = code;
        this.descp = descp;
    }

    @EnumValue
    private final int code;
    @JsonValue
    private final String descp;
}
