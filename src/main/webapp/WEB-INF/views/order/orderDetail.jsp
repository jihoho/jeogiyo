<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%
 	request.setCharacterEncoding("UTF-8");
	ServletContext context=request.getServletContext();

%> 


<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<script>
	function paymentClick(){
		alert("payment click!!");
	}
</script>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${contextPath}/css/orderDetail.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
	<div class="container" >
		<div class="row" >
				<div class="col-sm-12 col-md-12 col-lg-8 order_form">
					<div id="order_info_title">
						<span>결제하기</span>
					</div>
					<div>
						<div class="order_info">
							<div class="order_info_header">
								<span>배달 정보</span>
							</div>
							<div class="order_info_body">
								<div><span class="info_txt_lg">용인시 수지구 풍덕천동 1112</span></div>
								<div><span class="info_txt_md">[도로명] 풍덕천로 52</span></div>
								<div>
									<div style="float: left;">
										<span>상세주소 </span>
									</div>
									<div>
										<input type="text" placeholder="상세 주소 입력해주세요."/>
									</div>
								</div>
								<div>
									<div style="float: left;">
										<span class="info_txt_md">01056254589</span>
									</div>
									<div>
										<button class="info_txt_md">
											변경
										</button>
									</div>
								</div>
							</div>
						</div>

						<div class="order_info">
							<div class="order_info_header">
								<span>요청 사항</span>
							</div>
							<div class="order_info_body">
								<div>
									<span class="info_txt_lg">가게 사장님께</span>
								</div>
								<div>
									<input id="order_requests" type="text" placeholder="예) 견과류 빼주세요, 덜 맵게 해주세요.">
								</div>
							</div>
						</div>

						<div class="order_info">
							<div class="order_info_header">
								<span>결제 수단</span>
							</div>
							<div class="order_info_body">
								<table>
									<tr>
										<td onclick="paymentClick()">
											<span class="info_txt_lg">카카오페이</span>
										</td>
										<td onclick="paymentClick()">
											<span class="info_txt_lg">KG Inicis</span>
										</td>
									</tr>
									<tr>
										<td onclick="paymentClick()">
											<span class="info_txt_lg">카카오페이</span>
										</td>
										<td onclick="paymentClick()">
											<span class="info_txt_lg">KG Inicis</span>
										</td>
									</tr>
									<tr>
										<td onclick="paymentClick()">
											<span class="info_txt_lg">카카오페이</span>
										</td>
										<td onclick="paymentClick()">
											<span class="info_txt_lg">KG Inicis</span>
										</td>
									</tr>
								</table>
							</div>
						</div>

					</div>

				</div>

				<div class="col-sm-4 d-none d-lg-block"  style="">
					<div id="order_sect">
						<div id="order_header">
							<span>주문표</span>
						</div>
						<div id="order_shop_name">
							<span>네네치킨 풍덕점</span>
						</div>
						<div id="order_content">
							<ul>
								<li>
									<div class="order_food">
										<span>양념치킨 X 1 :</span>
									</div>
									<div class="order_food_price">
										<span>18000원</span>
									</div>
								</li>
								<li>
								<div class="order_food">
									<span>후라이드치킨 X 1 :</span>
								</div>
								<div class="order_food_price">
									<span>16000원</span>
								</div>
							</li>
							</ul>
						</div>
						<div id="order_dv_tip">
							<span>배달요금 2000원 별도</span>
						</div>
						<div id="order_total_price">
							<span>합계: 56000원</span>
						</div>
						<div>
							<button type="button" id="order_butt"><span>결제하기</span></button>
						</div>
					</div>
				</div>
			</div>
	</div>
</body>
</html>