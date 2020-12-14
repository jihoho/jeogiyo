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
<title>header</title>
<link href="${contextPath}/lib/bootstrap-5.0.0-beta1-dist/css/bootstrap.css" rel="stylesheet" >
<script src="${contextPath}/lib/bootstrap-5.0.0-beta1-dist/js/bootstrap.js" type="text/javascripta"></script>

</head>
<body>	
	    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-image: url('/image/header_img.png'); height: 250px; width: 100%;" >
          <div class="container-fluid">
			<a class="navbar-brand" href="${contextPath}/main/main.do"><img src="${contextPath}/image/logo.png"></a>
			
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
             
				<div style="margin-left: auto!important;margin-right: auto!important;">
					<img src="${contextPath}/image/header_txt.png">
				</div>

				<ul class="navbar-nav me-auto mb-2 mb-lg-0" style="margin-right: 15px;" >
                    <c:choose>
                    <c:when test="${isLogOn==true}">
                        <li class="nav-item"><a class="nav-link active" href="${contextPath}/member/logout.do"><span style="font-weight: 900; color: #046D22; ">로그아웃</span></a></li>
                        <li class="nav-item"><a class="nav-link active" href="${contextPath}/member/mypage.do"><span style="font-weight: 900; color: #046D22; ">마이페이지</span></a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item"><a class="nav-link active" href="${contextPath}/member/loginForm.do"><span style="font-weight: 900; color: #046D22; ">로그인</span></a></li>
                        <li class="nav-item"><a class="nav-link active" href="${contextPath}/member/memberForm.do"><span style="font-weight: 900; color: #046D22; ">회원가입</span></a></li>
                    </c:otherwise>
                </c:choose>
				</ul>

				<div>
					<form class="d-flex">
						<input class="form-control me-2" type="search" placeholder="search dong address" aria-label="Search">
						<button class="btn btn-success" type="submit">Search</button>
					</form>
				</div>
            </div>
        </nav>

	


</body>
</html>