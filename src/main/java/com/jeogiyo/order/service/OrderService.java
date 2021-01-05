package com.jeogiyo.order.service;

import com.jeogiyo.order.vo.OrderVO;

import java.util.Map;

public interface OrderService {
    public int addOrder(OrderVO orderVO) throws Exception;
    public void addOrderFood(Map foodMap) throws Exception;
}
