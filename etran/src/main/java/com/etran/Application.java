package com.etran;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.etran.common.config.WebAppConfig;

@Configuration  
@ComponentScan
@EnableAutoConfiguration
public class Application extends WebAppConfig{

	public static void main(String[] args) {
		SpringApplication.run(Application.class);
	}
}
