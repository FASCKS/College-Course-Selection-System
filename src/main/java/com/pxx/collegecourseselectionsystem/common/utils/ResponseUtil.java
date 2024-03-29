package com.pxx.collegecourseselectionsystem.common.utils;


import cn.hutool.json.JSONUtil;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ResponseUtil {

    public static void write(HttpServletResponse response, Object o) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out=response.getWriter();

        out.println(JSONUtil.toJsonStr(o));
        out.flush();
        out.close();
    }
    public static void writeJson(HttpServletResponse response, Object o) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out=response.getWriter();
        out.println(JSONUtil.toJsonStr(o));
    }
}
