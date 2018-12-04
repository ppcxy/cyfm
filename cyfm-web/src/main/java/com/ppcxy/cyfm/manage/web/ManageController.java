package com.ppcxy.cyfm.manage.web;

import com.ppcxy.common.web.bind.annotation.CurrentUser;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.service.resource.ResourceService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springside.modules.web.Servlets;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
    public String main() {
        return "redirect:/manage/1/";
    }
    
    @RequestMapping(value = "{rootId}")
    public String main(@CurrentUser User user, @PathVariable(value = "rootId") Long rootId, HttpServletRequest request, Model model) {
        
        model.addAttribute("rootId", rootId);
        model.addAttribute("roots", resourceService.findRoots());
        model.addAttribute("root", resourceService.findOne(rootId));
        model.addAttribute("menus", resourceService.findMenus(user, rootId));
        
        if (Servlets.getCookie("skin", request) != null && "mobile".equals(Servlets.getCookie("skin", request).getValue())) {
            return "mobile/main";
        }
        
        return "manage/main";
    }
    
    
    @RequestMapping(value = "/index")
    public String index() {
        return "manage/index";
    }
    
}
