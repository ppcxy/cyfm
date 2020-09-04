package com.ppcxy.cyfm.desktop.web;

import com.ppcxy.common.exception.BaseException;
import com.ppcxy.common.web.bind.annotation.CurrentUser;
import com.ppcxy.cyfm.sys.entity.resource.dto.Menu;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.service.UserSwitchService;
import com.ppcxy.cyfm.sys.service.resource.ResourceService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springside.modules.mapper.JsonMapper;
import org.springside.modules.web.Servlets;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

/**
 * Created by weep on 2016-5-16.
 */
@Controller
@RequestMapping(value = "/desktop")
public class DesktopController {
    @Autowired
    private UserSwitchService userSwitchService;
    @Autowired
    private ResourceService resourceService;
    
    //TODO 默认前端首页实现.
    //@RequestMapping
    //public String index(HttpServletRequest request, HttpServletResponse response) {
    //    Servlets.changeCookie("skin", "default", request, response);
    //    return "index";
    //}
    @RequestMapping
    public String main(@CurrentUser User user) {
        
        Long rootMenuId = user.getTeam().getRootMenuId();
        if (rootMenuId == null || rootMenuId.intValue() == 0) {
            rootMenuId = 1L;
        }
        return String.format("redirect:/desktop/%d/", rootMenuId);
    }
    
    @RequestMapping(value = "{rootId}")
    public String main(@CurrentUser User user, @PathVariable(value = "rootId") Long rootId, HttpServletRequest request, Model model) {
        
        com.ppcxy.cyfm.sys.entity.resource.Resource rootResource = resourceService.findOne(rootId);
        //访问的菜单不存在，则跳转到首页
        if (rootResource == null) {
            Long rootMenuId = user.getTeam().getRootMenuId();
            if (rootMenuId == null) {
                throw new BaseException("访问地址不存在。");
            }
            return String.format("redirect:/desktop/%d/", rootMenuId);
        }
        
        if (StringUtils.isNotBlank(rootResource.getIdentity())) {
            Subject subject = SecurityUtils.getSubject();
            if (!subject.isPermitted(rootResource.getIdentity() + ":view") && !subject.hasRole("Admin")) {
                if (!Objects.equals(rootResource.getId(), user.getTeam().getRootMenuId())) {
                    return String.format("redirect:/desktop/%d/", user.getTeam().getRootMenuId());
                }
                subject.logout();
                throw new BaseException("无系统访问权限，请联系管理员。");
            }
        }
        
        String searchText = request.getParameter("searchText");
        List<Menu> menus = resourceService.findMenus(user, rootId);
        
        JsonMapper jsonMapper = new JsonMapper();
        menus = jsonMapper.fromJson(jsonMapper.toJson(menus), jsonMapper.contructCollectionType(ArrayList.class, Menu.class));
        if (StringUtils.isNotBlank(searchText) && menus != null) {
            menufilter(menus, searchText);
        }
        
        model.addAttribute("rootId", rootId);
        model.addAttribute("roots", resourceService.findRoots(user));
        model.addAttribute("root", rootResource);
        model.addAttribute("menus", menus);
        model.addAttribute("searchText", searchText);
        model.addAttribute("existPreUser", userSwitchService.existPreUser());
        if (Servlets.getCookie("skin", request) != null && "mobile".equals(Servlets.getCookie("skin", request).getValue())) {
            return "desktop/mobile/main";
        }
        
        return "desktop/main";
    }
    
    public int menufilter(List<Menu> menus, String searchText) {
        
        Iterator<Menu> iterator = menus.iterator();
        while (iterator.hasNext()) {
            
            Menu m = iterator.next();
            
            if (m.isHasChildren()) {
                int cc = menufilter(m.getChildren(), searchText);
                if (cc == 0) {
                    iterator.remove();
                }
            } else {
                if (m.getName() != null && !m.getName().contains(searchText)) {
                    iterator.remove();
                }
            }
            
        }
        return menus.size();
    }
    
    @RequestMapping(value = "/index")
    public String index() {
        return "desktop/index";
    }
    
}
