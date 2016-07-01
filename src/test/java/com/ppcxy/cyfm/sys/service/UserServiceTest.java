/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.ppcxy.cyfm.sys.service;

import com.ppcxy.common.exception.BaseException;
import com.ppcxy.cyfm.sys.entity.User;
import com.ppcxy.cyfm.sys.repository.jpa.UserDao;
import com.ppcxy.common.utils.ShiroUser;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springside.modules.test.security.shiro.ShiroTestUtils;

import static org.assertj.core.api.Assertions.failBecauseExceptionWasNotThrown;

public class UserServiceTest {

	@InjectMocks
	private UserService userService;

	@Mock
	private UserDao mockUserDao;

	@Mock
	private BusinessLogger businessLogger;

	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		ShiroTestUtils.mockSubject(new ShiroUser("foo", "Foo"));
	}

	@After
	public void tearDown() {
		ShiroTestUtils.clearSubject();
	}

	@Test
	public void saveUser() {
		User admin = new User();
		admin.setId(1L);

		User user = new User();
		user.setId(2L);
		user.setPlainPassword("123");

		// 正常保存用户.
		userService.save(user);

		// 保存超级管理用户抛出异常.
		try {
			userService.save(admin);
			failBecauseExceptionWasNotThrown(BaseException.class);
		} catch (BaseException e) {
			// expected exception
		}
		Mockito.verify(mockUserDao, Mockito.never()).delete(1L);
	}
}
