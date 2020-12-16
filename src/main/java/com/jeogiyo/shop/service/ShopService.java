package com.jeogiyo.shop.service;

import java.util.List;

import com.jeogiyo.shop.vo.ShopVO;

public interface ShopService {

	public List<ShopVO> searchShopListByCategory(String category) throws Exception;

    public ShopVO searchShopById(String shop_id);
}
