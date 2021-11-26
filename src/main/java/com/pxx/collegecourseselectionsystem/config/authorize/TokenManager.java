package com.pxx.collegecourseselectionsystem.config.authorize;

import cn.hutool.core.date.DateUtil;
import io.jsonwebtoken.CompressionCodecs;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class TokenManager {

    @Value("${tokenExpiration}")
    private int tokenExpiration ;
    @Value("${tokenSignKey}")
    private String tokenSignKey;

    public String createToken(String username) {
        String token = Jwts.builder().setSubject(username)
                .setExpiration(DateUtil.offsetDay(DateUtil.date(),tokenExpiration))
                .signWith(SignatureAlgorithm.HS256, tokenSignKey).compressWith(CompressionCodecs.GZIP).compact();
        return token;
    }

    public String getUserFromToken(String token) {
        String user = Jwts.parser().setSigningKey(tokenSignKey).parseClaimsJws(token).getBody().getSubject();
        return user;
    }
    public void removeToken(String token){

    }

}
