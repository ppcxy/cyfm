package com.ppcxy.common.repository.service;

import com.ppcxy.common.repository.entity.User;
import com.ppcxy.common.repository.jpa.BaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Service;

/**
 */
@DependsOn("userRepository2")
@Service()
public class UserService2 extends UserService {

    @Autowired
    @Qualifier("userRepository2")
    @Override
    public void setBaseRepository(BaseRepository<User, Long> baseRepository) {
        super.setBaseRepository(baseRepository);
    }
}
