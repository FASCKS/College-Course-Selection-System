package com.pxx.collegecourseselectionsystem.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.Getter;

/**
 * one、two 、three 、four 、five 、six 、seven 、eight 、nine、 ten 。
 */
@Getter
public enum CourseUpTimeEnum {
    ONE(1,"第一节"),
    TWO(2,"第一节"),
    THREE(3,"第二节"),
    FOUR(4,"第二节"),
    FIVE(5,"第三节"),
    SEX(6,"第三节"),
    SEVEN(7,"第四节"),
    EIGHT(8,"第四节"),
    ;

    CourseUpTimeEnum(int code, String describe) {
        this.code = code;
        this.describe = describe;
    }

    @EnumValue
    private final int code;
    @JsonValue
    private final String describe;

}
