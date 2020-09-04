package com.ppcxy.cyfm.sys.web.admin;

import com.ppcxy.common.web.bind.annotation.CurrentUser;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.service.UserSwitchService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/sys/admin")
public class AdminController {
	@Autowired
	private UserSwitchService userSwitchService;
	
	@RequestMapping(value = "mainJob")
	public String mainJob() {
		if (userSwitchService.existPreUser()) {
			userSwitchService.releaseRunAs();
		}
		return "sys/admin/switchToUser";
	}
	
	@RequestMapping(value = "switchToUser", method = RequestMethod.GET)
	@RequiresRoles("Admin")
	public String switchToUser(@CurrentUser User user, String userName, Model model) {
		userSwitchService.switchTo(userName);
		return "sys/admin/switchToUser";
	}
}
