/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.ppcxy.cyfm.showcase.functional.rest;

import com.ppcxy.cyfm.showcase.functional.BaseFunctionalTestCase;
import com.ppcxy.cyfm.sys.webservice.rest.dto.UserDTO;
import org.junit.Test;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.fail;

/**
 * 对基于JAX-RS的实现Restful的测试
 * 
 * @author calvin
 */
public class UserJaxRsFT extends BaseFunctionalTestCase {

	private static String resourceUrl = baseUrl + "/cxf/jaxrs/user";

	private RestTemplate restTemplate = new RestTemplate();

	@Test
	public void getUser() {
		UserDTO user = restTemplate.getForObject(resourceUrl + "/{id}.xml", UserDTO.class, 1L);
		assertThat(user.getUsername()).isEqualTo("admin");
		assertThat(user.getName()).isEqualTo("管理员");
		assertThat(user.getTeamId()).isEqualTo(1);

		try {
			user = restTemplate.getForObject(resourceUrl + "/{id}.json", UserDTO.class, 1L);
		} catch (HttpStatusCodeException e) {
			fail(e.getMessage());
		}
		assertThat(user.getUsername()).isEqualTo("admin");
		assertThat(user.getName()).isEqualTo("管理员");
		assertThat(user.getTeamId()).isEqualTo(1);
	}
}
