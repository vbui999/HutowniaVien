package com.hurtownia.controller.home;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@EnableAutoConfiguration
@RequestMapping(value = "/")
public class UserHome {

	@RequestMapping(value = "/index.html", method = RequestMethod.GET)
	public ModelAndView userHome() {
		ModelAndView model = new ModelAndView("user/user_home");

		return model;
	}

}