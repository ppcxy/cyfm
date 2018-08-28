package com.ppcxy.cyfm.shop.user.web;

import com.google.common.collect.Maps;
import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.shop.user.entity.UserDetail;
import com.ppcxy.cyfm.shop.user.service.UserDetailService;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
@RequestMapping("/shop/user")
public class UserDetailController extends BaseCRUDController<UserDetail, Long> {
    private static Map<String, String> allStatus = Maps.newHashMap();
    
    static {
        allStatus.put("enabled", "正常");
        allStatus.put("disabled", "封禁");
    }
    
    @Autowired
    private UserService userService;
    @Autowired
    private UserDetailService userDetailService;
    
    @Override
    protected void preResponse(Model model) {
        super.preResponse(model);
        model.addAttribute("allStatus", allStatus);
    }
    
    
    public UserDetailController() {
        setResourceIdentity("shop:user");
        setModelName("shopUser");
    }
    
    @Override
    public String update(Model model, UserDetail entity, BindingResult result, String backURL, RedirectAttributes redirectAttributes) {
        UserDetail userDetail = userDetailService.findOne(entity.getId());
        User user = userDetail.getUser();
        user.setPlainPassword(entity.getUser().getPlainPassword());
        user.setStatus(entity.getUser().getStatus());
        userService.update(user);
        return redirectToUrl(backURL);
    }
}
