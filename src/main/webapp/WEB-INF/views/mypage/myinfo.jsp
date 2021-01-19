<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%
 	request.setCharacterEncoding("UTF-8");

%> 


<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${contextPath}/css/myinfo.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<li><a id="myInfoMenu" onclick="sideMenuClick(this.id);">나의 정보</a></li>
					<li><a id="myOrderMenu" onclick="sideMenuClick(this.id);">주문 내역</a></li>
					<li><a id="myFavoriteShopMenu" onclick="sideMenuClick(this.id);">찜한 가게</a></li>
					<li><a id="myReviewMenu" onclick="sideMenuClick(this.id);">리뷰 관리</a></li>
				</ul>
				<br>
			</div>

			<div id="myInfoMenuSect" class="col-9 py-md-3 pl-md-5 bd-content mypage-sect" >
				<jsp:include page="myInfoBody.jsp" flush="false"/>
			</div>


			<div id="myOrderMenuSect" class="col-9 py-md-3 pl-md-5 bd-content mypage-sect" style="display: none;">
				<jsp:include page="myOrderBody.jsp" flush="false"/>
			</div>

			<div id="myFavoriteShopMenuSect" class="col-9 py-md-3 pl-md-5 bd-content mypage-sect" style="display: none;">
				<jsp:include page="myFaboriteShopBody.jsp" flush="false"/>
			</div>

			<div id="myReviewMenuSect" class="col-9 py-md-3 pl-md-5 bd-content mypage-sect" style="display: none;">
				<h1>리뷰 관리</h1>
			</div>

		</div>
	</div>

	<jsp:include page="changePassModal.jsp" flush="false"/>
	<jsp:include page="changeHpModal.jsp" flush="false"/>
	<jsp:include page="orderDetailModal.jsp" flush="false"/>

</body>
</html>
<script src="${contextPath}/js/myinfo.js"></script>