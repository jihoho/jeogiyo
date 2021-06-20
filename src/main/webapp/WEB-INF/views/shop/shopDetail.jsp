<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="form" uri="http://sslext.sourceforge.net/sslext" %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.jeogiyo.order.vo.OrderFoodVO" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="shop" value="${shop}"/>


<script type="text/javascript">

	/*		페이지 로딩 이후,
			로그인이 아닐 경우 찜버튼이 빈 하트 이미지
		    로그인이고, 해당 member가 shop을 찜한 경우 빨간색 하트 이미지로 변경 */

	function shopDetailInit(){
		// 세션에서 isLogOn(로그인 : true, 로그아웃: false) 값을 가져옴
		var isLogOn="<%=String.valueOf(session.getAttribute("isLogOn"))%>";
		console.log(isLogOn);
		var dib_butt=document.getElementById("dibs_butt");
		if(isLogOn=="false" || isLogOn=="null"){ //로그인이 안되어 있을 경우
			dib_butt.setAttribute("src","/static/image/dib/none_dib_butt.png");
		}else if (isLogOn=="true"){
			// 로그인이 되어 있을 경우 shop id, member id, member type을 rest controller에 전달
			var shop_id="${shop.shop_id}";
			var member_id="${memberInfo.member_id}";
			var member_type="${memberInfo.member_type}";
			console.log(shop_id+","+member_id+","+member_type);

			$.ajax({
            type:"get",
            async:false,
            url:"${contextPath}/dibs",
				dataType:"text",
				data: {shop_id:shop_id, member_id:member_id, member_type:member_type},
				success:function (data,textStatus){
					if(data=='false'){
						dib_butt.setAttribute("src","/static/image/dib/none_dib_butt.png");
					}else{
						dib_butt.setAttribute("src","/static/image/dib/dib_butt.png");
					}
				},
				error:function(data,textStatus){
					alert("에러가 발생했습니다.");
				},
				complete:function(data,textStatus){
					//alert("작업을완료 했습니다");
				}
			});  //end ajax!
		}
	}



	/*
	* 	찜 버튼 클릭 시 찜 버튼 이미지에 따라 해당 가게를 찜하거나 찜을 취소하는 function
	* */
	function dibsButtClick(){
		var action="";
		var dibs_butt=document.getElementById("dibs_butt");
		var imageSrc=dibs_butt.getAttribute("src");
		var isLogOn="<%=String.valueOf(session.getAttribute("isLogOn"))%>";
		// 로그인 상태가 아닌 경우
		if(isLogOn=="false" || isLogOn=="null") {
			alert("로그인 해주세요");
		}else{
			var shop_id="${shop.shop_id}";
			var member_id="${memberInfo.member_id}";
			var member_type="${memberInfo.member_type}";
			// src에 none_dib_butt.png일 경우 빈 하트 이미지 이므로 찜 추가
			if(imageSrc.indexOf("none")!==-1){
				$.ajax({
					type:"post",
					async:false,
					url:"${contextPath}/dibs",
					dataType:"text",
					data: {shop_id:shop_id, member_id:member_id, member_type:member_type},
					success:function (data,textStatus){
						dibs_butt.setAttribute("src","/static/image/dib/dib_butt.png");
					},
					error:function(data,textStatus){
						alert("에러가 발생했습니다.");
					},
					complete:function(data,textStatus){
						//alert("작업을완료 했습니다");
					}
				});  //end ajax!
			}
			// src에 none이 포함되어있지 않을 경우 빨간 하트 이미지이므로 찜 삭제
			else{
				$.ajax({
					type:"delete",
					async:false,
					url:"${contextPath}/dibs",
					dataType:"text",
					data: {shop_id:shop_id, member_id:member_id, member_type:member_type},
					success:function (data,textStatus){
						dibs_butt.setAttribute("src","/static/image/dib/none_dib_butt.png");
					},
					error:function(data,textStatus){
						alert("에러가 발생했습니다.");
					},
					complete:function(data,textStatus){
						//alert("작업을완료 했습니다");
					}
				});  //end ajax!
			}
		}
	}

	/*
	* 	menuButt 클릭시 해당 메뉴의 리스트의 display를 none 또는 block으로 변경
	* 	예) mainManuButt -> mainManuList 로 변환 하여 target element 추출
	* */
	function menuButtClick(menu_id){
		var tmp=menu_id.split('Butt');
		var target_id=tmp[0]+"List";
		console.log(target_id);
		var target_el=document.getElementById(target_id);

		if(target_el.style.display=="block"){
			target_el.style.display="none";
		}else{
			target_el.style.display="block";
		}
	}

	function collapseButt(butt_id){
		var menuIdArray=["collapse1","collapse2","collapse3"];
		var menuArray=new Array();
		var menuArraySect= new Array();
		for(var i=0;i<menuIdArray.length;i++){
			menuArray[i]=document.getElementById(menuIdArray[i]);
			menuArraySect[i]=document.getElementById(menuIdArray[i]+"_sect");
			if(butt_id==menuIdArray[i]){
				menuArray[i].style.color="#007D2B";
				menuArraySect[i].style.display="block";
			}else{
				menuArray[i].style.color="black";
				menuArraySect[i].style.display="none";
			}
		}
	}

	/*
	* 	food list 클릭 시 주문 or 주문표 추가 팝업창 출력
	* */
	function foodListClick(shop_id,food_id,food_name,food_desc,food_price){
		var message="food_id: "+food_id+" , food_name: "+food_name+" , food_desc: "+food_desc+" , food_price: "+food_price;

	/*	$("#foodDetailModal").on('show.bs.modal',function(event){
			$("#modal_food_img").attr("src","${contextPath}/foodThumbnails?shop_id="+shop_id+"&food_id="+food_id);
			$("#modal_food_name").val(food_name);
			$("#modal_food_desc").val(food_desc);
			$("#modal_food_price").val(food_price);
		})*/

		$("#modal_food_id").val(food_id);
		$("#modal_food_img").attr("src","${contextPath}/foodThumbnails?shop_id="+shop_id+"&food_id="+food_id);
		$("#modal_food_name").text(food_name);
		$("#modal_food_desc").text(food_desc);
		$("#modal_food_price").text(food_price);
		$("#modal_food_qty").text("1");
		$("#modal_total_price").text(food_price);
		$('#foodDetailModal').modal('show');
	}

	/*
	* modal 창에서 음식 주문표에 추가
	* */
	function addCart(){
		var food_name=document.getElementById("modal_food_name").innerText;
		var food_id=document.getElementById("modal_food_id").value;
		var food_price=document.getElementById("modal_food_price").innerText;
		var food_qty=document.getElementById("modal_food_qty").innerText;

		var orderContent=document.getElementById("order_content");
		// create dynamic html
		var newDiv=document.createElement("div");
		newDiv.setAttribute("style","height:80px; border: 1px solid black;");
		newDiv.setAttribute("class","order_food");
		// create food id <input>
		var foodIdInput=document.createElement("input");
		foodIdInput.setAttribute("type","hidden");
		foodIdInput.value=food_id;
		foodIdInput.setAttribute("class","order_food_id");
		foodIdInput.setAttribute("style","disabled: true;");

		// create food name <Div>
		var foodNameDiv=document.createElement("div");
		var foodNameSpan=document.createElement("span");
		foodNameSpan.innerText=food_name;
		foodNameSpan.setAttribute("class","order_food_name");
		foodNameDiv.appendChild(foodNameSpan);

		// create food price and remove button <div>
		var foodPriceDiv=document.createElement("div");
		var removeA=document.createElement("a");
		removeA.setAttribute("class","order_remove_butt");
		var removeImg=document.createElement("img");
		removeImg.setAttribute("src","${contextPath}/static/image/x_butt.png");
		removeImg.setAttribute("style","height:20px; width:20px;");
		removeA.appendChild(removeImg);
		foodPriceDiv.setAttribute("style","float:left;");
		foodPriceDiv.appendChild(removeA);
		var foodPriceSpan=document.createElement("span");
		foodPriceSpan.setAttribute("class","order_food_price")
		foodPriceSpan.innerText=food_price;
		foodPriceDiv.appendChild(foodPriceSpan);


		//create food Quantity and plus,minus button <div>
		var foodQtyDiv=document.createElement("div");
		foodQtyDiv.setAttribute("style","float:right;");
		var foodQtySpan=document.createElement("span");
		foodQtySpan.setAttribute("class","order_food_qty");
		foodQtySpan.innerText=food_qty;
		var plusA=document.createElement("a");
		plusA.setAttribute("class","order_plus_butt");
		var plusImg=document.createElement("img");
		plusImg.setAttribute("src","${contextPath}/static/image/plus_butt.png");
		plusImg.setAttribute("style","height:20px; width:20px;");
		plusA.appendChild(plusImg);

		var minusA=document.createElement("a");
		minusA.setAttribute("class","order_minus_butt");
		// minusA.setAttribute("onclick","orderQtyClick()")
		var minusImg=document.createElement("img");
		minusImg.setAttribute("src","${contextPath}/static/image/minus_butt.png");
		minusImg.setAttribute("style","height:20px; width:20px;");
		minusA.appendChild(minusImg);

		foodQtyDiv.appendChild(minusA);
		foodQtyDiv.appendChild(foodQtySpan);
		foodQtyDiv.appendChild(plusA);

		newDiv.appendChild(foodIdInput);
		newDiv.appendChild(foodNameDiv);
		newDiv.appendChild(foodPriceDiv);
		newDiv.appendChild(foodQtyDiv);
		orderContent.appendChild(newDiv);

		var orderContentNone =document.getElementById("order_content_none");
		orderContentNone.setAttribute("style","display:none;");
		$('#foodDetailModal').modal('hide');
		// alert(food_name+","+food_id+","+food_price+","+food_qty)
		calcFoodTotalPrice();
	}


	function calcFoodTotalPrice(){
		var order=document.getElementsByClassName("order_food");
		var dv_tip=Number(document.getElementById("order_dv_price").innerText);
		var totalPrice=dv_tip;
		for(var i=0;i<order.length;i++){
			var foodDiv=order[i];
			var foodNameSpan=foodDiv.getElementsByClassName("order_food_name").item(0);
			var foodPriceSpan=foodDiv.getElementsByClassName("order_food_price").item(0);
			var foodQtySpan=foodDiv.getElementsByClassName("order_food_qty").item(0);
			totalPrice+= Number(foodPriceSpan.innerText)*Number(foodQtySpan.innerText);
			console.log(foodNameSpan.innerText+","+foodPriceSpan.innerText+","+foodQtySpan.innerText);
		}
		var totalPriceSpan=document.getElementById("order_total_price");
		totalPriceSpan.innerText=String(totalPrice);
	}

	// modal 창에서 음식 수량 버튼 처리
	function modalQtyClick(buttId){
		var foodQty=document.getElementById("modal_food_qty");
		var foodPrice=document.getElementById("modal_food_price");
		var totalPrice=document.getElementById("modal_total_price");
		var qty=Number(foodQty.innerText);
		if(buttId=="modal_plus"){
			qty+=1;
		}else if(buttId=="modal_minus"){
			if(qty>1) {
				qty-=1;
			}
		}else{
			console.log("unknown food quantity button id!!");
		}
		foodQty.innerText=String(qty);
		totalPrice.innerText=String(qty*Number(foodPrice.innerText));
	}

	/*
		주문표에서 음식 수량 버튼 이벤트 처리
		동적으로 생성된 태그이므로 아래와 같이 on 함수로 이벤트 처리해주어야함
	* */
	$(document).on("click",".order_minus_butt",function(){
		var foodQtySpan=$(this).next();
		var qty=Number(foodQtySpan.text());
		if(qty>1){
			qty-=1;
		}
		foodQtySpan.text(String(qty));
		calcFoodTotalPrice();

	});

	$(document).on("click",".order_plus_butt",function(){
		var foodQtySpan=$(this).prev();
		var qty=Number(foodQtySpan.text());

		qty+=1;

		foodQtySpan.text(String(qty));
		calcFoodTotalPrice();

	});

	$(document).on("click",".order_remove_butt",function(){
		var orderDiv=$(this).parent().parent();
		orderDiv.remove();
		calcFoodTotalPrice();

	});

	/*
	*  주문하기 button 클릭 시 가게에 대한 정보,food에 대한 id, 수량(qty)을 input tag로 동적 추가하여 form submit
	* */
	$(document).on("click","#order_butt",function(){
		var isLogOn="<%=String.valueOf(session.getAttribute("isLogOn"))%>";
		console.log("isLogOn: "+isLogOn);
		if(isLogOn=="false"||isLogOn=="null"){
			alert("로그인 해주세요");
		}else {
			var orderFoodList = document.getElementsByClassName("order_food");
			var form = document.getElementById("orderForm");
			var shopNameSpan = document.getElementById("shop_name");
			var shopIdInput = document.getElementById("shop_id");
			var deliveryTipSpan = document.getElementById("shop_dv_tip");

			var formShopName = document.createElement("input");
			formShopName.setAttribute("name", "shopName");
			formShopName.setAttribute("type", "hidden");
			formShopName.value = shopNameSpan.innerText;
			var formShopId = document.createElement("input");
			formShopId.setAttribute("name", "shopId");
			formShopId.setAttribute("type", "hidden");
			formShopId.value = shopIdInput.value;
			var formDeliveryTip = document.createElement("input");
			formDeliveryTip.setAttribute("name", "deliveryTip");
			formDeliveryTip.setAttribute("type", "hidden");
			formDeliveryTip.value = deliveryTipSpan.innerText;

			var formRoadAddress = document.createElement("input");
			formRoadAddress.setAttribute("name", "roadAddress");
			formRoadAddress.setAttribute("type", "hidden");
			formRoadAddress.value = "풍덕천로 52";

			var formJibeonAddress = document.createElement("input");
			formJibeonAddress.setAttribute("name", "jibeonAddress");
			formJibeonAddress.setAttribute("type", "hidden");
			formJibeonAddress.value = "경기도 용인시 수지구 풍덕천동 1112 신정마을 현대성우아파트";

			form.appendChild(formShopName);
			form.appendChild(formShopId);
			form.appendChild(formDeliveryTip);
			form.appendChild(formRoadAddress);
			form.appendChild(formJibeonAddress);


			for (var i = 0; i < orderFoodList.length; i++) {
				var foodDiv = orderFoodList[i];
				var foodIdInput = foodDiv.getElementsByClassName("order_food_id")[0];
				var foodNameSpan = foodDiv.getElementsByClassName("order_food_name")[0];
				var foodPriceSpan = foodDiv.getElementsByClassName("order_food_price")[0];
				var foodQtySpan = foodDiv.getElementsByClassName("order_food_qty")[0];

				// form으로 전송할 input 태그 생성
				var formFoodId = document.createElement("input");
				formFoodId.setAttribute("name", "orderFoodList[" + i + "].foodId");
				formFoodId.setAttribute("type", "hidden");
				formFoodId.value = foodIdInput.value;
				var formFoodName = document.createElement("input");
				formFoodName.setAttribute("name", "orderFoodList[" + i + "].foodName");
				formFoodName.setAttribute("type", "hidden");
				formFoodName.value = foodNameSpan.innerText;
				var formFoodPrice = document.createElement("input");
				formFoodPrice.setAttribute("name", "orderFoodList[" + i + "].foodPrice");
				formFoodPrice.setAttribute("type", "hidden");
				formFoodPrice.value = foodPriceSpan.innerText;
				var formFoodQty = document.createElement("input");
				formFoodQty.setAttribute("name", "orderFoodList[" + i + "].foodQty");
				formFoodQty.setAttribute("type", "hidden");
				formFoodQty.value = foodQtySpan.innerText;

				form.appendChild(formFoodId);
				form.appendChild(formFoodName);
				form.appendChild(formFoodPrice);
				form.appendChild(formFoodQty);

				console.log("food id: " + formFoodId.value + ", food name: " + formFoodName.value
						+ ", food price: " + formFoodPrice.value + ", food qty: " + formFoodQty.value);
			}
			// var shop_name=document.getElementsByClassName("shop_name").getElementsByTagName("span").innerText;
			// alert(shop_name);
			form.submit();
		}
	});
	$(document).ready(function (){
		shopDetailInit();
	});

