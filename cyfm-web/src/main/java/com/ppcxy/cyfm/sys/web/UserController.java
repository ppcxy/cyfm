/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 * <p/>
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.ppcxy.cyfm.sys.web;

import com.google.common.collect.Maps;
import com.ppcxy.common.Constants;
import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.sys.entity.Role;
import com.ppcxy.cyfm.sys.entity.User;
import com.ppcxy.cyfm.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/account/user")
public class UserController extends BaseCRUDController<User, Long> {

    private static Map<String, String> allStatus = Maps.newHashMap();

    static {
        allStatus.put("enabled", "有效");
        allStatus.put("disabled", "无效");
    }

    @Autowired
    private UserService userService;

    public UserController() {
        setResourceIdentity("user");
        setModelName("user");
    }

    @Override
    protected void preResponse(Model model) {
        super.preResponse(model);
        model.addAttribute("allStatus", allStatus);
        model.addAttribute("allRoles", userService.getAllRole());
    }


    // 特别设定多个ReuireRoles之间为Or关系，而不是默认的And.
    //@RequiresRoles(value = {"Admin", "User"}, logical = Logical.OR)

    @Override
    @RequestMapping(value = "update/disabled", method = RequestMethod.POST)
    public String update(
            Model model, @Valid @ModelAttribute("entity") User entity, BindingResult result,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {

        //disabled
        return null;
    }

    /**
     * 演示自行绑定表单中的checkBox roleList到对象中.
     */
    @RequestMapping(value = "update/{id}", method = RequestMethod.POST)
    public String update(Model model, @Valid @ModelAttribute("entity") User user, BindingResult result,
                         @RequestParam(value = "roleList", required = false, defaultValue = "") List<Long> checkedRoleList, RedirectAttributes redirectAttributes) {

        user.getRoleList().clear();
        for (Long roleId : checkedRoleList) {
            Role role = new Role(roleId);
            user.getRoleList().add(role);
        }

        return super.update(model, user, result, null, redirectAttributes);
    }

    @RequestMapping(value = "checkLoginName")
    @ResponseBody
    public String checkLoginName(@RequestParam("oldLoginName") String oldLoginName,
                                 @RequestParam("loginName") String loginName) {
        if (loginName.equals(oldLoginName)) {
            return "true";
        } else if (userService.findByLoginName(loginName) == null) {
            return "true";
        }

        return "false";
    }

    /**
     * 不自动绑定对象中的roleList属性，另行处理。
     */
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setDisallowedFields("roleList");
    }
}
