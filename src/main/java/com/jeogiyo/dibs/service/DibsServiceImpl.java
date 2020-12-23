package com.jeogiyo.dibs.service;

import com.jeogiyo.dibs.dao.DibsDAO;
import com.jeogiyo.dibs.vo.DibsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class DibsServiceImpl implements DibsService{
    @Autowired
    private DibsDAO dibsDAO;

    @Override
    public String isDibsOn(DibsVO dibsVO) throws Exception {
        String result=dibsDAO.selectIsDibsOn(dibsVO);

        return result;
    }

    @Override
    public void addDibs(DibsVO dibsVO) throws Exception {
        dibsDAO.insertDibs(dibsVO);
        dibsDAO.shopDibsCntIncrease(dibsVO.getShop_id());
    }

    @Override
    public void deleteDibs(DibsVO dibsVO) {
        dibsDAO.deleteDibs(dibsVO);
        dibsDAO.shopDibsCntDecrease(dibsVO.getShop_id());
    }
}
