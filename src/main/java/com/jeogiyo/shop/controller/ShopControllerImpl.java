package com.jeogiyo.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeogiyo.food.service.FoodService;
import com.jeogiyo.food.vo.FoodVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeogiyo.common.base.BaseController;
import com.jeogiyo.shop.service.ShopService;
import com.jeogiyo.shop.vo.ShopVO;

@Controller("shopController")
@RequestMapping(value="/shop")
public class ShopControllerImpl extends BaseController implements ShopController {
	@Autowired
	ShopService shopService;
	@Autowired
	FoodService foodService;
	
	@Override
	@RequestMapping(value="/listShop.do", method=RequestMethod.GET)
	public ModelAndView searchShopListByCategory(@RequestParam("category") String category,
									HttpServletRequest request, HttpServletResponse response ) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		System.out.println("shopController.searchShopsByCategory view name : "+viewName+"  category: "+category);
		List<ShopVO> shopList=shopService.searchShopListByCategory(category);
		if(shopList==null) {
			System.out.println("shopList null");
		}
		for(ShopVO shop: shopList) {
			System.out.println("shop_id: "+shop.getShop_id()+", shop_name: "+shop.getShop_name());
		}
		ModelAndView mav=new ModelAndView(viewName);
		mav.addObject("shopList", shopList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/shopDetail.do", method = RequestMethod.GET)
	public ModelAndView shopDetail(@RequestParam("shop_id") String shop_id, HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName=(String) request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView(viewName);

		ShopVO shopVO =shopService.searchShopById(shop_id);
		mav.addObject("shop",shopVO);
		System.out.println("******shop info******************************************************************");
		System.out.println(shopVO);

		List<FoodVO> mainFoodList=foodService.searchFoodByShopIdAndCategory(shop_id,"main_menu");
		List<FoodVO> sideFoodList=foodService.searchFoodByShopIdAndCategory(shop_id,"side_menu");
		List<FoodVO> setFoodList=foodService.searchFoodByShopIdAndCategory(shop_id,"set_menu");
		List<FoodVO> beverageFoodList=foodService.searchFoodByShopIdAndCategory(shop_id,"beverage_menu");
		mav.addObject("mainFoodList",mainFoodList);
		mav.addObject("sideFoodList",sideFoodList);
		mav.addObject("setFoodList",setFoodList);
		mav.addObject("beverageFoodList",beverageFoodList);



		System.out.println("******main food info******************************************************************");
		mainFoodList.forEach(s->System.out.println(s.toString()));
		System.out.println("******side food info******************************************************************");
		sideFoodList.forEach(s->System.out.println(s.toString()));
		System.out.println("******set food info******************************************************************");
		setFoodList.forEach(s->System.out.println(s.toString()));
		System.out.println("******beverage food info******************************************************************");
		beverageFoodList.forEach(s->System.out.println(s.toString()));




		return mav;
	}
}