</script>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${contextPath}/static/css/shopDetail.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
	<section id="shopInfo">
		<div class="container" >
			<div class="row" >
				<div class="col-sm-12 col-md-12 col-lg-8">
				<%--	shop header section	--%>
					<div id="shop_header">
						<div class="shop_img">
							<img alt="" src="${contextPath}/shopThumbnails?shop_id=${shop.shop_id}&fileName=${shop.image_file}">
						</div>
						<div class="shop_txt">
							<div id="shop_name">
								<h6><span style="color: black; font-weight: 900;">${shop.shop_name}</span></h6>
							</div>
							<input id="shop_id"type="hidden" value="${shop.shop_id}">
							<ul class="shop_dv">

								<li>
									<span class="shop_dv_txt">최소 주문 금액 </span>${shop.min_order_price}원
								</li>
								<li>
									<span class="shop_dv_txt">배달 시간 </span>${shop.delivery_min_time}~${shop.delivery_max_time}분
								</li>
								<li>
									<span class="shop_dv_txt">배달 팁 </span><span id="shop_dv_tip">${shop.delivery_tip}</span>원
								</li>
							</ul>
						</div>
						<div class="shop_star">
							<div>
								<ul>
									<li>
										<span>평점 : </span>${shop.star_avg}
									</li>
									<li>
										<span>리뷰 </span>${shop.review_cnt}
									</li>
									<li>
										<span>찜 </span>${shop.dib_cnt}
									</li>
									<li>
										<a onclick="dibsButtClick();">
											<img id="dibs_butt" style="width: 50px;height: 50px;">
										</a>
									</li>
								</ul>

							</div>
						</div>
					</div>

					<div class="">
						<div  style="float:left;width:35%;">
							<button type="button" id="collapse1" class="collapse_butt" onclick="collapseButt(this.id);" >
								메뉴
							</button>
						</div>

						<div  style="float:left;width:30%;">
							<button type="button"  id="collapse2" class="collapse_butt" onclick="collapseButt(this.id);" >
								리뷰
							</button>
						</div>

						<div  style="float:left;width:35%;">
							<button type="button" id="collapse3" class="collapse_butt"  onclick="collapseButt(this.id);">
								정보
							</button>
						</div>
					</div>


					<div id="collapse1_sect">
						<%--	collapse content section	--%>
						<%--	menuButt id 와 menuList id 양식 맞춰주어야 함
                                ***menuButt 클릭 시 ***menuList로 target Element 추출하여 display 값을 block or none으로 지정하기 때문
                            ex) mainManuButt -> mainManuList 	--%>

						<c:set var="menuArray" value="<%=new String[]{\"mainMenu\",\"sideMenu\",\"setMenu\",\"beverageMenu\"}%>"/>
						<c:forEach var="menu" items="${menuArray}">
							<div class="menu_butt_frame">
								<button id="${menu}Butt" class="menu_butt" type="button" onclick="menuButtClick(this.id);" >
									<c:choose>
										<c:when test="${menu eq 'mainMenu'}">메인 메뉴</c:when>
										<c:when test="${menu eq 'sideMenu'}">사이드 메뉴</c:when>
										<c:when test="${menu eq 'setMenu'}">세트 메뉴</c:when>
										<c:when test="${menu eq 'beverageMenu'}">음료 메뉴</c:when>
									</c:choose>
								</button>
							</div>
							<div class="menu_list_frame" id="${menu}List">
								<c:choose>
									<c:when test="${menu eq 'mainMenu'}"><c:set var="foodList" value="${mainFoodList}"/></c:when>
									<c:when test="${menu eq 'sideMenu'}"><c:set var="foodList" value="${sideFoodList}"/></c:when>
									<c:when test="${menu eq 'setMenu'}"><c:set var="foodList" value="${setFoodList}"/></c:when>
									<c:when test="${menu eq 'beverageMenu'}"><c:set var="foodList" value="${beverageFoodList}"/></c:when>
								</c:choose>

								<c:choose>
									<c:when test="${empty foodList}">
										<a class="food_list_a" href="javascript:void(0);">
											<div class="food_list">
												등록된 메뉴가 없습니다.
											</div>
										</a>
									</c:when>
									<c:otherwise>
										<c:forEach var="i" begin="0" end="${foodList.size()-1}" step="1">
											<a class="food_list_a" onclick="foodListClick('${shop.shop_id}','${foodList.get(i).food_id}','${foodList.get(i).food_name}',
													'${foodList.get(i).food_desc}','${foodList.get(i).food_price}');">
												<div class="food_list">
													<div class="food_txt" >
														<div>
																${foodList.get(i).food_name}
														</div>
														<div>
																${foodList.get(i).food_desc}
														</div>
														<div>
																${foodList.get(i).food_price}
														</div>
													</div>
													<div class ="food_img">
														<img alt="" src="${contextPath}/foodThumbnails?shop_id=${foodList.get(i).shop_id}&food_id=${foodList.get(i).food_id}">
													</div>
												</div>
											</a>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>

						</c:forEach>
					</div>


					<div id="collapse2_sect" style="display: none;">
						<div style="border:1px solid #000000; padding:40px;">
							<div style="text-align: center;">
								<span style="font-size: 64px;">${shop.star_avg}</span>
							</div>
							<div style="text-align: right;">
								<button>리뷰 쓰기</button>
							</div>

							<div style="padding: 20px 0 20px 0;">
								<c:choose>
									<c:when test="${empty reviewList}">
										<div style="text-align: center;">
											리뷰가 없습니다.
										</div>
									</c:when>
									<c:otherwise>
										<div>
											리뷰가 있음.
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div id="collapse3_sect" style="display: none;">
						<div  style="border:1px solid #000000;padding:40px;">
							<div style="margin:40px 0px 40px 0px;">
								<h4>가게소개</h4>
								<hr>
								<div>
									<span>${shop.shop_intro}</span>
								</div>
							</div>

							<div style="margin:40px 0px 40px 0px;">
								<h4>업체 정보</h4>
								<hr>
								<div>
									<span style="width: 10px; text-align: left;">영업시간</span>
									<span>${shop.open_time_h}:${shop.open_time_m} - ${shop.close_time_h}:${shop.close_time_m}</span>
								</div>
								<div>
									<span style="width: 10px; text-align: left;">전화번호</span>
									<span>${shop.tel1}-${shop.tel2}-${shop.tel3}</span>
								</div>
								<div>
									<span style="width: 10px; text-align: left;">주소</span>
									<span>${shop.road_address} ${shop.detail_address}</span>
								</div>
							</div>

							<div style="margin:40px 0px 40px 0px;">
								<h4>결제정보</h4>
								<hr>
								<div>
									<span style="width: 10px; text-align: left;">최소주문금액</span>
									<span>${shop.min_order_price}원</span>
								</div>
							</div>

							<div style="margin:40px 0px 40px 0px;">
								<h4>사업자정보</h4>
								<hr>
								<div>
									<span style="width: 10px; text-align: left;">상호명</span>
									<span>${shop.shop_name}</span>
								</div>
								<div>
									<span style="width: 10px; text-align: left;">사업자등록번호</span>
									<span>${shop.shop_regis_number}</span>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-sm-4 d-none d-lg-block"  style="">
					<div id="order_sect">
						<div id="order_header">
							<span>주문표</span>
						</div>
						<div id="order_content">
							<div id="order_content_none" style="height: 80px;">
								주문표에 담긴 메뉴가 없음.
							</div>
							<input type="hidden" name="food">
						</div>
						<div id="order_price">
							<div style="float: right">
								배달요금 <span id="order_dv_price">${shop.delivery_tip}</span>원 별도
							</div>
							<div style="clear: both;">
								<div style="float: right;">
									합계 : <span id="order_total_price">0</span>원
								</div>
							</div>
						</div>
						<div>
							<form:form modelAttribute="orderFormVO" id="orderForm" name="orderForm" action="${contextPath}/orders/orderForm">
							</form:form>
							<button type="button" id="order_butt"><span>주문하기</span></button>

						</div>
					</div>
				</div>
			</div>



			<!-- food list 클릭 시 Modal -->
			<div class="modal fade" id="foodDetailModal" tabindex="-1" aria-labelledby="foodDetailModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="foodDetailModalLabel">메뉴 상세</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<input type="hidden" id="modal_food_id">
							<div style="text-align: center;">
								<img id="modal_food_img" alt="" src="" style="height: 200px; width:260px;">
							</div>
							<div style="text-align: center;">
								<span id="modal_food_name"></span>
							</div>
							<div style="text-align: center;">
								<span id="modal_food_desc"></span>
							</div>
							<div style="border-top :solid 1px; height:50px;">
								<div style="float: left;">
									<span>가격</span>
								</div>
								<div style="float: right">
									<span  id="modal_food_price"></span>
								</div>
							</div>
							<div style="clear: both;border-top :solid 1px; height:50px;">
								<div style="float: left;">
									수량
								</div>
								<div style="float: right;">
									<a id="modal_minus" onclick="modalQtyClick(this.id)">
										<img src="${contextPath}/static/image/minus_butt.png" style="width: 20px; height: 20px;">
									</a>
									<span id="modal_food_qty">
										1
									</span>
									<a id="modal_plus" onclick="modalQtyClick(this.id)">
										<img src="${contextPath}/static/image/plus_butt.png" style="width: 20px; height: 20px;">
									</a>
								</div>
							</div>
							<div style="clear: both;border-top :solid 1px; height:80px;">
								<div style="float: left;">
									총 주문 금액
								</div>
								<span id="modal_total_price" style="float: right">
								</span>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" onclick="addCart();">주문표에 추가</button>
							<button type="button" class="btn btn-primary">주문하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>

</body>
</html>