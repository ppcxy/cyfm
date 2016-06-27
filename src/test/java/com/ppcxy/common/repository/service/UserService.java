package com.ppcxy.common.repository.service;

import com.ppcxy.common.repository.entity.User;
import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.common.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Service;

/**
 * <p>Date: 13-1-17 下午7:52
 * <p>Version: 1.0
 */
@DependsOn("userRepository")
@Service()
public class UserService extends BaseService<User, Long> {

    @Autowired
    @Qualifier("userRepository")
    @Override
    public void setBaseRepository(BaseRepository<User, Long> baseRepository) {
        super.setBaseRepository(baseRepository);
    }
}
