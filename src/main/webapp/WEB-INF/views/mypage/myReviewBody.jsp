
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<div style="width: 80%">
    <div class="mypage-header">
        <span class="header_txt">나의 리뷰</span>
    </div>
    <input type="hidden" id="memberId" value="${memberInfo.member_id}"/>
    <input type="hidden" id="memberType" value="${memberInfo.member_type}"/>

    <div class="mypage-body" id="my-review-list">
        <table class="table table-striped table-sm">

            <colgroup>

                <col style="width:5%;" />

                <col style="width:30%;" />

                <col style="width:auto;" />

                <col style="width:10%;" />

                <col style="width:15%;" />

                <col style="width:10%;" />

            </colgroup>

            <thead>

            <tr>

                <th>NO</th>

                <th>가게 이름</th>

                <th>주문 음식</th>

                <th>별점</th>

                <th>작성일</th>

                <th>상세 보기</th>

            </tr>

            </thead>

            <tbody>

            <c:choose>

                <c:when test="${empty reviewList }" >

                    <tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>

                </c:when>

                <c:when test="${!empty reviewList}">

                    <c:forEach var="review" items="${reviewList}">

                        <tr>

                            <td><c:out value="${review.rnum}"/></td>

                            <td><c:out value="${review.shopName}"/></td>

                            <td><c:out value="${review.orderContent}"/></td>

                            <td><c:out value="${review.starPoint}"/></td>

                            <td><c:out value="${review.regDate}"/></td>
                            <td>
                                <input class="review-id" type="hidden" value="${review.reviewId}">
                                <button type="button" class="btn btn-sm btn-primary review-detail-butt">상세 보기</button>
                            </td>

                        </tr>

                    </c:forEach>

                </c:when>

            </c:choose>

            </tbody>

        </table>
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