package com.jeogiyo.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeogiyo.food.service.FoodService;
import com.jeogiyo.food.vo.FoodVO;
import com.jeogiyo.review.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeogiyo.shop.service.ShopService;
import com.jeogiyo.shop.vo.ShopVO;

@Controller("shopController")
@RequestMapping(value = "/shop")
public class ShopControllerImpl implements ShopController {

    @Autowired
    ShopService shopService;
    @Autowired
    FoodService foodService;
    @Autowired
    ReviewService reviewService;

    @Override
    @GetMapping("/listShop")
    public String searchShopListByCategory(@RequestParam("category") String category,
            @RequestParam("bcode") String bcode, Model model) throws Exception {

        List<ShopVO> shopList = shopService.searchShopListByCategoryAndLocation(category, bcode);
        model.addAttribute("shopList", shopList);
        return "/shop/listShop";
    }

	@Override
	@RequestMapping(value = "/shopDetail", method = RequestMethod.GET)
	public ModelAndView shopDetail(@RequestParam("shop_id") int shop_id, HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName=(String) request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView(viewName);

		ShopVO shopVO =shopService.searchShopById(shop_id);
		mav.addObject("shop",shopVO);
		System.out.println("******shop info******************************************************************");
		System.out.println(shopVO);

		List<FoodVO> mainFoodList=foodService.searchFoodByShopIdAndCategory(String.valueOf(shop_id),"main_menu");
		List<FoodVO> sideFoodList=foodService.searchFoodByShopIdAndCategory(String.valueOf(shop_id),"side_menu");
		List<FoodVO> setFoodList=foodService.searchFoodByShopIdAndCategory(String.valueOf(shop_id),"set_menu");
		List<FoodVO> beverageFoodList=foodService.searchFoodByShopIdAndCategory(String.valueOf(shop_id),"beverage_menu");
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

//		List<ReviewVO> reviewList=reviewService.searchReviewByShopId(shop_id);


		return mav;
	}
}
