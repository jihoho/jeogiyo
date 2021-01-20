
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<div style="width: 80%">

    <input type="hidden" id="memberId" value="${memberInfo.member_id}"/>
    <input type="hidden" id="memberType" value="${memberInfo.member_type}"/>
    <div class="mypage-header">
        <span class="header_txt">찜한 가게</span>
    </div>

    <div class="mypage-body" id="favorite-shop-list">

    </div>
</div>