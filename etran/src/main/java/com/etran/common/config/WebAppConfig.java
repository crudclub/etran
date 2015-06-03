package com.etran.common.config;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.etran.interceptor.LocalInterceptor;

public class WebAppConfig extends WebMvcConfigurerAdapter {

	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(WebAppConfig.class);
	}

	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LocalInterceptor()).addPathPatterns("/**");
	}

}