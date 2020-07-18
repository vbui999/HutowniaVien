package com.hurtownia.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hurtownia.model.Category;
import com.hurtownia.model.Product;
import com.hurtownia.service.CategoryService;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView viewCate() {
		ModelAndView model = new ModelAndView();
		
		List<Category> categoryList = categoryService.getAllCategories();
		model.addObject("categoryList", categoryList);
		
		model.setViewName("admin/category/category_list");
		return model;
	}
	
	@RequestMapping(value = "/addCategory", method = RequestMethod.GET)
	public ModelAndView addCategory() {
		ModelAndView model = new ModelAndView();
		Category category = new Category();
		
		model.addObject("categoryForm",category);
		
		model.setViewName("admin/category/category_form");
		return model;
	}
	
	@RequestMapping(value = "/updateCategory/{id}", method = RequestMethod.GET) // direct to update form
	public ModelAndView editCategory(@PathVariable long id) {
		ModelAndView model = new ModelAndView();
		Category category = categoryService.getCategoryById(id);

		model.addObject("categoryForm", category);
		model.setViewName("admin/category/category_form");

		return model;
	}

	@RequestMapping(value = "/saveCategory", method = RequestMethod.POST) // save category's info
	public ModelAndView save(@ModelAttribute("categoryForm") Category category) {

		categoryService.saveOrUpdate(category);
		return new ModelAndView("redirect:/admin/category");
	}

	@RequestMapping(value = "/category/deleteCategory/{id}", method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable("id") long id) {
		categoryService.deleteCategory(id);

		return new ModelAndView("redirect:/admin/category");
	}
}
