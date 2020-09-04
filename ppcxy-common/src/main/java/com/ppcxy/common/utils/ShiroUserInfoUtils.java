package com.ppcxy.common.utils;

import org.apache.shiro.SecurityUtils;

/**
 * Created by weep on 2016-6-27.
 */
public class ShiroUserInfoUtils {
    
    public static ShiroUser getShiroUser() {
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
            return ((ShiroUser) SecurityUtils.getSubject().getPrincipal());
            
        }
        return null;
    }
    
    public static String getUsername() {
        ShiroUser shiroUser = getShiroUser();
        return shiroUser == null ? null : shiroUser.username;
    }
    
    public static Long getUserId() {
        ShiroUser shiroUser = getShiroUser();
        return shiroUser == null ? 0L : shiroUser.id;
    }
    
    public static Long getTeamId() {
        ShiroUser shiroUser = getShiroUser();
        return shiroUser == null ? 0L : shiroUser.teamId;
    }
}
