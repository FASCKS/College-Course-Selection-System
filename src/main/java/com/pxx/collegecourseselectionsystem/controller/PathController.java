package com.pxx.collegecourseselectionsystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PathController {

@GetMapping("/test")
    public void test1(){
    System.out.println("1111111111111");
    }
}
