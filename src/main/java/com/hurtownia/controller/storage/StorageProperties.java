package com.hurtownia.controller.storage;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("storage")
public class StorageProperties {

	/**
	 * Folder location for storing files
	 */
//	private String location = "src/main/resources/static/product_img";

	private String location = "src/main/resources/static/product_img";
	
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

}
