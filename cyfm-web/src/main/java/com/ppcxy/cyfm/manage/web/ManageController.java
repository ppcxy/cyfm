package com.ppcxy.cyfm.manage.web;

import com.ppcxy.common.web.bind.annotation.CurrentUser;
import com.ppcxy.cyfm.sys.entity.resource.dto.Menu;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.service.resource.ResourceService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springside.modules.web.Servlets;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by weep on 2016-5-16.
 */
@Controller
@RequestMapping(value = "/manage")
public class ManageController {
    @Resource
    private ResourceService resourceService;

    //TODO 默认前端首页实现.
    //@RequestMapping
    //public String index(HttpServletRequest request, HttpServletResponse response) {
    //    Servlets.changeCookie("skin", "default", request, response);
    //    return "index";
    //}
    
    
    @RequestMapping
    public String main(HttpServletRequest request, HttpServletResponse response) {
        Servlets.changeCookie("skin", "content", request, response);
        return "manage/main";
    }
    
    @RequestMapping(value = "/left")
    public String left(@CurrentUser User user, Model model) {

        List<Menu> menus = resourceService.findMenus(user);
        model.addAttribute("menus", menus);
        return "manage/left";
    }
    
    @RequestMapping(value = "/top")
    public String top() {
        return "manage/top";
    }
    
    @RequestMapping(value = {"/place"})
    public String place() {
        return "manage/place";
    }
    
    @RequestMapping(value = "/index")
    public String index() {
        return "manage/index";
    }

}
