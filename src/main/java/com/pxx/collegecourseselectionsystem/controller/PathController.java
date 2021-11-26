package com.pxx.collegecourseselectionsystem.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PathController {
    @PreAuthorize("hasAnyAuthority('sys:imdex:main')")
    @GetMapping("/test")
    public void test1() {
        System.out.println("1111111111111");
    }
    @PreAuthorize("hasAnyAuthority('sys:imdex:*')")
    @GetMapping("/test2")
    public void test2() {
        System.out.println("2222222222222");
    }
    @GetMapping("/test3")
    public void test3() {
        System.out.println("3333333");
    }
}
