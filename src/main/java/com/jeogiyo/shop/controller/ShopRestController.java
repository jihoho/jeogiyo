package com.jeogiyo.shop.controller;

import com.jeogiyo.dibs.service.DibsService;
import com.jeogiyo.shop.service.ShopService;
import com.jeogiyo.shop.vo.ShopVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController("shopRestController")
public class ShopRestController {

    @Autowired
    ShopService shopService;

    @Autowired
    ShopVO shopVO;

    @GetMapping(value = "/shops/favorite/{memberId}/{memberType}")
    public ResponseEntity getFavoriteShopListByMember(@PathVariable("memberId") String memberId,
                                                  @PathVariable("memberType") String memberType) throws Exception{
        ResponseEntity resEntity=null;
        System.out.println("shopRestController memberId: "+memberId+"memberType: "+memberType);
        List<ShopVO> shops=
                shopService.searchShopListByMember(memberId,memberType);
        System.out.println(shops);
        resEntity=new ResponseEntity(shops, HttpStatus.OK);
        return resEntity;
    }
}
