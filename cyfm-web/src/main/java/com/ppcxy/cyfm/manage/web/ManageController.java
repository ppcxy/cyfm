package com.ppcxy.cyfm.manage.web;

import com.ppcxy.common.web.bind.annotation.CurrentUser;
import com.ppcxy.cyfm.sys.entity.resource.dto.Menu;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.service.resource.ResourceService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springside.modules.web.Servlets;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
    public String main(@CurrentUser User user, @RequestParam(name = "root", defaultValue = "1") Long mobileRootId, HttpServletRequest request, Model model) {
        
        if (Servlets.getCookie("skin", request)!=null && "mobile".equals(Servlets.getCookie("skin", request).getValue())) {
            model.addAttribute("roots", resourceService.findRoots());
            model.addAttribute("root", resourceService.findOne(mobileRootId));
            model.addAttribute("menus", resourceService.findMenus(user, mobileRootId));
            return "mobile/main";
        }
        return "manage/main";
    }
    
    @RequestMapping(value = "/left/{menuRoot}")
    public String left(@CurrentUser User user, @PathVariable(value = "menuRoot") Long menuRoot, Model model) {
        
        List<Menu> menus = resourceService.findMenus(user, menuRoot);
        model.addAttribute("menus", menus);
        model.addAttribute("root", resourceService.findOne(menuRoot));
        return "manage/left";
    }
    
    @RequestMapping(value = "/top")
    public String top(Model model) {
        model.addAttribute("roots", resourceService.findRoots());
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
