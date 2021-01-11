package com.jeogiyo.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface ShopController {

	

	public ModelAndView searchShopListByCategory(String category,
												 @RequestParam("bcode") String bcode,HttpServletRequest request,
												 HttpServletResponse response) throws Exception;
	public ModelAndView shopDetail(@RequestParam("shop_id") int shop_id,
								   HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
}
