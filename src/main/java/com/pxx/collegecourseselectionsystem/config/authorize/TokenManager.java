package com.pxx.collegecourseselectionsystem.config.authorize;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateUtil;
import io.jsonwebtoken.CompressionCodecs;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
@Slf4j
@Component
public class TokenManager {

    @Value("${accessTokenExpirationTime}")
    public long accessTokenExpirationTime ;
    @Value("${refreshTokenExpirationTime}")
    public long refreshTokenExpirationTime;
    @Value("${ExpirationTimes}")
    public long ExpirationTimes;
    @Value("${tokenSignKey}")
    private String tokenSignKey;

    public String createAccessIdToken(String userId) {
        return createToken(userId,accessTokenExpirationTime);
    }

    public String createRefreshIdToken(String userId) {
        return createToken(userId,refreshTokenExpirationTime*ExpirationTimes);
    }

    public String createToken(String username,long expirationTime) {


        String token = Jwts.builder().setSubject(username)
                .setExpiration(DateUtil.offsetMinute(DateUtil.date(), Convert.toInt(expirationTime)))
                .signWith(SignatureAlgorithm.HS256, tokenSignKey)
                .setIssuedAt(DateUtil.date())
                .compressWith(CompressionCodecs.GZIP).compact();
        return token;
    }

    public String getUserFromToken(String token) {

        String user = Jwts
                .parser()
                .setSigningKey(tokenSignKey)
                //过期后30秒内还能解析成功
                .setAllowedClockSkewSeconds(30)
                .parseClaimsJws(token)
                .getBody()
                .getSubject();
        return user;
    }
    public void removeToken(String token){

    }

}
