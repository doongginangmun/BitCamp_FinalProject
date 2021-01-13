package com.project.shop.cart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface CartController {
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public @ResponseBody String addProductInCart(@RequestParam("product_name") String product_name,
												 @RequestParam("quantity") int quantity,
												 @RequestParam("option_name") String option_name,
												 HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public @ResponseBody String plusQuantity(@RequestParam("product_name") String product_name,
											 @RequestParam("cart_id") int cart_id,
		                                         HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public @ResponseBody String minusQuantity(@RequestParam("product_name") String product_name,
											  @RequestParam("cart_id") int cart_id,
            									 HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public @ResponseBody String removeCartProduct(@RequestParam("cart_id") int cart_id,
										          @RequestParam("product_name") String product_name,
												  HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView deleteAllProduct(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public @ResponseBody String cartChkCount(@RequestParam("member_id") String member_id,
			 								 HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
