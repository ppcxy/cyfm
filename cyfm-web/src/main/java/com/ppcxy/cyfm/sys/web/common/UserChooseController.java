package com.ppcxy.cyfm.sys.web.common;

import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.service.user.UserService;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping(value = "/common/userChoose")
public class UserChooseController {
    
    @Resource
    private UserService userService;
    
    @RequestMapping
    public String dialog(Searchable searchable, Model model) {
        
        Page<User> page = userService.findAll(searchable);
        model.addAttribute("page", page);
        
        return "sys/common/user_choose";
        
    }
    
}
