<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>footer</title>
  <style>
    p {
     font-size:20px;
      text-align:center;
    }
  </style>
</head>
<body>
	<div>
		<div id="logo">
			<img src="${contextPath}/image/mini_logo.png">
		</div>
		<div id="company_info">
			<h3>HJ 딜리버리 코리아</h3>
			대표이사: 지호준
            주소: 경기도 용인시 수지구 풍덕천로 111 7층
            사업자 등록 번호: 111-11-11111
            서울특별시 통신판매업신고번호 : 제 666호 ▶사업자정보확인 개인정보보호최고책임자 : 김길동 privacy@google.co.kr
            대표 전화: 1212-1212(발신자 부담전화 팩스: 0502-11-11(지역번호 공통
            COPYRIGHT(C) 북토피아 BOOK CENTRE ALL RIGHTS RESERVED.<br>
		</div>
	</div>
</body>
</html>