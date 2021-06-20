package com.jeogiyo.order.dao;

import com.jeogiyo.order.dto.OrderListDto;
import com.jeogiyo.order.vo.OrderFoodVO;
import com.jeogiyo.order.vo.OrderVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;
import java.util.Map;

@Mapper
public interface OrderDAO {

    List<OrderVO> selectOrderListByMember(String memberId, String memberType)
            throws DataAccessException;

    void insertOrder(OrderVO orderVO) throws DataAccessException;

    int selectCurrentOrderIdSequence() throws DataAccessException;

    int insertOrderFood(Map foodMap) throws DataAccessException;

    OrderVO selectOrderById(String orderId) throws DataAccessException;

    List<OrderFoodVO> selectOrderFoodByOrderId(String orderId) throws DataAccessException;

    int selectOrderListCntByMember(@Param("memberId") String memberId,
            @Param("memberType") String memberType) throws DataAccessException;

    List<OrderListDto> selectOrderListByMemberAndPage(Map params) throws DataAccessException;
}
