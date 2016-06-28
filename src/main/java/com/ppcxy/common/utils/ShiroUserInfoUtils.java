package com.ppcxy.common.utils;

import org.apache.shiro.SecurityUtils;
import org.springside.modules.utils.Reflections;

/**
 * Created by weep on 2016-6-27.
 */
public class ShiroUserInfoUtils {
    public static String getLoginName() {
        if (SecurityUtils.getSubject().getPrincipal() != null) {
            return Reflections.getFieldValue(SecurityUtils.getSubject().getPrincipal(), "loginName").toString();

        }
        return null;
    }
}
