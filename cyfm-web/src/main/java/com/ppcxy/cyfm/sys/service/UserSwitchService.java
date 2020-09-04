package com.ppcxy.cyfm.sys.service;

import com.ppcxy.common.utils.ShiroUser;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.service.user.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserSwitchService {
	@Autowired
	private UserService userService;
	
	public void switchTo(String userName, Boolean breforeSwitchPreUser) {
		if (breforeSwitchPreUser) {
		
		}
		switchTo(userName);
	}
	
	public void releaseRunAs() {
		Subject subject = SecurityUtils.getSubject();
		if (subject.isRunAs()) {
			subject.releaseRunAs();
		}
	}
	
	public void switchTo(String userName) {
		Subject subject = SecurityUtils.getSubject();
		User user = userService.findByUsername(userName);
		subject.runAs(new SimplePrincipalCollection(new ShiroUser(user.getId(), user.getTeam().getId(), user.getUsername(), user.getName()), user.getName()));
	}
	
	public boolean existPreUser() {
		Subject subject = SecurityUtils.getSubject();
		return subject.isRunAs();
	}
	
	
	public String loadPerUser() {
		Subject subject = SecurityUtils.getSubject();
		
		String previousUsername = null;
		
		if (subject.isRunAs()) {
			previousUsername =
					(String) subject.getPreviousPrincipals().getPrimaryPrincipal();
		}
		
		return previousUsername;
	}
}
