package com.jeogiyo.review.service;

import com.jeogiyo.review.dao.ReviewDAO;
import com.jeogiyo.review.vo.ReviewImageVO;
import com.jeogiyo.review.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
    @Autowired
    ReviewDAO reviewDAO;

    @Override
    public List<ReviewVO> searchReviewByShopId(int shop_id) throws Exception {

        return reviewDAO.selectReviewById(shop_id);
    }

    public List<ReviewImageVO> searchReviewImageByReviewId(int review_id) throws Exception{
       return reviewDAO.selectReviewImageByReviewId(review_id);
    }


}
