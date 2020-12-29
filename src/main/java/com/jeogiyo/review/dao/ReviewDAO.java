package com.jeogiyo.review.dao;

import com.jeogiyo.review.vo.ReviewImageVO;
import com.jeogiyo.review.vo.ReviewVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import java.util.List;
@Mapper
public interface ReviewDAO {

    public List<ReviewVO> selectReviewById(int shop_id) throws DataAccessException;

    public List<ReviewImageVO> selectReviewImageByReviewId(int review_id) throws DataAccessException;
}
