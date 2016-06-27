package com.ppcxy.common.repository.jpa.support.annotation;

import java.lang.annotation.*;

/**
 * <p>Date: 13-10-18
 * <p>Version: 1.0
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface CountQueryStr {

    String value() default "select count(x) from %s x where 1=1 ";

}
