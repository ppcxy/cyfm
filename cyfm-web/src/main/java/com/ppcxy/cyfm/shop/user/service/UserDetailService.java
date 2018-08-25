package com.ppcxy.cyfm.shop.user.service;

import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.shop.user.entity.UserDetail;
import com.ppcxy.cyfm.shop.user.repository.jpa.UserDetailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserDetailService extends BaseService<UserDetail, Long> {
    
    @Autowired
    private UserDetailDao userDetailDao;
    
    public UserDetail findByUserId(Long id) {
        return userDetailDao.findByUserId(id);
    }
}
