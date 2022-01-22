package com.pxx.collegecourseselectionsystem.common.utils;

import org.springframework.util.StreamUtils;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * 解决request请求流中的数据二次或多次使用问题
 * 继承HttpServletRequestWrapper，将请求体中的流copy一份，覆写getInputStream()和getReader()方法供外部使用。
 * 每次调用覆写后的getInputStream()方法都是从复制出来的二进制数组中进行获取，这个二进制数组在对象存在期间一直存在，这样就实现了流的重复读取。

 */
public class BodyReaderHttpServletRequestWrapper extends HttpServletRequestWrapper {
    //保存流
    private byte[] requestBody = null;

    public BodyReaderHttpServletRequestWrapper(HttpServletRequest request) throws IOException {
        super(request);
        requestBody = StreamUtils.copyToByteArray(request.getInputStream());
    }

    @Override
    public ServletInputStream getInputStream() throws IOException {

        final ByteArrayInputStream bais = new ByteArrayInputStream(requestBody);

        return new ServletInputStream() {

            @Override
            public int read() throws IOException {
                return bais.read();
            }

            @Override
            public boolean isFinished() {
                return false;
            }

            @Override
            public boolean isReady() {
                return false;
            }

            @Override
            public void setReadListener(ReadListener readListener) {

            }
        };
    }

    @Override
    public BufferedReader getReader() throws IOException{
        return new BufferedReader(new InputStreamReader(getInputStream()));
    }
}

