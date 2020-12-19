package com.jeogiyo.food.dao;

import com.jeogiyo.food.vo.FoodVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
public interface FoodDAO {
    public List<FoodVO> selectFoodListByShopIdAndCategory(@Param("shop_id")String shop_id,@Param("food_category")String food_category) throws DataAccessException;
}
