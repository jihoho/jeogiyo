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

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${contextPath}/css/orderForm.css" rel="stylesheet" type="text/css" media="screen">
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
								<div><span id="jibeon_address" class="info_txt_lg">${orderFormInfo.jibeonAddress}</span></div>
								<div>
									[도로명] <span id="road_address" class="info_txt_md">${orderFormInfo.roadAddress}</span>
								</div>
								<div>
									<div style="float: left;">
										<span>상세주소 </span>
									</div>
									<div>
										<input id="detail_address" type="text" placeholder="상세 주소 입력해주세요."/>
									</div>
								</div>
								<div>
									<div style="float: left;">
										<span class="info_txt_md" id="orderer_tel">${memberInfo.hp}</span>
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
								<div id="pay-method-radio" class="btn-group" role="group" aria-label="Basic radio toggle button group">
									<input type="radio" class="btn-check" name="btnradio" id="btnradio1" value="card" autocomplete="off" checked>
									<label class="btn btn-outline-primary" for="btnradio1">KG Inicis</label>

									<input type="radio" class="btn-check" name="btnradio" id="btnradio2" value="after-card" autocomplete="off">
									<label class="btn btn-outline-primary" for="btnradio2">만나서 카드결제</label>

									<input type="radio" class="btn-check" name="btnradio" id="btnradio3" value="after-cash" autocomplete="off">
									<label class="btn btn-outline-primary" for="btnradio3">만나서 현금결제</label>
								</div>
								<input type="hidden" id="pay_method" value="card">
							</div>
						</div>

					</div>

				</div>

				<div class="col-sm-4 d-none d-lg-block"  style="">
					<div id="order_sect">
						<div id="order_header">
							<span>주문표</span>
						</div>
						<div id="order_shop_name_div">
							<span id="order_shop_name">${orderFormInfo.shopName}</span>
							<input type="hidden" id="order_shop_id" value="${orderFormInfo.shopId}"/>
							<input type="hidden" id="orderer_id" value="${memberInfo.member_id}"/>
							<input type="hidden" id="orderer_name" value="${memberInfo.nick_name}"/>
							<input type="hidden" id="orderer_type" value="${memberInfo.member_type}"/>
						</div>
						<div id="order_content">
							<ul>
								<c:set var ="price_sum" value="${orderFormInfo.deliveryTip}"/>
								<c:forEach var="food" items="${orderFormInfo.orderFoodList}">
									<li class="order_food_list">
										<div class="order_food_name_qty">
											<input type="hidden" class="food_id" value="${food.foodId}"/>
											<span class="food_name">${food.foodName}</span> X <span class="food_qty">${food.foodQty}</span> :
										</div>
										<div class="order_food_price">
											<span class="food_price">${food.foodPrice}</span>
											<span>원</span>
										</div>
									</li>
									<c:set var="price_sum" value="${price_sum+food.foodQty*food.foodPrice}"/>
								</c:forEach>
							</ul>
						</div>
						<div id="order_dv_tip">
							<span>배달요금 </span>
							<span id="delivery_tip">${orderFormInfo.deliveryTip}</span>
							<span>원 별도</span>
						</div>
						<div id="order_total_price">
							<span>합계: </span>
							<span id="total_price">${price_sum}</span>
							<span>원</span>
						</div>
						<div>
							<button type="button" id="order_butt"><span>결제하기</span></button>
							<span>${contextPath}</span>
						</div>
					</div>
				</div>
			</div>
	</div>

	<script src="${contextPath}/js/orderForm.js"></script>
</body>
</html>