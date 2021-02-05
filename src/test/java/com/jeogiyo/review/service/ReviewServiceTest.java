package com.jeogiyo.review.service;

import com.jeogiyo.member.dao.MemberDAO;
import com.jeogiyo.member.service.MemberService;
import com.jeogiyo.member.vo.MemberVO;
import com.jeogiyo.review.dao.ReviewDAO;
import com.jeogiyo.review.vo.ReviewVO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.Date;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class ReviewServiceTest {
    @InjectMocks
    ReviewService reviewService;
    @Mock
    ReviewDAO reviewDAO;

    @Test
    @DisplayName("리뷰 생성 테스트")
    void addNewReview() throws Exception {
        // given
        ReviewVO reviewVO = createNewReview();
        int fakeReviewId = 1;
        MemberVO memberVO =createNewMember();

        // when
        when(reviewDAO.selectReviewById(fakeReviewId)).thenReturn(reviewVO);

        // then
        ReviewVO findReview=reviewDAO.selectReviewById(fakeReviewId);

        assertEquals(reviewVO,findReview);

    }

    private MemberVO createNewMember() {
        MemberVO memberVO=new MemberVO();
        memberVO.setMember_id("jihoho@email.com");
        memberVO.setMember_pw("1234");
        memberVO.setMember_type("NORMAL");
        memberVO.setNick_name("jihoho");
        memberVO.setHp("01012341234");
        return memberVO;
    }

    private ReviewVO createNewReview() {
        ReviewVO reviewVO = new ReviewVO();
        reviewVO.setShopId(401);
        reviewVO.setShopName("네네치킨-수지2지구점");
        reviewVO.setStarPoint(4.5);
        reviewVO.setContent("배송도 빠르고 맛있습니다.");
        reviewVO.setMemberId("jihoho@email.com");
        reviewVO.setMemberType("NORMAL");
        reviewVO.setOrderId(5);
        return reviewVO;
    }

}