package com.jeogiyo.order.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Data
public class OrderFormVO {
    private int shopId;
    private String shopName;
    private int deliveryTip;
    private String roadAddress;
    private String jibeonAddress;
    private List<OrderFoodVO> orderFoodList;
}
