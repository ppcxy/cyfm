package com.ppcxy.cyfm.shop.v.web;

import com.ppcxy.cyfm.sys.service.user.UserOnlineService;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

/**
 * 登录页面
 */
@Controller
@RequestMapping("/shop/v")
public class ShopVLoginController {
    
    @Resource
    private UserOnlineService userOnlineService;
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "/shop/v/login";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
        model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
        return "/shop/v/login";
    }
    
}
