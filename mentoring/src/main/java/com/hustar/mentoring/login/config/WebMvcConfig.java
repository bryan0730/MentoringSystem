package com.hustar.mentoring.login.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

	
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
		
		// 파일 인코딩 설정
		commonsMultipartResolver.setDefaultEncoding("UTF-8");
		
		// 업로드 파일크기 제한 ( 5 * 1024 * 1024 = 5MB)
		commonsMultipartResolver.setMaxUploadSizePerFile(5*1024*1024);
		
		return commonsMultipartResolver;
	}
}
