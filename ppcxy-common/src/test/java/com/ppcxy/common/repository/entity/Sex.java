package com.ppcxy.common.repository.entity;

/**
 * <p>性别</p>
 */
public enum Sex {

    male("男"), female("女");
    private final String info;

    private Sex(String info) {
        this.info = info;
    }

    public String getInfo() {
        return info;
    }
}
