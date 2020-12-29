package com.jeogiyo.review.service;

import com.jeogiyo.review.vo.ReviewVO;

import java.util.List;

public interface ReviewService {
    public List<ReviewVO> searchReviewByShopId(int shop_id) throws Exception;
}
