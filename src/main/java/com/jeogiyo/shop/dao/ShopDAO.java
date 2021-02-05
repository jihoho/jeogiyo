package com.jeogiyo.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.jeogiyo.shop.vo.ShopVO;

@Mapper
public interface ShopDAO {

	

    public ShopVO selectShopById(int shop_id) throws DataAccessException;

    public List selectShopListByCategoryAndLocation(String category, String bcode) throws DataAccessException;

    public List selectShopListByMember(String memberId, String memberType) throws DataAccessException;

}
