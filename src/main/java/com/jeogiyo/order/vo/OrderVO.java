package com.jeogiyo.order.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;


@Data
@Component("orderVO")
public class OrderVO {
    int order_id;
    String imp_uid;
    String pg;
    int shop_id;
    String shop_name;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    Date reg_date;
    String orderer_id;
    String orderer_type;
    String orderer_name;
    String orderer_tel;
    String jibeon_address;
    String road_address;
    String detail_address;
    int order_price;
    int delivery_tip;
    int total_price;
    String order_requests;
    String pay_method;
    String order_status;
}
