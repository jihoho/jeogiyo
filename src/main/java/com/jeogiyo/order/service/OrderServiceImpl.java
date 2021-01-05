package com.jeogiyo.order.service;

import com.jeogiyo.order.dao.OrderDAO;
import com.jeogiyo.order.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService{
    @Autowired
    private OrderDAO orderDAO;

    @Override
    public int addOrder(OrderVO orderVO) throws Exception{
        System.out.println("call orderService!!");
        orderDAO.insertOrder(orderVO);
        System.out.println("insert success!!");
        int order_id=orderDAO.selectCurrentOrderIdSequence();

        System.out.println("order id : "+order_id);
        return order_id;
    }
    @Override
    public void addOrderFood(Map foodMap) throws Exception{
        orderDAO.insertOrderFood(foodMap);

    }
}
