package com.jeogiyo.review.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;

@Data
@Component("reviewVO")
public class ReviewVO {
    private int shop_id;
    private double star_point;
    private String content;
    private Date reg_date;
    private String member_id;
    private String member_type;
}
