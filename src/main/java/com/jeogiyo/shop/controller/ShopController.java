package com.jeogiyo.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface ShopController {

	

	ModelAndView searchShopListByCategory(String category, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
}
