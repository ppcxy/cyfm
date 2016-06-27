package org.apache.shiro.exception;

/**
 * <p>Date: 13-3-11 下午8:29
 * <p>Version: 1.0
 */
public class UserBlockedException extends UserException {
    public UserBlockedException(String reason) {
        super("user.blocked", new Object[]{reason});
    }
}
