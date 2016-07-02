/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 * <p/>
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.ppcxy.cyfm.sys.repository.jpa;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.sys.entity.User;

public interface UserDao extends BaseRepository<User, Long> {

    User findByName(String name);

    User findByLoginName(String loginName);

    User findByEmail(String email);

    User findByTel(String mobilePhoneNumber);
}
