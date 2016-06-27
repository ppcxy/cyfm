package com.ppcxy.cyfm.sys.web;

import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.web.bind.annotation.PageableDefaults;
import com.ppcxy.cyfm.sys.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by weep on 2016-5-16.
 */
@Controller
@RequestMapping(value = "/team")
public class TeamController {
    @Autowired
    private TeamService teamService;

    @RequestMapping(value = {"list",""})
    @PageableDefaults(sort = "id=desc")
    public String list(Searchable searchable,Model model) {
        model.addAttribute("page", teamService.test(searchable));
        return "team/list";
    }

}
