package com.ppcxy.common.exception;

import com.ppcxy.common.utils.MessageUtils;
import org.springframework.util.StringUtils;

/**
 * 基础异常
 * <p>Date: 13-3-11 下午8:19
 * <p>Version: 1.0
 */
public class ServiceException extends RuntimeException {

    //所属模块
    private String module;

    /**
     * 错误码
     */
    private String code;

    /**
     * 错误码对应的参数
     */
    private Object[] args;

    /**
     * 错误消息
     */
    private String message;


    public ServiceException(String module, String code, Object[] args, String message) {
        this.module = module;
        this.code = code;
        this.args = args;
        this.message = message;
    }

    public ServiceException(String module, String code, Object[] args) {
        this(module, code, args, null);
    }

    public ServiceException(String module, String message) {
        this(module, null, null, message);
    }

    public ServiceException(String code, Object[] args) {
        this(null, code, args, null);
    }

    public ServiceException(String message) {
        this(null, null, null, message);
    }

    public ServiceException(Throwable cause) {
        super(cause);
    }

    public ServiceException(String message, Throwable cause) {
        super(message, cause);
    }

    public ServiceException() {
        super();
    }

    @Override
    public String getMessage() {
        String message = null;
        if (!StringUtils.isEmpty(code)) {
            message = MessageUtils.message(code, args);
        }
        if (message == null) {
            message = message;
        }
        return message;
    }


    public String getModule() {
        return module;
    }

    public String getCode() {
        return code;
    }

    public Object[] getArgs() {
        return args;
    }

    public String getmessage() {
        return message;
    }

    @Override
    public String toString() {
        return this.getClass() + "{" +
                "module='" + module + '\'' +
                ", message='" + getMessage() + '\'' +
                '}';
    }
}
