package com.hurtownia.controller.myaccount;

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
public class MyAccountController {
	@RequestMapping(value = "/myaccount", method = RequestMethod.GET)
	public ModelAndView MyAccountDetail() {
		ModelAndView model = new ModelAndView("/myaccount/myaccount");
		
		return model;
	}
}