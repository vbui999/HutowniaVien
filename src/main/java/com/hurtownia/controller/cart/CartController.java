package com.hurtownia.controller.cart;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hurtownia.model.Cart;
import com.hurtownia.model.Product;
import com.hurtownia.model.User;
import com.hurtownia.security.UserService;
import com.hurtownia.service.ProductService;

@Controller
@RequestMapping(value = "/cart")
public class CartController {
	@Autowired
	private ProductService productService;

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView userHomeCart(Principal principal) {
		ModelAndView model = new  ModelAndView("cart/cart");	
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName();
		
		if (name != null) {
			User user = userService.findByName(name);			
			model.addObject("userInfo", user);
			return model;
		}else {
			return new ModelAndView("redirect:/login");
		}
	}
	@RequestMapping(value = "add/{productId}/{number}", method = RequestMethod.GET)
	public ModelAndView viewAdd(ModelMap mm, HttpSession session, @PathVariable("productId") long productId, @PathVariable("number") int number) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		Product product = productService.getProductById(productId);
		if (product != null) {
			if (cartItems.containsKey(productId)) {
				Cart item = cartItems.get(productId);
				item.setProduct(product);
				item.setQuantity(item.getQuantity() + number);
				cartItems.put(productId, item);
			} else {
				Cart item = new Cart();
				item.setProduct(product);
				item.setQuantity(number);
				cartItems.put(productId, item);
				
			}
		}
		session.setAttribute("numberOfProducts", cartItems.size());
		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		double myDoubleToal = 0;
		session.setAttribute("myCartTotalTest", myDoubleToal );
		session.setAttribute("myCartNum", number);
		return new ModelAndView("redirect:/cart");
	}

	@RequestMapping(value = "sub/{productId}", method = RequestMethod.GET)
	public ModelAndView viewUpdate(ModelMap mm, HttpSession session, @PathVariable("productId") long productId) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		session.setAttribute("myCartItems", cartItems);
		return new ModelAndView("redirect:/cart");
	}

	@RequestMapping(value = "remove/{productId}", method = RequestMethod.GET)
	public ModelAndView viewRemove(ModelMap mm, HttpSession session, @PathVariable("productId") long productId) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		if (cartItems.containsKey(productId)) {
			cartItems.remove(productId);
		}
		session.setAttribute("numberOfProducts", cartItems.size());
		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartNum", cartItems.size());
		return new ModelAndView("redirect:/cart");
	}

	public double totalPrice(HashMap<Long, Cart> cartItems) {
		int count = 0;
		for (Map.Entry<Long, Cart> list : cartItems.entrySet()) {
			count += list.getValue().getProduct().getPrice() * list.getValue().getQuantity();
		}
		return count;
	}
}
