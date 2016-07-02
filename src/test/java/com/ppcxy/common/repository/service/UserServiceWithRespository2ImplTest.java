package com.ppcxy.common.repository.service;

import org.junit.Before;
import org.springframework.beans.factory.annotation.Autowired;

/**
 */
public class UserServiceWithRespository2ImplTest extends UserServiceTest {


    @Autowired
    private UserService2 userService2;

    @Before
    public void setUp() {
        userService = userService2;
    }


}
