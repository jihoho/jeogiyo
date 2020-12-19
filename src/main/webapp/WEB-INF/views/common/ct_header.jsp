<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
    request.setCharacterEncoding("UTF-8");
    ServletContext context=request.getServletContext();
    List categoryList= (ArrayList)context.getAttribute("categoryList");
%>
<style>
    #ct_menu{
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        height: 60px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #ct_menu span{
        padding: 15px;
        text-align: center;
        font-family: Roboto;
        font-style: normal;
        font-weight: normal;
        font-size: 24px;
        line-height: 28px;
        text-decoration-line: underline;
    }

    #ct_menu a{
        color: black;
    }

</style>
<script>
    function menu_check(){
        var menu=getParameter("category");
        var el= document.getElementById(menu);
        if(el!=null)
            el.style.color='blue';
    }
    function getParameter(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
</script>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>header</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="${contextPath}/lib/bootstrap-5.0.0-beta1-dist/css/bootstrap.css" rel="stylesheet" >
<script src="${contextPath}/lib/bootstrap-5.0.0-beta1-dist/js/bootstrap.js" type="text/javascript"></script>
<script src="${contextPath}/lib/bootstrap-5.0.0-beta1-dist/js/bootstrap.bundle.js" type="text/javascript"></script>

</head>
<body onload="menu_check();">
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
          </div>
        </nav>

        <div id="ct_menu">
            <%
                for(int i=0;i<categoryList.size();i++){
                    Map category=(Map)categoryList.get(i);
            %><a id=<%=category.get("name")%> href="${contextPath}/shop/listShop.do?category=<%=category.get("name")%>">
            <span><%=category.get("ko_name") %></span>
        </a><%
            }
        %>
        </div>
	


</body>
</html>