package com.jeogiyo.review.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;

@Data
@Component("reviewVO")
public class ReviewVO {
    private int reviewId;
    private int shopId;
    private double starPoint;
    private String content;
    private Date regDate;
    private String memberId;
    private String memberType;
    private int orderId;
}
