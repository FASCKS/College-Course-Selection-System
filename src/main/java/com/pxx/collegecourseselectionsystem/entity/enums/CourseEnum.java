package com.pxx.collegecourseselectionsystem.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.Getter;

@Getter
public enum CourseEnum {
    Public(1, "公共课"),
    Elective(2, "选修课"),
    Compulsory(3, "必修课"),
    Humanities(4, "人文素质");

    CourseEnum(int code, String describe) {
        this.code = code;
        this.describe = describe;
    }

    @EnumValue
    private final int code;
    @JsonValue
    private final String describe;

}
