package com.jeogiyo.mypage.controller;

import com.jeogiyo.common.annotation.LoginMember;
import com.jeogiyo.common.base.BaseController;
import com.jeogiyo.common.pagination.PageRequestDto;
import com.jeogiyo.common.pagination.Pagination;
import com.jeogiyo.member.dto.SessionMember;
import com.jeogiyo.member.service.MemberService;
import com.jeogiyo.order.dto.OrderListDto;
import com.jeogiyo.order.service.OrderService;
import com.jeogiyo.review.service.ReviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class MyPageController extends BaseController {

    private final MemberService memberService;
    private final OrderService orderService;
    private final ReviewService reviewService;

    @GetMapping("/mypage")
    public String myInfo() {
        return "/mypage/info";
    }

    @GetMapping("/mypage/orders")
    public String getOrdersByMember(PageRequestDto pageRequestDto,
            @LoginMember SessionMember member, Model model) throws Exception {

        Pagination pagination = orderService.getPaginationOfOrdersByMember(member, pageRequestDto);
        List<OrderListDto> orders = orderService
                .getOrdersBySessionMemberAndPage(member, pagination);
        model.addAttribute("pagination", pagination);
        model.addAttribute("orderList", orders);

        return "/mypage/order";
    }

    @GetMapping({"/reviews", "/reviews/{page}/{range}"})
    public ModelAndView myReview(@PathVariable("page") Optional<Integer> page,
            @PathVariable("range") Optional<Integer> range,
            HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView();
 /*       HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");

        String memberId = memberVO.getId();
        String memberType = memberVO.getType();
        String viewName = "/mypage/review";
        mav.setViewName(viewName);
        int pageNum = page.isPresent() ? page.get() : 1;
        int rangeNum = range.isPresent() ? range.get() : 1;
        int listCnt = reviewService.searchReviewListCntByMember(memberId, memberType);

        Pagination pagination = new Pagination();
        pagination.pageInfo(pageNum, rangeNum, listCnt);
        int startList = pagination.getStartList() + 1;
        int endList = pagination.getEndList() + 1;

        Map<String, Object> memberAndPage = new HashMap<>();
        memberAndPage.put("memberId", memberId);
        memberAndPage.put("memberType", memberType);
        memberAndPage.put("startList", pagination.getStartList());
        memberAndPage.put("endList", pagination.getEndList());

        List<ReviewVO> reviewList = reviewService.searchReviewListByMemberAndPage(memberAndPage);
        System.out.println(reviewList);
        mav.addObject("pagination", pagination);
        mav.addObject("reviewList", reviewList);
*/
        return mav;
    }
}
