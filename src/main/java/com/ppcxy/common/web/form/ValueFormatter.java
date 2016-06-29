package com.ppcxy.common.web.form;

import org.springframework.util.ObjectUtils;
import org.springframework.web.util.HtmlUtils;

/**
 * <p>Date: 13-3-28 下午5:14
 * <p>Version: 1.0
 */
public class ValueFormatter {
    public static String getDisplayString(Object value, boolean htmlEscape) {
        String displayValue = ObjectUtils.getDisplayString(value);
        return (htmlEscape ? HtmlUtils.htmlEscape(displayValue) : displayValue);
    }
}
