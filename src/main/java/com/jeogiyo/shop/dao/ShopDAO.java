package com.jeogiyo.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.jeogiyo.shop.vo.ShopVO;

@Mapper
public interface ShopDAO {

	

    public ShopVO selectShopById(int shop_id) throws DataAccessException;

    public List selectShopListByCategoryAndLocation(@Param("category") String category,@Param("bcode") String bcode) throws DataAccessException;

    public List selectShopListByMember(String memberId, String memberType) throws DataAccessException;

}
