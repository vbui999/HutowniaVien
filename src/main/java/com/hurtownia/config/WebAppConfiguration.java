package com.hurtownia.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

@Configuration
@EnableWebMvc
//@EnableSpringDataWebSupport
@ComponentScan("com.hurtownia.controller")
public class WebAppConfiguration implements WebMvcConfigurer{

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {

		registry.jsp("/WEB-INF/jsp/", ".jsp");
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	
		registry.addResourceHandler("/resources/**").addResourceLocations("classpath:/static/");
		registry.addResourceHandler("/template/**").addResourceLocations("/WEB-INF/template/");
	}
	 @Bean
	 public SimpleMappingExceptionResolver exceptionResolver() {
	        SimpleMappingExceptionResolver exceptionResolver = new SimpleMappingExceptionResolver();

	        Properties exceptionMappings = new Properties();
	        exceptionMappings.put("org.springframework.security.web.authentication.rememberme.CookieTheftException", "user/login?error=sessionExpired");
	        exceptionMappings.put("java.lang.RuntimeException", "error/error");
	        exceptionMappings.put("java.lang.Exception", "error/error");
	        exceptionResolver.setExceptionMappings(exceptionMappings);

	        Properties statusCodes = new Properties();
	        statusCodes.put("error/403", "403");
	        statusCodes.put("error/404", "404");
	        statusCodes.put("error/error", "500");
	        exceptionResolver.setStatusCodes(statusCodes);

	        return exceptionResolver;
	    }
}
