package com.pxx.collegecourseselectionsystem.config;

import com.fasterxml.jackson.core.JacksonException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.util.Assert;

import java.io.IOException;

/**
 * 自定义类，增加无参构造，让其可以反序列
 */
public class UserGrantedAuthority implements GrantedAuthority {

    private static final long serialVersionUID = -2985922934585450525L;
    private String authority;

    public UserGrantedAuthority() {}

    public UserGrantedAuthority(String authority) {
        Assert.hasText(authority, "A granted authority textual representation is required");
        this.authority = authority;
    }

    @Override
    public String getAuthority() {
        return this.authority;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        } else {
            return obj instanceof UserGrantedAuthority ? this.authority.equals(((UserGrantedAuthority)obj).authority) : false;
        }
    }

    @Override
    public int hashCode() {
        return this.authority.hashCode();
    }

    @Override
    public String toString() {
        return this.authority;
    }
}
