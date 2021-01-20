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
<script src="${contextPath}/lib/bootstrap-5.0.0-beta1-dist/js/bootstrap.js" type="text/javascript"></script>



</head>
<body onload="headerInit();">
	    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-image: url('/image/header_img.png'); height: 250px; width: 100%;" >
          <div class="container-fluid">
			<a class="navbar-brand" href="${contextPath}/main/main"><img src="${contextPath}/image/logo.png"></a>
			
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
                        <li class="nav-item"><a class="nav-link active" href="${contextPath}/members/logout"><span style="font-weight: 900; color: #046D22; ">로그아웃</span></a></li>
                        <li class="nav-item"><a class="nav-link active" href="${contextPath}/mypage/info"><span style="font-weight: 900; color: #046D22; ">마이페이지</span></a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item"><a class="nav-link active" href="${contextPath}/members/loginForm"><span style="font-weight: 900; color: #046D22; ">로그인</span></a></li>
                        <li class="nav-item"><a class="nav-link active" href="${contextPath}/members/memberForm"><span style="font-weight: 900; color: #046D22; ">회원가입</span></a></li>
                    </c:otherwise>
                </c:choose>
				</ul>

				<div>
					<form class="d-flex">
						<input type="text" placeholder="search dong address" id="location" readonly>
						<button type="button" onclick="execDaumPostcode()">Search</button>
					</form>
				</div>
            </div>
          </div>
        </nav>

        <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            function headerInit(){

                var locText=document.getElementById("location");
                var roadAddr="${roadAddr}";
                var jibunAddr="${jibunAddr}";
                var bcode="${bcode}";
                locText.value=roadAddr;
                console.log(roadAddr+","+jibunAddr+","+bcode);
            }
            //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
            function execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var roadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ''; // 참고 항목 변수

                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraRoadAddr !== ''){
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }
                        console.log(roadAddr+","+extraRoadAddr+','+data.jibunAddress+',\n'+data.bnam1+','+data.bname2+','+data.bcode);
                        var locText=document.getElementById("location");
                        locText.value=roadAddr;
                        // sessionStorage.setItem("roadAddr",roadAddr);
                        // sessionStorage.setItem("jibunAddr",data.jibunAddress);
                        // sessionStorage.setItem("bcode",data.bcode);
                        var locObj=new Object();
                        locObj.roadAddr=roadAddr;
                        locObj.jibunAddr=data.jibunAddress;
                        locObj.bcode=data.bcode;
                        var jsonData=JSON.stringify(locObj);
                        console.log(jsonData);
                        $.ajax({
                            type:"post",
                            url:"/session/location",
                            contentType: "application/json; charset=UTF-8",
                            data: jsonData,
                            success:function (){
                                console.log("success save location data in session!");
                            },
                            error:function (){
                                console.log("fail save location data in session!");
                            }
                        })

                    }
                }).open();
            }
        </script>
</body>
</html>