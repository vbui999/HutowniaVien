package com.hurtownia.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hurtownia.model.Category;
import com.hurtownia.repository.CategoryRepository;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryRepository categoryRepository;
	
	 @Override
	 public List<Category> getAllCategories(){
		 return (List<Category>) categoryRepository.findAll();
	 }
	 
	 @Override
	 public Category getCategoryById(long id) {
		 return categoryRepository.findById(id).get();
	 }
	 
	 @Override
	 public void saveOrUpdate(Category category) {
		 categoryRepository.save(category);
	 }
	 
	 @Override
	 public void deleteCategory(long id) {
		 categoryRepository.deleteById(id);
	 }
	
}

