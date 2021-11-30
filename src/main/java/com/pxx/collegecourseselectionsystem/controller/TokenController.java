package com.pxx.collegecourseselectionsystem.controller;

import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.config.authorize.TokenManager;
import io.jsonwebtoken.ExpiredJwtException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/sys/token")
@RestController
@Slf4j
public class TokenController {
    @Autowired
    TokenManager authorizationService;

    @Autowired
    RedisUtil cache;
    /**
     * 用 refreshToken 来刷新 accessToken
     * @param refreshToken refreshToken
     * @return
     */
    @PreAuthorize("hasAnyRole('ROLE_Administrator')")
    @GetMapping("/accessToken/refresh")
    public R accessTokenRefresh(@RequestParam("refreshToken") String refreshToken){
        //刷新accessToken:生成新的accessToken
        String account ="";
        try {
            account= authorizationService.getUserFromToken(refreshToken);
        }catch (ExpiredJwtException e){
                return R.error(1,"refresh_token expired");
        }

        //创建新的accessToken
        String accessToken = authorizationService.createAccessIdToken(account);

        //下面判断是否刷新 refreshToken，如果refreshToken 快过期了 需要重新生成一个替换掉
        long minTimeOfRefreshToken = 2*authorizationService.accessTokenExpirationTime;//refreshToken 有效时长是应该为accessToken有效时长的2倍
        Long refreshTokenStartTime = cache.get("id_refreshTokenStartTime"+account);//refreshToken创建的起始时间点
        //(refreshToken上次创建的时间点 + refreshToken的有效时长 - 当前时间点) 表示refreshToken还剩余的有效时长，如果小于2倍accessToken时长 ，则刷新 refreshToken
        if(refreshTokenStartTime == null || (refreshTokenStartTime + authorizationService.refreshTokenExpirationTime*1000) - System.currentTimeMillis() <= minTimeOfRefreshToken*1000){
            //刷新refreshToken
            refreshToken = authorizationService.createRefreshIdToken(account);
            cache.set("id_refreshTokenStartTime"+account,System.currentTimeMillis(),(int)authorizationService.refreshTokenExpirationTime);
        }

        //response
        return R.ok().put("accessToken",accessToken).put("refreshToken",refreshToken);
    }
}
