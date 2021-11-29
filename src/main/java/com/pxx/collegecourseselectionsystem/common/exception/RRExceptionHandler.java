/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 * <p>
 * https://www.renren.io
 * <p>
 * 版权所有，侵权必究！
 */

package com.pxx.collegecourseselectionsystem.common.exception;

import cn.hutool.core.exceptions.ValidateException;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import com.pxx.collegecourseselectionsystem.common.utils.R;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.validation.BindException;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.validation.ConstraintViolationException;
import java.io.IOException;
import java.util.List;

/**
 * 异常处理器
 *
 * @author Mark sunlightcs@gmail.com
 */
@RestControllerAdvice
public class RRExceptionHandler {
    private final Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * 处理自定义异常
     */
    @ExceptionHandler(RRException.class)
    public R handleRRException(RRException e) {
        R r = new R();
        r.put("code", e.getCode());
        r.put("msg", e.getMessage());

        return r;
    }



    /**
     * 验证异常
     *
     * @param e
     * @return
     */
    @ExceptionHandler(ValidateException.class)
    public R handValidateException(ValidateException e) {
        logger.error(e.getMessage(), e);
        String message = e.getMessage();
        return R.error(message);
    }


    /**
     * Http 消息不可读异常
     */
    @ExceptionHandler(value = {
            HttpMessageNotReadableException.class,
            InvalidFormatException.class,
            JsonParseException.class
    })
    public R handHttpMessageNotReadableException(HttpMessageNotReadableException e) {
        logger.error(e.getMessage(), e);
        Throwable cause = e.getCause();
            /*
            无效格式异常
             */
        if (cause instanceof InvalidFormatException) {
            InvalidFormatException exception = (InvalidFormatException) cause;
            List<JsonMappingException.Reference> path = exception.getPath();
            StringBuilder sb = new StringBuilder();
            for (JsonMappingException.Reference reference : path) {
                sb.append(reference.getFieldName()).append(" : ")
                        .append("需要的类型是")
                        .append(exception.getTargetType().getSimpleName());
                sb.append(",");
            }
            return R.error(sb.substring(0, sb.length() - 1) + ".");
        }
            /*
            Json 解析异常
            */
        if (cause instanceof JsonParseException) {
            JsonParseException exception = (JsonParseException) cause;
            StringBuilder sb = new StringBuilder();
            try {
                JsonParser processor = exception.getProcessor();
                String currentName = processor.getCurrentName();
                sb.append(currentName).append(" : ").append("格式错误,");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
            return R.error(sb.substring(0, sb.length() - 1) + " .");
        }
        return R.error();
    }

    /**
     * 缺少 Servlet 请求参数异常
     */
    @ExceptionHandler(MissingServletRequestParameterException.class)
    public R handMissingServletRequestParameterException(MissingServletRequestParameterException exception) {
        logger.error(exception.getMessage(), exception);
        StringBuilder sb = new StringBuilder();
        sb.append("所需的 ");
        sb.append(exception.getParameterType());
        sb.append(" 参数 ");
        sb.append(exception.getParameterName());
        sb.append(" 不存在");
        return R.error(sb.toString());
    }

    /**
     * 方法参数类型不匹配异常
     */
    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public R handMethodArgumentTypeMismatchException(MethodArgumentTypeMismatchException exception) {
        logger.error(exception.getMessage(), exception);
        StringBuilder sb = new StringBuilder();
        sb.append(exception.getName());
        sb.append(" 需要的是 ");
        sb.append(exception.getRequiredType().getSimpleName());
        return R.error(sb.toString());
    }

    /**
     * 方法参数无效异常
     *
     * @param exception
     * @return
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public R handMethodArgumentNotValidException(MethodArgumentNotValidException exception) {
        logger.error(exception.getMessage(), exception);
        List<ObjectError> allErrors = exception.getBindingResult().getAllErrors();
        StringBuilder sb = new StringBuilder();
        allErrors.forEach(objectError -> {
            String[] codes = objectError.getCodes();
            if (codes != null) {
                String code = codes[0];
                String field = code.substring(code.lastIndexOf(".") + 1);
                sb.append(field);
                sb.append(" : ");
            }
            sb.append(objectError.getDefaultMessage());
            sb.append(" , ");
        });
//        String message = allErrors.stream().map(DefaultMessageSourceResolvable::getDefaultMessage).collect(Collectors.joining(";"));
        return R.error(sb.substring(0, sb.length() - 3));
    }

    /**
     * 违反约束异常
     */
    @ExceptionHandler(ConstraintViolationException.class)
    public R handConstraintViolationException(ConstraintViolationException exception) {
        logger.error(exception.getMessage(), exception);
        StringBuilder sb = new StringBuilder();
        String localizedMessage = exception.getLocalizedMessage();
        String[] split = localizedMessage.split(",");
        for (int i = 0; i < split.length; i++) {
            sb.append(split[i].substring(split[i].indexOf(".") + 1));
            sb.append(",");
        }
        sb.delete(sb.length() - 1, sb.length());

        return R.error(sb.toString());
    }

    /**
     * @param e 参数绑定异常
     * @return
     */
    @ExceptionHandler(BindException.class)
    public R handleRRException(BindException e) {
        logger.error(e.getMessage(), e);
        List<ObjectError> allErrors = e.getAllErrors();
        StringBuilder sb = new StringBuilder();
        allErrors.forEach(allError -> {
            String[] codes = allError.getCodes();
            if (codes != null) {
                String code = codes[0];
                String field = code.substring(code.lastIndexOf(".") + 1);
                sb.append(field);
                sb.append(" : ");
            }
            sb.append(allError.getDefaultMessage());
            sb.append(" , ");
        });

        return R.error(sb.substring(0, sb.length() - 3));
    }


    @ExceptionHandler(NoHandlerFoundException.class)
    public R handlerNoFoundException(Exception e) {
        logger.error(e.getMessage(), e);
        return R.error(404, "路径不存在，请检查路径是否正确");
    }

    @ExceptionHandler(DuplicateKeyException.class)
    public R handleDuplicateKeyException(DuplicateKeyException e) {
        logger.error(e.getMessage(), e);
        return R.error("数据库中已存在该记录");
    }

    @ExceptionHandler(AccessDeniedException.class)
    public R handleAccessDeniedException(AccessDeniedException e) {
        logger.error(e.getMessage(), e);
        return R.error(403,"没有权限，请联系管理员授权");
    }

    @ExceptionHandler(Exception.class)
    public R handleException(Exception e) {
        logger.error(e.getMessage(), e);
        return R.error();
    }
}
