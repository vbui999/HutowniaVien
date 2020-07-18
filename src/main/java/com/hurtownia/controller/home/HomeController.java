package com.hurtownia.controller.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hurtownia.model.Category;
import com.hurtownia.model.Product;
import com.hurtownia.service.CategoryService;
import com.hurtownia.service.ProductService;

@Controller
public class HomeController {

	@Autowired
	ProductService productService;

	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView userHome() {
		return viewActivatedPageOrderByIdDesc(1);
	}

	@RequestMapping(value = "/page/{pageNum}", method = RequestMethod.GET)
	public ModelAndView userHomewithPage(@PathVariable int pageNum) {
		return viewActivatedPageOrderByIdDesc(pageNum);
	}

	@RequestMapping(value = "/category/{cateName}/{pageNum}", method = RequestMethod.GET)
	public ModelAndView cateProductViewWithPage(@PathVariable(name = "cateName") String cateName, @PathVariable(name = "pageNum") int pageNum, @Param("type") String type) {
		Category category = categoryService.getCategoryBycatename(cateName);
		long cateId = category.getId();
		String cateFullName = category.getCatefullname();
		if (type == null) {
			return viewActivatedProductInCategoryOrderByIdDesc(cateId, pageNum, cateFullName, cateName);
		} else {
			return viewActivatedProductInCategoryAndTypeOrderByIdDesc(cateId, pageNum, cateFullName, cateName, type);
		}
	}

	@RequestMapping(value = "/category/{cateName}", method = RequestMethod.GET)
	public ModelAndView cateProductViewWithPage1(@PathVariable(name = "cateName") String cateName, @Param("type") String type) {
		Category category = categoryService.getCategoryBycatename(cateName);
		long cateId = category.getId();
		String cateFullName = category.getCatefullname();
		if (type == null) {
			return viewActivatedProductInCategoryOrderByIdDesc(cateId, 1, cateFullName, cateName);
		} else {
			return viewActivatedProductInCategoryAndTypeOrderByIdDesc(cateId, 1, cateFullName, cateName, type);
		}

	}

	@GetMapping(value = "/detail/{path}")
	public ModelAndView productDetail(@PathVariable String path) {
		ModelAndView model = new ModelAndView("user/product_detail");
		Product product = productService.getProductByPath(path);
		List<Product> top5ListProduct = productService.ListTop5ActivatedInCategoryAndTypeOrderbyIdDesc(product.getCategoryid(), product.getType());
		List<Product> top5ListProduct2 = productService.ListTop5ActivatedDesc();

		Category category = categoryService.getCategoryById(product.getCategoryid());
		model.addObject("category", category);
		model.addObject("productById", product);
		model.addObject("top5ListProdduct", top5ListProduct);
		model.addObject("top5ListProdduct2", top5ListProduct2);
		return model;
	}

	public ModelAndView viewActivatedPageOrderByIdDesc(@PathVariable(name = "pageNum") int pageNum) {
		ModelAndView model = new ModelAndView("user/user_home");
		Page<Product> page = productService.listAllActivatedOrderByIdDesc(pageNum);
		List<Product> productList = page.getContent();
		model.addObject("currentPage", pageNum);
		model.addObject("totalPages", page.getTotalPages());
		model.addObject("totalItems", page.getTotalElements());
		model.addObject("productList", productList);
		return model;
	}

	public ModelAndView viewActivatedProductInCategoryOrderByIdDesc(long cateid, int pageNum, String cateFullName, String cateName) {
		ModelAndView model = new ModelAndView("user/category_product");
		Page<Product> page = productService.listAllActivatedInCategoryOrderbyIdDesc(cateid, pageNum);
		List<Product> productList = page.getContent();
		model.addObject("cateFullName", cateFullName);
		model.addObject("cateName", cateName);
		model.addObject("currentPage", pageNum);
		model.addObject("totalPages", page.getTotalPages());
		model.addObject("totalItems", page.getTotalElements());
		model.addObject("productList", productList);
		return model;
	}

	public ModelAndView viewActivatedProductInCategoryAndTypeOrderByIdDesc(long cateid, int pageNum, String cateFullName, String cateName, String type) {
		ModelAndView model = new ModelAndView("user/category_product");
		Page<Product> page = productService.listAllActivatedInCategoryAndTypeOrderbyIdDesc(cateid, type, pageNum);
		List<Product> productList = page.getContent();
		model.addObject("cateFullName", cateFullName);
		model.addObject("cateName", cateName);
		model.addObject("currentPage", pageNum);
		model.addObject("totalPages", page.getTotalPages());
		model.addObject("totalItems", page.getTotalElements());
		model.addObject("productList", productList);
		return model;
	}

	public ModelAndView viewActivatedPage(@PathVariable(name = "pageNum") int pageNum, @Param("sortField") String sortField, @Param("sortDir") String sortDir) {

		ModelAndView model = new ModelAndView("user/user_home");

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

}