package com.pxx.collegecourseselectionsystem.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.Getter;

/**
 * one、two 、three 、four 、five 、six 、seven 、eight 、nine、 ten 。
 */
@Getter
public enum CourseUpTimeEnum {
    ZERO(0,""),
    ONE(1,"第一节"),
    TWO(2,"第二节"),
    THREE(3,"第三节"),
    FOUR(4,"第四节"),
    FIVE(5,"第五节"),
    SEX(6,"第六节"),
    SEVEN(7,"第七节"),
    EIGHT(8,"第八节"),
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
