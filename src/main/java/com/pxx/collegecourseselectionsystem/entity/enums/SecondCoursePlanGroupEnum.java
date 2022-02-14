package com.pxx.collegecourseselectionsystem.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.Getter;
import lombok.ToString;

/**
 * @author Gpxx
 * @Date 2022/2/14 10:37
 */
@Getter
@ToString
public enum SecondCoursePlanGroupEnum {
    NOT_STARTED(0,"未开始"),
    STARTED(1,"进行中"),
    END(2,"已结束"),
    UP(9,"上学期"),
    DOWN(10,"下学期");

    SecondCoursePlanGroupEnum(int code, String descp) {
        this.code = code;
        this.descp = descp;
    }

    @EnumValue
    private final int code;
    @JsonValue
    private final String descp;
}
