package com.jeogiyo.dibs.vo;

import lombok.Data;
import org.springframework.stereotype.Repository;

import java.sql.Date;


@Data
@Repository
public class DibsVO {
    private String shop_id;
    private String member_id;
    private String member_type;
    private Date reg_date;
}
