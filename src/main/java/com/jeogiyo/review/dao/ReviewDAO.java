package com.jeogiyo.review.dao;

import com.jeogiyo.member.vo.MemberVO;
import com.jeogiyo.review.vo.ReviewImageVO;
import com.jeogiyo.review.vo.ReviewVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import java.util.List;
import java.util.Map;

@Mapper
public interface ReviewDAO {

    public void insertReview(ReviewVO reviewVO) throws DataAccessException;

    public ReviewVO selectReviewById(int reviewId) throws DataAccessException;

    public void insertReviewImage(ReviewImageVO reviewImageVO) throws DataAccessException;


    public int selectReviewListCntByMember(String memberId, String memberType) throws DataAccessException;

    public List<ReviewVO> selectReviewListByMemberAndPage(Map<String, Object> memberAndPage) throws DataAccessException;

    public List<ReviewImageVO> selectReviewImageByReviewId(int reviewId) throws DataAccessException;

    public void deleteReviewByReviewId(int reviewId) throws DataAccessException;

    public void deleteReviewImagesByReviewId(int reviewId) throws DataAccessException;
}