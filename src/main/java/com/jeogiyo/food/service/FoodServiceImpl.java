package com.jeogiyo.food.service;

import com.jeogiyo.food.dao.FoodDAO;
import com.jeogiyo.food.vo.FoodVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("foodService")
@Transactional(propagation = Propagation.REQUIRED)
// 진행 중인 트랜잭션이 있는 경우 해당 트랜잭션 사용
public class FoodServiceImpl implements FoodService{
    @Autowired
    FoodDAO foodDAO;

    @Override
    public List<FoodVO> searchFoodByShopIdAndCategory(String shop_id, String food_category) throws Exception {
        List foodList=foodDAO.selectFoodListByShopIdAndCategory(shop_id,food_category);
        return foodList;
    }
}
