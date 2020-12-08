<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
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
<title>헤더</title>
</head>
<body>

	<div id="logo">
		<a href="${contextPath}/main/main.do">
			<img src="${contextPath}/image/logo.png">
		</a>
	</div>
	<div id="hd_center" >
		<div id="hd_txt">
			<img src="${contextPath}/image/header_txt.png">
		</div>
		<div id="search_sec">
			<input type="text" name="search_txt" id="search_txt" disabled="disabled"  value="건물명, 도로명, 지번으로 검색하세요." >
			<a id="search_btn" href="${contextPath}/main/main.do">
				<img src="${contextPath}/image/search_btn.png">
			</a>
		</div>
	</div>
	
	<div id="head_link">
		<ul>
			<c:choose>
				<c:when test="${isLogOn==true}">
					<li><a href="${contextPath}/member/logout.do"><span>로그아웃</span></a></li>
					<li><a href="${contextPath}/member/logout.do"><span>마이페이지</span></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${contextPath}/member/loginForm.do"><span>로그인</span></a></li>
					<li><a href="${contextPath}/member/memberForm.do"><span>회원가입</span></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>


</body>
</html>