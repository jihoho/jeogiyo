
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<div style="width: 80%">
    <div class="mypage-header">
        <span class="header_txt">주문 내역</span>
    </div>
    <input type="hidden" id="memberId" value="${memberInfo.memberId}"/>
    <input type="hidden" id="memberType" value="${memberInfo.memberType}"/>

    <div class="mypage-body" id="my-order-list">
        <c:forEach var="order" items="${orderList}">
            <div class="myorder">
                <div class="myorder-info">
                    <div><span>${order.regDate}</span></div>
                    <div><span>${order.shopName}</span></div>
                    <div><span>${order.orderContent}</span></div>
                    <div><span>총 주문 금액:</span><span>${order.totalPrice}</span></div>
                </div>
                <div class="myorder-butt-list">
                    <input type="hidden" class="shop_id" name="shop_id" value="${order.shopId}"/>
                    <input type="hidden" class="order_id" name="order_id" value="${order.orderId}"/>
                    <input type="hidden" class="shop_name" name="shop_name" value="${order.shopName}"/>
                    <input type="hidden" class="order_content" name="order_content" value="${order.orderContent}"/>
                    <button type="button" class="write-review-butt">리뷰 쓰기</button>
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

                <li class="page-item ${pagination.page == idx ? 'active' : ''}"><a class="page-link" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">${idx}</a></li>
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