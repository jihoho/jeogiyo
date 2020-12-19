package com.jeogiyo.food.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@Component("foodVO")
public class FoodVO {
    int food_id;
    String food_name;
    String food_desc;
    int food_price;
    String image_file;
    Date reg_date;
    int shop_id;
}
