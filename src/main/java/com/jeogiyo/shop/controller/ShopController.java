package com.jeogiyo.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface ShopController {

    String searchShopListByCategory(@RequestParam("category") String category,
            @RequestParam("bcode") String bcode, Model model) throws Exception;

    ModelAndView shopDetail(@RequestParam("shop_id") int shop_id,
            HttpServletRequest request, HttpServletResponse response) throws Exception;

}
