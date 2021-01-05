package com.jeogiyo.order.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Data
public class OrderFoodVO {
    private int orderId;
    private int foodId;
    private int foodQty;
    private String foodName;
    private int foodPrice;
}
