/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 * <p/>
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.ppcxy.cyfm.showcase.functional.ajax;

import com.ppcxy.cyfm.showcase.functional.BaseSeleniumTestCase;
import org.junit.Test;
import org.openqa.selenium.By;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * 测试Ajax Mashup.
 *
 * @calvin
 */
public class AjaxFT extends BaseSeleniumTestCase {

    @Test
    public void mashup() {
        s.open("/");
        s.click(By.linkText("Web演示"));

        loginAsAdminIfNecessary();

        s.click(By.linkText("跨域名Mashup演示"));

        s.click(By.xpath("//input[@value='获取内容']"));
        s.waitForVisible(By.id("mashupContent"));
        assertThat(s.getText(By.id("mashupContent"))).isEqualTo("你好，世界！");
    }

    private void loginAsAdminIfNecessary() {
        // 修改用户需要登录管理员权限
        if (s.getTitle().contains("登录页")) {
            s.type(By.name("username"), "user");
            s.type(By.name("password"), "user");
            s.click(By.id("submit_btn"));
        }
    }
}
