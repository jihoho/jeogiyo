package com.jeogiyo.order.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import lombok.Getter;
import lombok.Setter;

/**
 * Created by IntelliJ IDEA
 * User: hojun
 * Date: 2021-06-20 Time: 오후 7:23
 */
@Getter
@Setter
public class OrderListDto {

    int orderId;
    int shopId;
    String shopName;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    Date regDate;
    int totalPrice;
    String orderContent;
}
