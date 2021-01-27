package com.jeogiyo.review.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;

@Data
@Component("reviewImageVO")
public class ReviewImageVO {
    private int imageId;
    private int reviewId;
    private String fileName;
    private Date regDate;
}
