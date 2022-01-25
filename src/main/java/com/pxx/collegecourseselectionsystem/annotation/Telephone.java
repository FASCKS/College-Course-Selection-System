package com.pxx.collegecourseselectionsystem.annotation;

import cn.hutool.core.util.ReUtil;
import cn.hutool.core.util.StrUtil;

import javax.validation.Constraint;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = Telephone.TelephoneValidator.class)
public @interface Telephone {
    String message() default "电话号码格式错误";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    class TelephoneValidator implements ConstraintValidator<Telephone, String> {
        @Override
        public void initialize(Telephone constraintAnnotation) {

        }

        @Override
        public boolean isValid(String value, ConstraintValidatorContext context) {
            //如果为空
            if (StrUtil.isBlank(value)) {
                return true;
            }
            boolean match = ReUtil.isMatch("^1(3|4|5|6|7|8|9)\\d{9}$", value);
            return match;
        }
    }
}
