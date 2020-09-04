package com.ppcxy.cyfm.sys.service;

import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.sys.entity.UserWechatBind;
import com.ppcxy.cyfm.sys.repository.jpa.UserWechatBindDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserWechatBindService extends BaseService<UserWechatBind, Long> {
	@Autowired
	private UserWechatBindDao userWechatBindDao;
	
	public UserWechatBind findByOpenId(String openid) {
		
		return userWechatBindDao.findByWechatOpenid(openid);
	}
	
}
