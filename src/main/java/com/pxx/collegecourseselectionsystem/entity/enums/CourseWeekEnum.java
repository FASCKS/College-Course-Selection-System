package com.pxx.collegecourseselectionsystem.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.Getter;


@Getter
public enum CourseWeekEnum {
    Monday(1,"星期一"),
    Tuesday(2,"星期二"),
    Wednesday(3,"星期三"),
    Thursday(4,"星期四"),
    Friday(5,"星期五"),
    Saturday(6,"星期六"),
    Sunday(7,"星期天");


    CourseWeekEnum(int code, String describe) {
        this.code = code;
        this.describe = describe;
    }

    @EnumValue
    private final int code;
    @JsonValue
    private final String describe;
}
