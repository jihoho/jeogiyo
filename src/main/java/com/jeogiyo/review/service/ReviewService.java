package com.jeogiyo.review.service;

import com.jeogiyo.review.dao.ReviewDAO;
import com.jeogiyo.review.vo.ReviewImageVO;
import com.jeogiyo.review.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {
    @Autowired
    ReviewDAO reviewDAO;
    public int addNewReview(ReviewVO reviewVO) throws Exception{
        reviewDAO.insertReview(reviewVO);
        int reviewId=reviewDAO.selectCurrentReviewIdSequence();
        System.out.println("reviewService reviewId: "+reviewId);
        return reviewId;
    }

    public int addNewReviewImage(ReviewImageVO reviewImageVO) throws Exception{
        reviewDAO.insertReviewImage(reviewImageVO);
        int reviewImageId=reviewDAO.selectCurrentReviewImageIdSequence();
        System.out.println("reviewService reviewImageId: "+reviewImageId);
        return reviewImageId;
    }
}
