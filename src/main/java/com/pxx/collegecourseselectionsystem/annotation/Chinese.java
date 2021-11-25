package com.pxx.collegecourseselectionsystem.annotation;


import cn.hutool.core.util.ReUtil;

import javax.validation.Constraint;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = Chinese.ChineseValidator.class)
public @interface Chinese {
    String message() default "必须是中文";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    class ChineseValidator implements ConstraintValidator<Chinese, String> {
        @Override
        public void initialize(Chinese constraintAnnotation) {
        }

        @Override
        public boolean isValid(String value, ConstraintValidatorContext context) {
            boolean match = ReUtil.isMatch("^[\\u4e00-\\u9fa5]*$", value);
            return match;
        }
    }
}
