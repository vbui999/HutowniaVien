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
import com.hurtownia.service.ProductService;

import java.time.LocalDateTime; // Import the LocalDateTime class
import java.time.format.DateTimeFormatter; // Import the DateTimeFormatter class

@Controller
@RequestMapping("/admin")
public class ProductController {

	 //get datetime
	 LocalDateTime myDateObj = LocalDateTime.now();
	 DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	 String formattedDate = myDateObj.format(myFormatObj);
	 
	 @Autowired
	 ProductService productService;
	 @Autowired
	 CategoryService categoryService;
	 
	 
	 @RequestMapping(value="", method = RequestMethod.GET)
	 public ModelAndView adminHome() {
		 ModelAndView model = new ModelAndView("admin/product_list"); //dung tam
		 List<Product> productList = productService.getAllProducts();
		 model.addObject("productList", productList);
		 return model;
	 }
	 
	 
	 @RequestMapping(value="/product/list", method=RequestMethod.GET)
	 public ModelAndView list() {
	  ModelAndView model = new ModelAndView("admin/product_list");
	  List<Product> productList = productService.getAllProducts();
	  model.addObject("productList", productList);  
	  return model;
	 }
	 @RequestMapping(value="/product/{id}", method=RequestMethod.GET)
	 public ModelAndView showProduct(@PathVariable long id) {
	  ModelAndView model = new ModelAndView("admin/product_by_id");
	  Product product = productService.getProductById(id);
	  model.addObject("productById", product);
	  
	  return model;
	 }
	 
	 
	 @RequestMapping(value="/product/addProduct/", method=RequestMethod.GET)
	 public ModelAndView addProduct() {
	  ModelAndView model = new ModelAndView();
	  
	  Product product = new Product();
	  List<Category> categories = categoryService.getAllCategories();
	  model.addObject("categories", categories);
	  model.addObject("productForm", product);
	  
	  product.setCreateddate(formattedDate);  
	  model.setViewName("admin/product_form");  
	  return model;
	 }
	 
	 @RequestMapping(value="/product/updateProduct/{id}", method=RequestMethod.GET) //direct to update form
	 public ModelAndView editProduct(@PathVariable long id) {
	  ModelAndView model = new ModelAndView();
	  Product product = productService.getProductById(id);
	  
	  String cate_selected = product.getCategoryname();
	  String type_selected = product.getType();
	  int isactivated_selected = product.getIsactivated();
	  
	  List<Category> categories = categoryService.getAllCategories();
	  
	  model.addObject("productForm", product);
	  model.addObject("category_selected", cate_selected);
	  model.addObject("type_selected", type_selected);
	  model.addObject("isactivated_selected", isactivated_selected);
	  model.addObject("categories", categories);  
	  model.setViewName("admin/product_form");
	  
	  return model;
	 }
	 
	 @RequestMapping(value="/product/saveProduct", method=RequestMethod.POST) //save product's info
	 public ModelAndView save(@ModelAttribute("productForm") Product product) {
	 
      product.setModifieddate(formattedDate);
	  productService.saveOrUpdate(product);
	  return new ModelAndView("redirect:/admin/product/list");
	 }
	 
	 
	 @RequestMapping(value="product/deleteProduct/{id}", method=RequestMethod.GET)
	 public ModelAndView delete(@PathVariable("id") long id) {
	  productService.deleteProduct(id);
	  
	  return new ModelAndView("redirect:/admin/product/list");
	 }
	}


