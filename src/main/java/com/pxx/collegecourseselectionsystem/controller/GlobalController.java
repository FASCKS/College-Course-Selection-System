package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.CircleCaptcha;
import cn.hutool.core.convert.Convert;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.config.authorize.TokenManager;
import com.pxx.collegecourseselectionsystem.util.Global;
import com.pxx.collegecourseselectionsystem.vo.course.CaptchaVo;
import com.pxx.collegecourseselectionsystem.vo.course.RefreshTokenVo;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.MalformedJwtException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RequestMapping("/sys/global")
@RestController
@Slf4j
@Api(tags = "公共类")
public class GlobalController {
    @Autowired
    TokenManager authorizationService;

    @Autowired
    RedisUtil cache;


    @GetMapping("/test")
    public R test() {
        return R.error(100, "Full authentication is required to access this resource");
    }

    /**
     * 用 refreshToken 来刷新 accessToken
     * @param refreshToken refreshToken
     * @return
     */
    @ApiOperation("token刷新")
    @PostMapping("/accessToken/refresh")
    public R accessTokenRefresh(@RequestBody @Validated RefreshTokenVo refreshTokenVo) {
        String refreshToken = refreshTokenVo.getRefreshToken();
        //刷新accessToken:生成新的accessToken
        String username = "";
        try {
            username = authorizationService.getUserFromToken(refreshToken);
        } catch (ExpiredJwtException e) {
            return R.error(Global.REFRESH_TOKEN_EXPIRED_CODE, "Full authentication is required to access this resource");
        } catch (MalformedJwtException malformedJwtException) {
            return R.error(Global.REFRESH_TOKEN_WRONG_FORMAT_CODE, "refreshToken wrong format");
        }
        String refresh_token = (String) cache.hget(username, "refresh_token");

        if (!refresh_token.equals(refreshToken)) {
            return R.error(1, "refresh_token expired");
        }
        //创建新的accessToken
        String accessToken = authorizationService.createAccessIdToken(username);
        cache.hset(username, "access_token", accessToken);


        //下面判断是否刷新 refreshToken，如果refreshToken 快过期了 需要重新生成一个替换掉
        long minTimeOfRefreshToken = 2 * authorizationService.accessTokenExpirationTime;//refreshToken 有效时长是应该为accessToken有效时长的2倍
        //refreshToken创建的起始时间点
        Long refreshTokenStartTime = Convert.toLong(cache.hget(username, "start_time"));
        //(refreshToken上次创建的时间点 + refreshToken的有效时长 - 当前时间点) 表示refreshToken还剩余的有效时长，如果小于2倍accessToken时长 ，则刷新 refreshToken
        if (refreshTokenStartTime == null || (refreshTokenStartTime + authorizationService.refreshTokenExpirationTime * 1000) - System.currentTimeMillis() <= minTimeOfRefreshToken * 1000) {
            //刷新refreshToken
            refreshToken = authorizationService.createRefreshIdToken(username);
            cache.hset(username, "refresh_token", refresh_token);
            cache.hset(username, "start_time", System.currentTimeMillis());
        }

        //response
        return R.ok().put("access_token", accessToken).put("refresh_token", refreshToken);
    }

    /**
     * 验证码
     */
    @ApiOperation("验证码")
    @PostMapping("/captcha")
    public void captcha(HttpServletResponse httpServletResponse,@RequestBody CaptchaVo captchaVo) throws IOException {
        CircleCaptcha circleCaptcha = CaptchaUtil.createCircleCaptcha(200, 100, 5, 20);
        String code = circleCaptcha.getCode();
        String captchaUuid = captchaVo.getCaptchaUuid();
        boolean saveCaptcha = cache.set(captchaUuid, code,30L);
        if (saveCaptcha){
            ServletOutputStream outputStream = httpServletResponse.getOutputStream();
            outputStream.write(circleCaptcha.getImageBytes());
        }
    }
}
