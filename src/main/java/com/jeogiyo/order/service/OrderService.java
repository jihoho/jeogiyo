package com.jeogiyo.order.service;

import com.jeogiyo.common.pagination.PageRequestDto;
import com.jeogiyo.common.pagination.Pagination;
import com.jeogiyo.member.dto.MemberInfoDto;
import com.jeogiyo.order.dao.OrderDAO;
import com.jeogiyo.order.dto.OrderListDto;
import com.jeogiyo.order.vo.OrderFoodVO;
import com.jeogiyo.order.vo.OrderVO;
import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED)
public class OrderService {
    @Autowired
    private OrderDAO orderDAO;

    public int addOrder(OrderVO orderVO) throws Exception{
        System.out.println("call orderService!!");
        orderDAO.insertOrder(orderVO);
        System.out.println("insert success!!");
        int order_id=orderDAO.selectCurrentOrderIdSequence();

        System.out.println("order id : "+order_id);
        return order_id;
    }
    public void addOrderFood(Map foodMap) throws Exception{
        orderDAO.insertOrderFood(foodMap);

    }

    public List<OrderVO> searchOrderListByMember(String memberId, String memberType) throws Exception{
        return orderDAO.selectOrderListByMember(memberId,memberType);
    }

    public OrderVO searchOrderById(String orderId) throws Exception{
        return orderDAO.selectOrderById(orderId);
    }

    public List<OrderFoodVO> searchOrderFoodByOrderId(String orderId)  throws Exception{
        return orderDAO.selectOrderFoodByOrderId(orderId);
    }

    public int searchOrderListCntByMember(String memberId, String memberType) throws Exception{
        return orderDAO.selectOrderListCntByMember(memberId,memberType);
    }

    public Pagination getPaginationOfOrdersByMember(HttpSession session,
            PageRequestDto pageRequestDto) {
        MemberInfoDto memberInfo = (MemberInfoDto) session.getAttribute("memberInfo");
        int totalListCount = orderDAO.selectOrderListCntByMember(
                memberInfo.getMemberId(), memberInfo.getMemberType());
        return Pagination.createPagination(pageRequestDto, totalListCount);
    }

    public List<OrderListDto> getOrdersBySessionMemberAndPage(HttpSession session,
            Pagination pagination) {
        MemberInfoDto memberInfo = (MemberInfoDto) session.getAttribute("memberInfo");
        HashMap<String, Object> params = new HashMap<>();
        params.put("memberId", memberInfo.getMemberId());
        params.put("memberType", memberInfo.getMemberType());
        params.put("startList", pagination.getStartList() + 1);
        params.put("endList", pagination.getEndList() + 1);
        return orderDAO.selectOrderListByMemberAndPage(params);
    }
}
