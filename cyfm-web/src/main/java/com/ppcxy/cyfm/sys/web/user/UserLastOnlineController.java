package com.ppcxy.cyfm.sys.web.user;

import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.web.bind.annotation.PageableDefaults;
import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.sys.entity.user.UserLastOnline;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>Date: 13-1-28 下午4:29
 * <p>Version: 1.0
 */
@Controller
@RequestMapping(value = "/sys/user/lastOnline")
public class UserLastOnlineController extends BaseCRUDController<UserLastOnline, Long> {
    
    public UserLastOnlineController() {
        setResourceIdentity("sys:user:LastOnline");
        setModelName("lastOnline");
    }
    
    @Override
    protected void preResponse(Model model) {
        super.preResponse(model);
        model.addAttribute("customToolbar", true);
    }
    
    @Override
    @PageableDefaults(sort = {"lastLoginTimestamp=desc"})
    public String list(Searchable searchable, Model model) {
        return super.list(searchable, model);
    }
    
}
