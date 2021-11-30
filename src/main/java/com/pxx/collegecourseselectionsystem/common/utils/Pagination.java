package com.pxx.collegecourseselectionsystem.common.utils;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;

@Getter@Setter@ToString
public class Pagination {
    @NotNull
    @Positive(message = "每页显示不能小于1")
    private Integer limit;
    @NotNull
    @Positive(message ="当前页数不能小于1")
    private Integer page;


}
