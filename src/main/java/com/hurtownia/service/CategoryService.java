package com.hurtownia.service;

import java.util.List;

import com.hurtownia.model.Category;

public interface CategoryService {

	 public List<Category> getAllCategories();
	 
	 public Category getCategoryById(long id);
	 	 
	 public void saveOrUpdate(Category category);
	 		 
	 public void deleteCategory(long id);
	 
	 public Category getCategoryBycatefullname(String catefullname);
	 
	 public Category getCategoryBycatename(String catename);
}
