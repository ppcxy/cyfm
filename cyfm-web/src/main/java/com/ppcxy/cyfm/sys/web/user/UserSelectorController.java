package com.ppcxy.cyfm.sys.web.user;

import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.web.bind.annotation.PageableDefaults;
import com.ppcxy.common.web.controller.BaseController;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.mapper.JsonMapper;

@Controller
@RequestMapping("/sys/user/selector")
public class UserSelectorController extends BaseController<User, Long> {
    
    @Autowired
    private UserService userService;
    
    @RequestMapping({"", "selectorForm"})
    public String selectorForm() {
        return viewName("selector_form");
    }
    
    @RequestMapping("loadData")
    @ResponseBody
    @PageableDefaults(sort = "id=desc")
    public String loadData(Searchable searchable, Model model) {
        Page<User> page = userService.findAll(searchable);
        return JsonMapper.nonEmptyMapper().toJson(page);
    }
    
}
