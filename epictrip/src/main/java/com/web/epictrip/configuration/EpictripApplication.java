package com.web.epictrip.configuration;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class EpictripApplication extends SpringBootServletInitializer {

	// 이 부분을 추가함 (war 배포를 위한 소스)
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(EpictripApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(EpictripApplication.class, args);
	}
	
}