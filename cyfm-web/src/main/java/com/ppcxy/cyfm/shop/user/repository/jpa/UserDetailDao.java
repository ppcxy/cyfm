package com.ppcxy.cyfm.shop.user.repository.jpa;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.shop.user.entity.UserDetail;

public interface UserDetailDao extends BaseRepository<UserDetail, Long> {
    UserDetail findByUserId(Long id);
}
