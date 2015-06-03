package com.etran.common.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

//test 注释 
//test
@Configuration 
public class ApplicationConfig {

	public @Bean SimpleMappingExceptionResolver resolver() {
		
		SimpleMappingExceptionResolver	simpleMappingExceptionResolver = new SimpleMappingExceptionResolver();
		Properties mappings = new Properties();
		mappings.put("org.apache.shiro.authz.UnauthenticatedException", "common/403");
		mappings.put("org.apache.shiro.authz.UnauthorizedException", "common/403");
		mappings.put("org.apache.shiro.authc.LockedAccountException", "common/locked");
//		mappings.put("java.lang.Throwable", "common/500");
		simpleMappingExceptionResolver.setExceptionMappings(mappings );
		return simpleMappingExceptionResolver;
	} 
	
	
}
