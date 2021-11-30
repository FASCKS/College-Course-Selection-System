package com.pxx.collegecourseselectionsystem.controller;

import com.pxx.collegecourseselectionsystem.service.SysUnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Validated
@RestController
@RequestMapping("/sys/unit")
public class SysUnitController {
    @Autowired
    private SysUnitService sysUnitService;



}
