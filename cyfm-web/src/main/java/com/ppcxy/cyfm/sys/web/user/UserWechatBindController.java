package com.ppcxy.cyfm.sys.web.user;

import com.ppcxy.common.utils.LogUtils;
import com.ppcxy.cyfm.sys.entity.UserWechatBind;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.service.UserWechatBindService;
import com.ppcxy.cyfm.sys.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.Objects;

@Controller
@RequestMapping("/uw")
public class UserWechatBindController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private UserWechatBindService userWechatBindService;
	
	/**
	 * 绑定新的openid，如果存在删除绑定新的
	 *
	 * @param username
	 * @param password
	 * @param openid
	 * @return 1 成功 ， 0 失败.
	 */
	@RequestMapping(value = "bind")
	@ResponseBody
	public String bindUser(String username, String password, String openid) {
		
		try {
			User user = userService.login(username, password);
			UserWechatBind uwbind = new UserWechatBind();
			uwbind.setUserId(user.getId());
			uwbind.setWechatOpenid(openid);
			uwbind.setBindDate(new Date());
			uwbind.setSubsystem("rt_wxapp");
			
			UserWechatBind oldUwbind = userWechatBindService.findByOpenId(openid);
			if (oldUwbind != null) {
				userWechatBindService.delete(oldUwbind);
			}
			userWechatBindService.save(uwbind);
			
			return "1";
		} catch (Exception e) {
			LogUtils.logError(String.format("用户绑定微信小程序失败。%s,%s,%s", username, password, openid), e);
			return "0";
		}
	}
	
	
	/**
	 * 获取openid是否已绑定
	 *
	 * @param openid
	 * @return 1 成功 ， 0 失败.
	 */
	@RequestMapping("bind/get")
	@ResponseBody
	public String getBind(String openid) {
		UserWechatBind bind = userWechatBindService.findByOpenId(openid);
		
		if (bind == null) {
			return "0";
			
		}
		return "1";
	}
	
	
	/**
	 * 绑定新的openid，如果存在删除绑定新的
	 *
	 * @param openid
	 * @return 1 成功 ， 0 失败.
	 */
	@RequestMapping(value = "unbind")
	@ResponseBody
	public String unbind(String openid) {
		
		try {
			UserWechatBind bind = userWechatBindService.findByOpenId(openid);
			if (bind == null) {
				return "-1";
			}
			if (Objects.equals("rt_wxapp", bind.getSubsystem())) {
				userWechatBindService.delete(bind);
			}
			return "1";
		} catch (Exception e) {
			LogUtils.logError(String.format("用户解绑微信小程序失败。%s", openid), e);
			return "0";
		}
	}
}
