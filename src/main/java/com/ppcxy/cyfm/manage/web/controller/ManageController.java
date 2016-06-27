package com.ppcxy.cyfm.manage.web.controller;

import com.ppcxy.cyfm.sys.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by weep on 2016-5-16.
 */
@Controller
@RequestMapping(value = "/manage")
public class ManageController {
    @Autowired
    private TeamService teamService;

    @RequestMapping
    public String main() {
        return "manage/main";
    }

    @RequestMapping(value = "left")
    public String left() {
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
