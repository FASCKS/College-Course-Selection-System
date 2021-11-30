package com.pxx.collegecourseselectionsystem.config.authorize;

import com.pxx.collegecourseselectionsystem.common.utils.R;
import com.pxx.collegecourseselectionsystem.common.utils.ResponseUtil;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@Component
public class SimpleAccessDeniedHandler implements AccessDeniedHandler {
    /**
     * Handles an access denied failure.
     *
     * @param request               that resulted in an <code>AccessDeniedException</code>
     * @param response              so that the user agent can be advised of the failure
     * @param accessDeniedException that caused the invocation
     * @throws IOException      in the event of an IOException
     * @throws ServletException in the event of a ServletException
     */
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        ResponseUtil.write(response, R.error(403,"Access is denied"));
    }
}
