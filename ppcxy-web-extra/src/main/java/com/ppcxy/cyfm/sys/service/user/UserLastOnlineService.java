package com.ppcxy.cyfm.sys.service.user;

import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.sys.entity.user.UserLastOnline;
import com.ppcxy.cyfm.sys.repository.jpa.user.UserLastOnlineDao;
import org.springframework.stereotype.Service;

/**
 * <p>Date: 13-2-4 下午3:01
 * <p>Version: 1.0
 */
@Service
public class UserLastOnlineService extends BaseService<UserLastOnline, Long> {
    
    private UserLastOnlineDao getUserLastOnlineRepository() {
        return (UserLastOnlineDao) baseRepository;
    }
    
    
    public UserLastOnline findByUserId(Long userId) {
        return getUserLastOnlineRepository().findByUserId(userId);
    }
    
    public void lastOnline(UserLastOnline lastOnline) {
        UserLastOnline dbLastOnline = findByUserId(lastOnline.getUserId());
        
        if (dbLastOnline == null) {
            dbLastOnline = lastOnline;
        } else {
            UserLastOnline.merge(lastOnline, dbLastOnline);
        }
        dbLastOnline.incLoginCount();
        dbLastOnline.incTotalOnlineTime();
        //相对于save or update
        save(dbLastOnline);
    }
}
