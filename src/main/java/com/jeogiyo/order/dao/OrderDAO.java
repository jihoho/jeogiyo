package com.jeogiyo.order.dao;

import com.jeogiyo.order.vo.OrderVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import java.util.Map;

@Mapper
public interface OrderDAO {
    public void insertOrder(OrderVO orderVO) throws DataAccessException;

    public int selectCurrentOrderIdSequence() throws DataAccessException;
    public int insertOrderFood(Map foodMap) throws DataAccessException;
}
