package com.jeogiyo.shop.service;

import java.util.List;

import com.jeogiyo.shop.vo.ShopVO;

public interface ShopService {


    public ShopVO searchShopById(int shop_id) throws  Exception;

    public List<ShopVO> searchShopListByCategoryAndLocation(String category, String bcode);

    //    public List<ShopVO> searchShopListByLocation() throws Exception;
}
