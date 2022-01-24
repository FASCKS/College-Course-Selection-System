package com.pxx.collegecourseselectionsystem.config.authorize;

import cn.hutool.core.util.StrUtil;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.ResponseUtil;
import com.pxx.collegecourseselectionsystem.common.utils.SpringSecurityUtil;
import com.pxx.collegecourseselectionsystem.entity.SysLogEntity;
import com.pxx.collegecourseselectionsystem.service.SysLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@Component
@Slf4j
public class SimpleAccessDeniedHandler implements AccessDeniedHandler {
    @Autowired
    private SysLogService sysLogService;
    /**
     * Handles an access denied failure.
     *
     * @param request               that resulted in an <code>AccessDeniedException</code>
     * @param response              so that the user agent can be advised of the failure
     * @param accessDeniedException that caused the invocation
     * @throws IOException      in the event of an IOException
     * @throws ServletException in the event of a ServletException
     */
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        String username = SpringSecurityUtil.getUsername();
        log.info("用户 {} 非法访问--->{}",username,request.getRequestURI());
        SysLogEntity sysLogEntity = new SysLogEntity();
        sysLogEntity.setUsername(username);
        sysLogEntity.setTime(0L);
        sysLogEntity.setOperation("非法访问");
        sysLogService.save(sysLogEntity);
        ResponseUtil.write(response, R.error(403, StrUtil.format("用户 {} 没有权限, {} ,请联系管理员授权", username, accessDeniedException.getMessage())));
    }
}
