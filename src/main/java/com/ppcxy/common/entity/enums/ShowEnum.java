package com.ppcxy.common.entity.enums;

/**
 * <p>Date: 13-2-7 上午11:44
 * <p>Version: 1.0
 */
public enum ShowEnum {
    TRUE(Boolean.TRUE, "显示"), FALSE(Boolean.FALSE, "不显示");

    private final Boolean value;
    private final String info;

    private ShowEnum(Boolean value, String info) {
        this.value = value;
        this.info = info;
    }

    public String getInfo() {
        return info;
    }

    public Boolean getValue() {
        return value;
    }
}
