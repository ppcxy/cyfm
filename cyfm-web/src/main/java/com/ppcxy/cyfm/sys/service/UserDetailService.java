package com.ppcxy.cyfm.sys.service;

import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.sys.entity.UserDetail;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserDetailService extends BaseService<UserDetail, Long> {
}
