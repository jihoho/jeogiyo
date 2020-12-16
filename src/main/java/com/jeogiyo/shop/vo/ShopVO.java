package com.jeogiyo.shop.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Component;


@Getter
@Setter
@ToString
@Component("shopVO")
public class ShopVO {
	private int shop_id;
	private String shop_name;
	private String road_address;
	private String jibeon_address;
	private String detail_address;
	private String zipcode;
	private String tel1;
	private String tel2;
	private String tel3;
	private String hp1;
	private String hp2;
	private String hp3;
	private int min_order_price;
	private int delivery_tip;
	private int delivery_min_time;
	private int delivery_max_time;
	private String shop_owner_id;
	private String shop_regis_number;
	private double star_avg;
	private int star_cnt;
	private int dib_cnt;
	private int review_cnt;
	private String shop_intro;
	private int open_time_h;
	private int open_time_m;
	private int close_time_h;
	private int close_time_m;
	private String image_file;

	
	
	
	
}
