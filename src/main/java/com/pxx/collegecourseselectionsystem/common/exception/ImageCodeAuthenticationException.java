package com.pxx.collegecourseselectionsystem.common.exception;

import org.springframework.security.core.AuthenticationException;


public class ImageCodeAuthenticationException extends AuthenticationException {
    public ImageCodeAuthenticationException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public ImageCodeAuthenticationException(String msg) {
        super(msg);
    }
}
