package com.jeogiyo.review.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;

@Data
@Component("reviewImageVO")
public class ReviewImageVO {
    private int review_image_id;
    private int review_id;
    private String file_name;
    private Date reg_date;
}
