package com.jeogiyo.mypage.controller;

import com.jeogiyo.common.base.BaseController;
import com.jeogiyo.common.util.Pagination;
import com.jeogiyo.member.vo.MemberVO;
import com.jeogiyo.order.service.OrderService;
import com.jeogiyo.order.vo.OrderVO;
import com.jeogiyo.review.service.ReviewService;
import com.jeogiyo.review.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller("myPageController")
@RequestMapping("/mypage")
public class MyPageController extends BaseController {
    @Autowired
    OrderService orderService;

    @Autowired
    ReviewService reviewService;

    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public ModelAndView myInfo(HttpServletRequest request) throws Exception{
        ModelAndView mav=new ModelAndView();
        String viewName=(String)request.getAttribute("viewName");
        mav.setViewName(viewName);
        return mav;
    }


    @GetMapping({"/order","/order/{page}/{range}"})
    public ModelAndView myOrder(@PathVariable("page") Optional<Integer> page,
                                @PathVariable("range") Optional<Integer> range,
                                HttpServletRequest request) throws Exception{
        ModelAndView mav=new ModelAndView();
        HttpSession session=request.getSession();
        MemberVO memberVO=(MemberVO) session.getAttribute("memberInfo");
        String memberId=memberVO.getMember_id();
        String memberType=memberVO.getMember_type();
        String viewName="/mypage/order";
        mav.setViewName(viewName);
        int pageNum=page.isPresent()? page.get():1;
        int rangeNum=range.isPresent()? range.get():1;
        int listCnt=orderService.searchOrderListCntByMember(memberId,memberType);

        System.out.println("/mypage/order page:"+pageNum+", range:"+rangeNum+", listCnt:"+listCnt);
        Pagination pagination=new Pagination();
        pagination.pageInfo(pageNum,rangeNum,listCnt);
        int startList=pagination.getStartList()+1;
        int endList= pagination.getEndList()+1;
        System.out.println("startList: "+startList+"endList: "+endList);
        Map<String,Object> memberAndPage=new HashMap<>();
        memberAndPage.put("memberId",memberId);
        memberAndPage.put("memberType",memberType);
        memberAndPage.put("startList",pagination.getStartList());
        memberAndPage.put("endList",pagination.getEndList());

        List<OrderVO> orderList=orderService.searchOrderListByMemberAndPage(memberAndPage);
        System.out.println(orderList.size());
        mav.addObject("pagination",pagination);
        mav.addObject("orderList",orderList);

        return mav;
    }

    @GetMapping({"/reviews","/reviews/{page}/{range}"})
    public ModelAndView myReview(@PathVariable("page")Optional<Integer> page,
                                 @PathVariable("range")Optional<Integer> range,
                                 HttpServletRequest request)throws Exception{
        ModelAndView mav=new ModelAndView();
        HttpSession session=request.getSession();
        MemberVO memberVO=(MemberVO) session.getAttribute("memberInfo");

        String memberId=memberVO.getMember_id();
        String memberType=memberVO.getMember_type();
        String viewName="/mypage/review";
        mav.setViewName(viewName);
        int pageNum=page.isPresent()? page.get():1;
        int rangeNum=range.isPresent()? range.get():1;
        int listCnt=reviewService.searchReviewListCntByMember(memberId,memberType);


        Pagination pagination=new Pagination();
        pagination.pageInfo(pageNum,rangeNum,listCnt);
        int startList=pagination.getStartList()+1;
        int endList= pagination.getEndList()+1;

        Map<String,Object> memberAndPage=new HashMap<>();
        memberAndPage.put("memberId",memberId);
        memberAndPage.put("memberType",memberType);
        memberAndPage.put("startList",pagination.getStartList());
        memberAndPage.put("endList",pagination.getEndList());

        List<ReviewVO> reviewList=reviewService.searchReviewListByMemberAndPage(memberAndPage);
        System.out.println(reviewList);
        mav.addObject("pagination",pagination);
        mav.addObject("reviewList",reviewList);

        return mav;
    }
}
