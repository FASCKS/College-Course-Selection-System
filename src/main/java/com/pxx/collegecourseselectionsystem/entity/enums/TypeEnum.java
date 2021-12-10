package com.pxx.collegecourseselectionsystem.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public enum TypeEnum {
    STUDENT(1,"学生"),
    TEACHER(2,"老师"),
    DIRECTOR(3,"主任"),
    ADMINISTRATOR(4,"管理员");

    TypeEnum(int code, String describe) {
        this.code = code;
        this.describe = describe;
    }

    @EnumValue
    private final int code;
    @JsonValue
    private final String describe;
}
