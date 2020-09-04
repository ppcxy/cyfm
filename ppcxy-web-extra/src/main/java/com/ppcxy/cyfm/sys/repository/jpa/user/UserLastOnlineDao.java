package com.ppcxy.cyfm.sys.repository.jpa.user;


import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.sys.entity.user.UserLastOnline;

/**
 * <p>Date: 13-2-4 下午3:00
 * <p>Version: 1.0
 */
public interface UserLastOnlineDao extends BaseRepository<UserLastOnline, Long> {
    
    UserLastOnline findByUserId(Long userId);
}
