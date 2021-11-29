package com.pxx.collegecourseselectionsystem.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PathController {


    @GetMapping("/login")
    public String login(){
        return "index";
    }



    @ResponseBody
    @PreAuthorize("hasAnyAuthority('sys:imdex:main')")
    @GetMapping("/test")
    public void test1() {
        System.out.println("1111111111111");
    }
    @PreAuthorize("hasAnyAuthority('sys:imdex:*')")
    @GetMapping("/test2")
    public @ResponseBody void test2() {
        System.out.println("2222222222222");
    }
    @PreAuthorize("hasAnyAuthority('sys:imdex:111111')")
    @GetMapping("/test3")
    public @ResponseBody void test3() {
        System.out.println("3333333");
    }
}
