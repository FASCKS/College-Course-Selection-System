package com.pxx.collegecourseselectionsystem.common.exception;

import org.springframework.security.core.AuthenticationException;

/**
 * token 过期和签名异常
 */
public class TokenSignatureOrExpiredJwtException extends AuthenticationException {
    public TokenSignatureOrExpiredJwtException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public TokenSignatureOrExpiredJwtException(String msg) {
        super(msg);
    }
}
