package com.jeogiyo.review.service;

import com.jeogiyo.review.dao.ReviewDAO;
import com.jeogiyo.review.vo.ReviewImageVO;
import com.jeogiyo.review.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ReviewService {
    @Autowired
    ReviewDAO reviewDAO;

    public List<ReviewVO> searchReviewListByMemberAndPage(Map<String, Object> memberAndPage) throws Exception{
        return reviewDAO.selectReviewListByMemberAndPage(memberAndPage);
    }

    public int addNewReview(ReviewVO reviewVO) throws Exception{
        reviewDAO.insertReview(reviewVO);
        int reviewId= reviewVO.getReviewId();
        System.out.println("reviewService reviewId: "+reviewId);
        return reviewId;
    }

    public int addNewReviewImage(ReviewImageVO reviewImageVO) throws Exception{
        reviewDAO.insertReviewImage(reviewImageVO);
        int reviewImageId=reviewImageVO.getImageId();
        System.out.println("reviewService reviewImageId: "+reviewImageId);
        return reviewImageId;
    }

    public int searchReviewListCntByMember(String memberId, String memberType) throws Exception{
        return reviewDAO.selectReviewListCntByMember(memberId,memberType);
    }

    public ReviewVO searchReviewById(int reviewId) throws Exception{
        return reviewDAO.selectReviewById(reviewId);
    }

    public List<ReviewImageVO> searchReviewImageByReviewId(int reviewId)  throws Exception{
        return reviewDAO.selectReviewImageByReviewId(reviewId);
    }

    public void deleteReviewByReviewId(int reviewId)  throws Exception{
        reviewDAO.deleteReviewByReviewId(reviewId);
    }

    public void deleteReviewImagesByReviewId(int reviewId) {
        reviewDAO.deleteReviewImagesByReviewId(reviewId);
    }
}
