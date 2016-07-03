package com.ppcxy.cyfm.manage.web.controller;

import com.ppcxy.common.web.bind.annotation.CurrentUser;
import com.ppcxy.cyfm.sys.entity.User;
import com.ppcxy.cyfm.sys.entity.dto.Menu;
import com.ppcxy.cyfm.sys.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by weep on 2016-5-16.
 */
@Controller
@RequestMapping(value = "/manage")
public class ManageController {
    @Autowired
    private ResourceService resourceService;

    @RequestMapping
    public String main() {
        return "manage/main";
    }

    @RequestMapping(value = "left")
    public String left(@CurrentUser User user,Model model) {

        List<Menu> menus = resourceService.findMenus(user);
        model.addAttribute("menus", menus);
        return "manage/left";
    }

    @RequestMapping(value = "top")
    public String top() {
        return "manage/top";
    }

    @RequestMapping(value = "index")
    public String index() {
        return "manage/index";
    }

}