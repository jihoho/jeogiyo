package com.jeogiyo.order.service;

import com.jeogiyo.order.dao.OrderDAO;
import com.jeogiyo.order.vo.OrderFoodVO;
import com.jeogiyo.order.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED)
public class OrderService {
    @Autowired
    private OrderDAO orderDAO;

    public int addOrder(OrderVO orderVO) throws Exception{
        System.out.println("call orderService!!");
        orderDAO.insertOrder(orderVO);
        System.out.println("insert success!!");
        int order_id=orderDAO.selectCurrentOrderIdSequence();

        System.out.println("order id : "+order_id);
        return order_id;
    }
    public void addOrderFood(Map foodMap) throws Exception{
        orderDAO.insertOrderFood(foodMap);

    }

    public List<OrderVO> searchOrderListByMember(String memberId, String memberType) throws Exception{
        return orderDAO.selectOrderListByMember(memberId,memberType);
    }

    public OrderVO searchOrderById(String orderId) throws Exception{
        return orderDAO.selectOrderById(orderId);
    }

    public List<OrderFoodVO> searchOrderFoodByOrderId(String orderId)  throws Exception{
        return orderDAO.selectOrderFoodByOrderId(orderId);
    }

    public int searchOrderListCntByMember(String memberId, String memberType) throws Exception{
        return orderDAO.selectOrderListCntByMember(memberId,memberType);
    }

    public List<OrderVO> searchOrderListByMemberAndPage(Map memberAndPage) throws Exception{
        return orderDAO.selectOrderListByMemberAndPage(memberAndPage);
    }

}
