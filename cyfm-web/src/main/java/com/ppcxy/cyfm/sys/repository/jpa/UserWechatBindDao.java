package com.ppcxy.cyfm.sys.repository.jpa;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.sys.entity.UserWechatBind;

public interface UserWechatBindDao extends BaseRepository<UserWechatBind, Long> {
	UserWechatBind findByWechatOpenid(String openid);
}
