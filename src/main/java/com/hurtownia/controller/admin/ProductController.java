package com.hurtownia.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hurtownia.model.Category;
import com.hurtownia.model.Product;
import com.hurtownia.service.CategoryService;
import com.hurtownia.service.ProductService;

import java.text.Normalizer;
import java.time.LocalDateTime; // Import the LocalDateTime class
import java.time.format.DateTimeFormatter; // Import the DateTimeFormatter class
import java.lang.String;

@Controller
//@RequestMapping("/admin")
public class ProductController {

	@Autowired
	ProductService productService;
	@Autowired
	CategoryService categoryService;

	// get datetime
	LocalDateTime myDateObj = LocalDateTime.now();
	DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	String formattedDate = myDateObj.format(myFormatObj);
//	AdditionalFunction addFunction;
	
	
	
	@RequestMapping("/admin")   //dung tam
	public ModelAndView viewActivatedPage() {
		return viewActivatedPage(1, "id", "desc");
	}
	
	//@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView viewActivatedPage(@PathVariable(name = "pageNum") int pageNum, @Param("sortField") String sortField,
			@Param("sortDir") String sortDir) {

		ModelAndView model = new ModelAndView("admin/product_list");
		
		Page<Product> page = productService.listAllActivated(pageNum, sortField, sortDir);
		List<Product> productList = page.getContent();
		
		model.addObject("currentPage", pageNum);		
		model.addObject("totalPages", page.getTotalPages());
		model.addObject("totalItems", page.getTotalElements());
		
		model.addObject("sortField", sortField);
		model.addObject("sortDir", sortDir);
		model.addObject("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");
		model.addObject("productList", productList);
		return model;
	}
	
	@RequestMapping("/admin/product/page")
	public ModelAndView viewHomePage() {
		return viewPage(1, "id", "desc");
	}
	
	@RequestMapping(value = "/admin/product/page/{pageNum}", method = RequestMethod.GET)
	public ModelAndView viewPage(@PathVariable(name = "pageNum") int pageNum, @Param("sortField") String sortField,
			@Param("sortDir") String sortDir) {

		ModelAndView model = new ModelAndView("admin/product_list");
		
		Page<Product> page = productService.listAll(pageNum, sortField, sortDir);
		List<Product> productList = page.getContent();
		
		model.addObject("currentPage", pageNum);		
		model.addObject("totalPages", page.getTotalPages());
		model.addObject("totalItems", page.getTotalElements());
		
		model.addObject("sortField", sortField);
		model.addObject("sortDir", sortDir);
		model.addObject("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");
		model.addObject("productList", productList);
		return model;
	}

	@RequestMapping(value = "/admin/product/{id}", method = RequestMethod.GET)
	public ModelAndView showProduct(@PathVariable long id) {
		ModelAndView model = new ModelAndView("admin/product_by_id");
		Product product = productService.getProductById(id);
		model.addObject("productById", product);
		
		return model;
	}

	@RequestMapping(value = "/admin/product/addProduct/", method = RequestMethod.GET)
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

	@RequestMapping(value = "/admin/product/updateProduct/{id}", method = RequestMethod.GET) // direct to update form
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

	@RequestMapping(value = "/admin/product/saveProduct", method = RequestMethod.POST) // save product's info
	public ModelAndView save(@ModelAttribute("productForm") Product product) {

		product.setModifieddate(formattedDate);

		// set unique_name
		String uName = product.getName();
		uName = Normalizer.normalize(uName.toLowerCase(), Normalizer.Form.NFD);
		uName = uName.replaceAll(" ", "_").replaceAll("[^a-zA-Z0-9_]", "");

		//set Category Id
		Category category = categoryService.getCategoryBycatefullname(product.getCategoryname());
		product.setCategoryid(category.getId());
		
		LocalDateTime myDateObj = LocalDateTime.now();
		uName = uName + myDateObj.getYear() + myDateObj.getMonthValue() + myDateObj.getDayOfMonth();

		product.setUniquename(uName);
		productService.saveOrUpdate(product);
		return new ModelAndView("redirect:/admin/product/page");
	}

	@RequestMapping(value = "/adminproduct/deleteProduct/{id}", method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable("id") long id) {
		productService.deleteProduct(id);

		return new ModelAndView("redirect:/admin/product/page");
	}
}
