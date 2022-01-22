package com.pxx.collegecourseselectionsystem.common.exception;

import org.springframework.security.core.AuthenticationException;

/**
 * 自定义得AuthenticationException异常
 */
public class MyAuthenticationException extends AuthenticationException {
    public MyAuthenticationException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public MyAuthenticationException(String msg) {
        super(msg);
    }
}
