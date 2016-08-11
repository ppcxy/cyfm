package com.ppcxy.cyfm.sys.entity.authorize;

/**
 * Created by wufab on 2016/8/11.
 */
public enum AuthorizeType {

    Role("角色授权"), User("用户授权"), Dept("组织机构授权");

    private String info;

    AuthorizeType(String info) {
        this.info = info;
    }
}
