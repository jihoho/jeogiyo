package com.jeogiyo.dibs.dao;

import com.jeogiyo.dibs.vo.DibsVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import java.util.Map;

@Mapper
public interface DibsDAO {

    public String selectIsDibsOn(DibsVO dibsVO) throws DataAccessException;

    public void insertDibs(DibsVO dibsVO) throws DataAccessException;
    public void shopDibsCntIncrease(String shop_id )throws DataAccessException;
    public void deleteDibs(DibsVO dibsVO) throws DataAccessException;
    public void shopDibsCntDecrease(String shop_id) throws DataAccessException;

}
