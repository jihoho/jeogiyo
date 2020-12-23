package com.jeogiyo.dibs.controller;

import com.jeogiyo.dibs.service.DibsService;
import com.jeogiyo.dibs.vo.DibsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@RestController
public class DibsControllerImpl implements  DibsController{
    @Autowired
    private DibsService dibsService;

    @Autowired
    private DibsVO dibsVO;

    @Override
    @GetMapping("/dibs")
    public ResponseEntity isDibsOn(@RequestParam String shop_id, @RequestParam String member_id,@RequestParam String member_type) throws Exception {
        ResponseEntity resEntity=null;
        DibsVO dibsVO=new DibsVO();
        dibsVO.setMember_id(member_id);
        dibsVO.setShop_id(shop_id);
        dibsVO.setMember_type(member_type);
        String result=dibsService.isDibsOn(dibsVO);
        System.out.println("member_id: "+member_id+", shop_id: "+shop_id +", member_type: "+member_type+", result: "+result);
        resEntity = new ResponseEntity(result, HttpStatus.OK);
        return resEntity;
    }

    @PostMapping("/dibs")
    public ResponseEntity addDibs(@RequestParam String shop_id, @RequestParam String member_id,@RequestParam String member_type) throws Exception{
        ResponseEntity resEntity=null;
        DibsVO dibsVO=new DibsVO();
        dibsVO.setMember_id(member_id);
        dibsVO.setShop_id(shop_id);
        dibsVO.setMember_type(member_type);

        try {
            dibsService.addDibs(dibsVO);
            System.out.println("member_id: "+member_id+", shop_id: "+shop_id +", member_type: "+member_type);
            resEntity = new ResponseEntity("Success", HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            resEntity = new ResponseEntity("fail", HttpStatus.OK);
        }
        return resEntity;
    }

    @DeleteMapping("/dibs")
    public ResponseEntity deleteDibs(@RequestParam String shop_id, @RequestParam String member_id,@RequestParam String member_type) throws Exception{
        ResponseEntity resEntity=null;
        DibsVO dibsVO=new DibsVO();
        dibsVO.setMember_id(member_id);
        dibsVO.setShop_id(shop_id);
        dibsVO.setMember_type(member_type);

        try {
            dibsService.deleteDibs(dibsVO);
            System.out.println("member_id: "+member_id+", shop_id: "+shop_id +", member_type: "+member_type);
            resEntity = new ResponseEntity("Success", HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            resEntity = new ResponseEntity("fail", HttpStatus.OK);
        }
        return resEntity;
    }
}
