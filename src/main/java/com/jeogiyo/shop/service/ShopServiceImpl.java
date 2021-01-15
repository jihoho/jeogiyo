package com.jeogiyo.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jeogiyo.shop.dao.ShopDAO;
import com.jeogiyo.shop.vo.ShopVO;

@Service("shopService")
@Transactional(propagation = Propagation.REQUIRED)
// 진행 중인 트랜잭션이 있는 경우 해당 트랜잭션 사용
public class ShopServiceImpl implements ShopService {
	@Autowired
	ShopDAO shopDAO;

	@Override
	public List<ShopVO> searchShopListByCategoryAndLocation(String category, String bcode) {
		List shopList;
		if (category.equals("tot_ct")){
			shopList =shopDAO.selectShopListByLocation(bcode);
		}else{

		shopList= shopDAO.selectShopListByCategoryAndLocation(category,bcode);

		}
		return shopList;
	}



	@Override
	public ShopVO searchShopById(int shop_id) {
		ShopVO shopVO=shopDAO.selectShopById(shop_id);
		return shopVO;
	}

	@Override
	public List<ShopVO> searchShopListByMember(String memberId, String memberType) throws Exception {
		List shopList=shopDAO.selectShopListByMember(memberId,memberType);
		return shopList;
	}
}
