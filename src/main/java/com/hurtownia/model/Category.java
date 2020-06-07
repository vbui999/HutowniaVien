package com.hurtownia.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@Column(name = "catename")
	private String catename;
	
	@Column(name = "catefullname")
	private String catefullname;

	
	//getters and setters
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCatename() {
		return catename;
	}

	public void setCatename(String catename) {
		this.catename = catename;
	}

	public String getCatefullname() {
		return catefullname;
	}

	public void setCatefullname(String catefullname) {
		this.catefullname = catefullname;
	}
	
	
}
