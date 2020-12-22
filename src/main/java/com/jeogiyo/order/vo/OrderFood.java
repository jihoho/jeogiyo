package com.jeogiyo.order.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class OrderFood {
    private String food_id;
    private int food_qty;
    private List<OrderFood> orderFoodList;
}
