package com.example.testingweb;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class SmokeTest {

	@Autowired
	private HomeController controller;

	@Test
	public void contextLoads() throws Exception {
		assertThat(controller).isNotNull();
	}

	@Test
	public void contextLoads1() throws Exception {
		assertThat(controller).isNotNull();
	}

	@Test
	public void contextLoads2() throws Exception {
		assertThat(controller).isNotNull();
	}

	@Test
	public void contextLoads3() throws Exception {
		assertThat(controller).isNotNull();
	}
}
