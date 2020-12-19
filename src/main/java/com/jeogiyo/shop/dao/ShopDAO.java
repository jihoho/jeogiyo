package com.jeogiyo.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.jeogiyo.shop.vo.ShopVO;

@Mapper
public interface ShopDAO {

	
	public List<ShopVO> selectShopListByCategory(String category) throws DataAccessException;

    public ShopVO selectShopById(String shop_id) throws DataAccessException;
}