package com.hurtownia;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import com.hurtownia.controller.storage.StorageProperties;

@SpringBootApplication
@EnableConfigurationProperties(StorageProperties.class)
public class HurtowniaVienApplication {

	public static void main(String[] args) {
		SpringApplication.run(HurtowniaVienApplication.class, args);
	}

}
