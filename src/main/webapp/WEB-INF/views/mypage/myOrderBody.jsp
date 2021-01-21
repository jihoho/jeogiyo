
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<div style="width: 80%">
    <div class="mypage-header">
        <span class="header_txt">주문 내역</span>
    </div>
    <input type="hidden" id="memberId" value="${memberInfo.member_id}"/>
    <input type="hidden" id="memberType" value="${memberInfo.member_type}"/>

    <div class="mypage-body" id="my-order-list">
        <c:forEach var="order" items="${orderList}">
            <div class="myorder">
                <div class="myorder-info">
                    <div><span>${order.reg_date}</span></div>
                    <div><span>${order.shop_name}</span></div>
                    <div><span>총 주문 금액:</span><span>${order.total_price}</span></div>
                </div>
                <div class="myorder-butt-list">
                    <input type="hidden" class="shop_id" name="shop_id" value="${order.shop_id}"/>
                    <input type="hidden" class="order_id" name="order_id" value="${order.order_id}"/>
                    <button>리뷰 쓰기</button>
                    <button type="button" class="shop-detail-butt">가게 보기</button>
                    <button type="button" class="order-detail-butt">주문 상세</button>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- pagination{s} -->

    <div id="paginationBox">

        <ul class="pagination">

            <c:if test="${pagination.prev}">

                <li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>

            </c:if>



            <c:forEach var="idx" begin='${pagination.startPage}' end='${pagination.endPage}'>

                <li class="page-item ${pagination.page == idx ? 'active' : ''}"><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">${idx}</a></li>
            </c:forEach>



            <c:if test="${pagination.next}">

                <li class="page-item">
                    <a class="page-link" href="#"
                       onClick="fn_next('${pagination.page}','${pagination.range}', '${pagination.rangeSize}')" >
                        Next
                    </a>
                </li>

            </c:if>

        </ul>

    </div>

    <!-- pagination{e} -->

</div>