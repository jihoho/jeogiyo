package com.jeogiyo.food.service;

import com.jeogiyo.food.vo.FoodVO;

import java.util.List;

public interface FoodService {
    public List<FoodVO> searchFoodByShopIdAndCategory(String shop_id, String food_category) throws Exception;
}
