package com.jeogiyo.review.dao;

import com.jeogiyo.review.vo.ReviewImageVO;
import com.jeogiyo.review.vo.ReviewVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import java.util.List;
@Mapper
public interface ReviewDAO {

    public void insertReview(ReviewVO reviewVO) throws DataAccessException;

    public int selectCurrentReviewIdSequence() throws DataAccessException;

    public void insertReviewImage(ReviewImageVO reviewImageVO) throws DataAccessException;

    public int selectCurrentReviewImageIdSequence() throws DataAccessException;
}