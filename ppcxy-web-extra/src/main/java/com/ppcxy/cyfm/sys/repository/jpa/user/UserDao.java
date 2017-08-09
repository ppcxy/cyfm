package com.ppcxy.cyfm.sys.repository.jpa.user;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.sys.entity.user.User;

public interface UserDao extends BaseRepository<User, Long> {

    User findByName(String name);

    User findByUsername(String username);

    User findByEmail(String email);

    User findByTel(String tel);
}
