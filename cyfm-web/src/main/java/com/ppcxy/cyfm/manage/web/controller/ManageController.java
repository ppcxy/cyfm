package com.ppcxy.cyfm.manage.web.controller;

import com.ppcxy.common.web.bind.annotation.CurrentUser;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.entity.resource.dto.Menu;
import com.ppcxy.cyfm.sys.service.resource.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springside.modules.web.Servlets;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by weep on 2016-5-16.
 */
@Controller
@RequestMapping(value = "/")
public class ManageController {
    @Autowired
    private ResourceService resourceService;

    @RequestMapping(value = {"/manage", "/manage/main"})
    public String main(HttpServletResponse response) {
        Servlets.addCookie("skin", "content", response);
        return "manage/main";
    }

    @RequestMapping(value = "/manage/left")
    public String left(@CurrentUser User user, Model model) {

        List<Menu> menus = resourceService.findMenus(user);
        model.addAttribute("menus", menus);
        return "manage/left";
    }

    @RequestMapping(value = "/manage/top")
    public String top() {
        return "manage/top";
    }

    @RequestMapping(value = {"/manage/place"})
    public String place() {
        return "manage/place";
    }

    @RequestMapping(value = "/manage/index")
    public String index() {
        return "manage/index";
    }

}
