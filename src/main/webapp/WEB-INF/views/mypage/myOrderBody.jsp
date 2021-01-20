
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<div style="width: 80%">
    <div class="mypage-header">
        <span class="header_txt">주문 내역</span>
    </div>
    <input type="hidden" id="memberId" value="${memberInfo.member_id}"/>
    <input type="hidden" id="memberType" value="${memberInfo.member_type}"/>

    <div class="mypage-body" id="my-order-list">
        <div class="myorder">
            <div class="myorder-info">
                <div>
                    <span>2020/12/24</span>
                </div>
                <div>
                    <span>
                        네네치킨 수지 2지구점
                    </span>
                </div>
                <div>
                    양념치킨 1개 15000원
                </div>
            </div>
            <div class="myorder-butt-list" >
                <button>리뷰 쓰기</button>
                <button>가게 보기</button>
                <button>주문 상세</button>
            </div>
        </div>
    </div>

    <div>

    </div>
</div>