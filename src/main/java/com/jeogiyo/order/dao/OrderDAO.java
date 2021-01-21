package com.jeogiyo.order.dao;

import com.jeogiyo.order.vo.OrderFoodVO;
import com.jeogiyo.order.vo.OrderVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import java.util.List;
import java.util.Map;

@Mapper
public interface OrderDAO {
    public List<OrderVO> selectOrderListByMember(String memberId, String memberType) throws DataAccessException;

    public void insertOrder(OrderVO orderVO) throws DataAccessException;

    public int selectCurrentOrderIdSequence() throws DataAccessException;
    public int insertOrderFood(Map foodMap) throws DataAccessException;

    public OrderVO selectOrderById(String orderId) throws DataAccessException;

    public List<OrderFoodVO> selectOrderFoodByOrderId(String orderId) throws DataAccessException;

    public int selectOrderListCntByMember(String memberId, String memberType) throws DataAccessException;

    public List<OrderVO> selectOrderListByMemberAndPage(Map memberAndPage) throws DataAccessException;
}
