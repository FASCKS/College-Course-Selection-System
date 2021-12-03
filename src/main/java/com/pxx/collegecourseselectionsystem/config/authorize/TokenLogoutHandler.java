package com.pxx.collegecourseselectionsystem.config.authorize;

import cn.hutool.core.date.DateUtil;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.ResponseUtil;
import com.pxx.collegecourseselectionsystem.entity.SysLogEntity;
import com.pxx.collegecourseselectionsystem.service.SysLogService;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@Slf4j
@Component
public class TokenLogoutHandler implements LogoutHandler {
    @Autowired
    private TokenManager tokenManager;
    @Autowired
    private RedisTemplate<String,Object> redisTemplate;
    @Autowired
    private SysLogService sysLogService;

    public TokenLogoutHandler(TokenManager tokenManager, RedisTemplate redisTemplate) {
        this.tokenManager = tokenManager;
        this.redisTemplate = redisTemplate;
    }

    @SneakyThrows
    @Override
    public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        String token = request.getHeader("access_token");
        if (token != null) {
            tokenManager.removeToken(token);
            //清空当前用户缓存中的权限数据
            String username = tokenManager.getUserFromToken(token);
            redisTemplate.delete(username);
            log.info("用户  {}  于  {}  注销成功",username, DateUtil.date());
            SysLogEntity sysLogEntity=new SysLogEntity();
            sysLogEntity.setUsername(username);
            sysLogEntity.setOperation("退出平台");
            sysLogEntity.setTime(System.currentTimeMillis());
            sysLogService.save(sysLogEntity);
        }


        ResponseUtil.write(response, R.ok());


    }
}