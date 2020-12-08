<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%>
<style>
    #login_sect{
		text-align : center;
    }
    #login_sect a img{
        width : 250px;
        height : 150px;
        margin-top: 200px;
    }

    #login_sect .login_input{
        margin-top : 30px;
    }

    #login_sect .login_input input{
        width: 500px;
        height: 70px;
        font-size: 36px;
    }

    #login_butt{
        background-color: #046D22;
        color: #FFFFFF;
    }

    #login_sect hr{
        margin-top: 50px;
        border-top: 2px dashed black;
        width: 500px;
    }

    #login_sect #sub_link a{
        color:black;
        text-decoration:none;
    }
    #login_sect #sub_link span{
        width:160px;
        font-weight: bold;
        font-size: 24px;
        text-align: center;
    }

</style>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>로그인창</title>
<c:choose>
	<c:when test="${result=='loginFailed' }">
	  <script>
	    window.onload=function(){
	      alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
	    }
	  </script>
	</c:when>
</c:choose>  
</head>

<body>
    <section id="login_sect">
        <div>
            <a href="${contextPath}/main/main.do">
                <img src="${contextPath}/image/login_logo.png"/>
            </a>
        </div>
        <div>
            <form name="frmLogin" method="post"  action="${contextPath}/member/login.do">
                <div class="login_input">
                    <input type="text" name="member_id" placeholder="아이디" size="20">
                </div>
                <div class="login_input">
                    <input type="password" name="member_pw" placeholder="비밀번호" size="20">
                </div>
                <div class="login_input" >
                    <input type="submit" id="login_butt" value="로그인" >
                </div>
            </form>
        </div>
        <div>
            <hr/>
        </div>
        <div id= "sub_link">
            <a href="${contextPath}/member/findMemberId.do">
                <span>
                    아이디 찾기
                </span>
            </a>
            |
            <a href="${contextPath}/member/findMemberPw.do">
                <span>
                    비밀번호 찾기
                </span>
            </a>
            |
            <a href="${contextPath}/member/memberForm.do">
                <span>
                    회원가입
                <span>
            </a>
        </div>
    </section>
</body>
</html>
