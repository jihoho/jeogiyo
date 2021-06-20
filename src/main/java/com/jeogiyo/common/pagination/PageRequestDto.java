package com.jeogiyo.common.pagination;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by IntelliJ IDEA
 * User: hojun
 * Date: 2021-06-20 Time: 오후 6:29
 */
@Getter
@Setter
public class PageRequestDto {

    int page = 1;
    int range = 1;
    int listSize = 5;
    int rangeSize = 10;

}
