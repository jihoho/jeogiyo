<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="form" uri="http://sslext.sourceforge.net/sslext" %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.jeogiyo.order.vo.OrderFood" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="shop" value="${shop}"/>

<style>

	#shopInfo{
		margin-top: 30px;
		display: flex;
		justify-content: center;
		/*align-items: center;*/
	}

	/*
		shop header
	*/

	#shop_header{
		border:1px solid #000000;
		overflow: hidden;
	}
	.shop_img{
		float: left;
		padding: 5px 5px;
	}
	.shop_img img{
		width: 150px;
		height: 150px;
	}
	.shop_txt{
		float:left;
	}
	.shop_name{
		padding: 15px 0 0 15px;
		clear: both;
	}

	#shop_header ul{
		float: top;
		padding: 10px 10px;
	}
	#shop_header .shop_dv li{
		list-style: none;
		padding: 5px;
	}
	.shop_dv_txt{
		font-size: 90%;
		color: #999;
		line-height: 1.7em;
	}
	.shop_star{
		float: right;
	}
	.shop_star li{
		list-style: none;
		padding: 5px;
	}

	/*
		order
	*/

	#order_sect{
		border: 1px solid black;
		padding: 0;
		width: 100%;
	}
	#order_header{
		background-color: #4E654A;
		width: 100%;
	}
	#order_header span{
		font-weight: 900;
		font-size: 24px;
		color: white;
	}

	#order_content{
		border: 0.2px solid black;
	}

	#order_butt{
		width: 100%;
		height: 100%;
		background-color: #046D22;
		border: 0.5px solid black;
		outline: 0;
		text-align: center;
	}
	#order_butt span{
		font-weight: 900;
		font-size: 24px;
		color: white;
	}



	/*
		shop content
	*/
	.collapse_butt{
		width: 100%;
		height: 100%;
		border: 0.5px solid black;
		outline: 0;
		background-color:  #EEECEC;
	}

	.menu_butt_frame{
		padding: 0;
	}

	.menu_butt{
		width: 100%;
		height: 100%;
		background-color: #C4C4C4;
		text-align: left;
		border: 0.5px solid black;
		outline: 0;
	}

	.menu_list_frame{
		padding:0;
		display: none;
	}

	.menu_list{
		width: 100%;
		height: 100%;
		border: 0.2px solid black;
		background-color: white;
	}
	.food_list{
		height: 100px;
		border: 1px solid black;
		padding: 10px;
	}

	.food_list_a{
		color: black;
		text-decoration:none;
	}
	.food_txt{
		float:left;
	}
	.food_img{
		float: right;
		width: 100px;
		height: 100%;
		border: 1px solid black;
	}

	.food_img img{
		width: 100%;
		height: 100%;
	}

</style>
<script type="text/javascript">


/*
* 	menuButt 클릭시 해당 메뉴의 리스트의 display를 none 또는 block으로 변경
* 	예) mainManuButt -> mainManuList 로 변환 하여 target element 추출
* */
	function menuButtClick(menu_id){
		var tmp=menu_id.split('Butt');
		var target_id=tmp[0]+"List";
		var target_el=document.getElementById(target_id);
		var el=document.getElementById("mainMenuList");

		if(target_el.style.display=="block"){
			target_el.style.display="none";
		}else{
			target_el.style.display="block";
		}
	}

	function collapseButt(butt_id){
		// if($(this).hasClass("menu1")){
		// 	alert("menu1");
		// }else if($(this).hasClass("menu2")){
		// 	alert("menu2");
		// }else{
		// 	alert("menu3");
		// }
		var menu1=document.getElementById("collapse1");
		var menu2=document.getElementById("collapse2");
		var menu3=document.getElementById("collapse3");
		var menu1_sect=document.getElementById("collapse1_sect");
		var menu2_sect=document.getElementById("collapse2_sect");
		var menu3_sect=document.getElementById("collapse3_sect");

		if(butt_id=="collapse1"){
			menu1.style.color="#007D2B";
			menu2.style.color="black";
			menu3.style.color="black";

			menu1_sect.style.display="block";
			menu2_sect.style.display="none";
			menu3_sect.style.display="none";
		}else if(butt_id=="collapse2"){
			menu1.style.color="black";
			menu2.style.color="#007D2B";
			menu3.style.color="black";

			menu1_sect.style.display="none";
			menu2_sect.style.display="block";
			menu3_sect.style.display="none";
		}else if(butt_id=="collapse3"){
			menu1.style.color="black";
			menu2.style.color="black";
			menu3.style.color="#007D2B";

			menu1_sect.style.display="none";
			menu2_sect.style.display="none";
			menu3_sect.style.display="block";
		}else{
			alert("unknown menu number!!")
		}
	}

	/*
	* 	food list 클릭 시 주문 or 주문표 추가 팝업창 출력
	* */
	function foodListClick(shop_id,food_id,food_name,food_desc,food_price){
		var message="food_id: "+food_id+" , food_name: "+food_name+" , food_desc: "+food_desc+" , food_price: "+food_price;

	/*	$("#foodDetailModal").on('show.bs.modal',function(event){
			$("#modal_food_img").attr("src","${contextPath}/foodThumbnails.do?shop_id="+shop_id+"&food_id="+food_id);
			$("#modal_food_name").val(food_name);
			$("#modal_food_desc").val(food_desc);
			$("#modal_food_price").val(food_price);
		})*/

		$("#modal_food_id").val(food_id);
		$("#modal_food_img").attr("src","${contextPath}/foodThumbnails.do?shop_id="+shop_id+"&food_id="+food_id);
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
		removeImg.setAttribute("src","${contextPath}/image/x_butt.png");
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
		plusImg.setAttribute("src","${contextPath}/image/plus_butt.png");
		plusImg.setAttribute("style","height:20px; width:20px;");
		plusA.appendChild(plusImg);

		var minusA=document.createElement("a");
		minusA.setAttribute("class","order_minus_butt");
		// minusA.setAttribute("onclick","orderQtyClick()")
		var minusImg=document.createElement("img");
		minusImg.setAttribute("src","${contextPath}/image/minus_butt.png");
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
	*  주문하기 button 클릭 시 food에 대한 id, 수량(qty)을 input tag로 동적 추가하여 form submit
	* */
	$(document).on("click","#order_butt",function(){
		var orderFoodList=document.getElementsByClassName("order_food");
		var form=document.getElementById("orderForm");

		for(var i=0;i<orderFoodList.length;i++){
			var foodDiv=orderFoodList[i];
			var foodQtySpan=foodDiv.getElementsByClassName("order_food_qty")[0];
			var foodIdInput=foodDiv.getElementsByClassName("order_food_id")[0];

			// form으로 전송할 input 태그 생성
			var formFoodId=document.createElement("input");
			formFoodId.setAttribute("name","orderFoodList["+i+"].food_id");
			formFoodId.setAttribute("type","hidden");
			formFoodId.value=foodIdInput.value;
			var formFoodQty=document.createElement("input");
			formFoodQty.setAttribute("name","orderFoodList["+i+"].food_qty");
			formFoodQty.setAttribute("type","hidden");
			formFoodQty.value=foodQtySpan.innerText;

			form.appendChild(formFoodId);
			form.appendChild(formFoodQty);

			console.log("food id: "+foodIdInput.value+", food qty: "+foodQtySpan.innerText);
		}
		form.submit();
	});
</script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="shopInfo">
		<div class="container" >
			<div class="row" >
				<div class="col-sm-12 col-md-12 col-lg-8">
				<%--	shop header section	--%>
					<div id="shop_header">
						<div class="shop_img">
							<img alt="" src="${contextPath}/shopThumbnails.do?shop_id=${shop.shop_id}&fileName=${shop.image_file}">
						</div>
						<div class="shop_txt">
							<div class="shop_name">
								<h6><span style="color: black; font-weight: 900;">${shop.shop_name}</span></h6>
							</div>
							<ul class="shop_dv">

								<li>
									<span class="shop_dv_txt" >최소 주문 금액 </span>${shop.min_order_price}원
								</li>
								<li>
									<span class="shop_dv_txt">배달 시간 </span>${shop.delivery_min_time}~${shop.delivery_max_time}분
								</li>
								<li>
									<span class="shop_dv_txt">배달 팁 </span>${shop.delivery_tip}원
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

						<%-- main menu List --%>
						<div class="menu_butt_frame">
							<button id="mainMenuButt" class="menu_butt" type="button" onclick="menuButtClick(this.id);" >
								메인 메뉴
							</button>
						</div>
						<div class="menu_list_frame" id="mainMenuList">
							<c:set var="foodList" value="${mainFoodList}"/>
							<c:choose>
								<c:when test="${empty foodList}">
									<a class="food_list_a" href="javascript:void(0);">
										<div class="food_list">
											등록된 메인 메뉴가 없습니다.
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
													<img alt="" src="${contextPath}/foodThumbnails.do?shop_id=${foodList.get(i).shop_id}&food_id=${foodList.get(i).food_id}">
												</div>
											</div>
										</a>
									</c:forEach>
								</c:otherwise>
							</c:choose>



						</div>

						<%-- side menu List --%>
						<div class="menu_butt_frame">
							<button id="sideMenuButt" class="menu_butt" type="button" onclick="menuButtClick(this.id);" >
								사이드 메뉴
							</button>
						</div>
						<div class="menu_list_frame" id="sideMenuList">
							<c:set var="foodList" value="${sideFoodList}"/>
							<c:choose>
								<c:when test="${empty foodList}">
									<a class="food_list_a" href="javascript:void(0);">
										<div class="food_list">
											등록된 메인 메뉴가 없습니다.
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
													<img alt="" src="${contextPath}/foodThumbnails.do?shop_id=${foodList.get(i).shop_id}&food_id=${foodList.get(i).food_id}">
												</div>
											</div>
										</a>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>

						<%-- set menu List --%>
						<div class="menu_butt_frame">
							<button id="setMenuButt" class="menu_butt" type="button" onclick="menuButtClick(this.id);" >
								세트 메뉴
							</button>
						</div>
						<div class="menu_list_frame" id="setMenuList">
							<c:set var="foodList" value="${setFoodList}"/>
							<c:choose>
								<c:when test="${empty foodList}">
									<a class="food_list_a" href="javascript:void(0);">
										<div class="food_list">
											등록된 메인 메뉴가 없습니다.
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
													<img alt="" src="${contextPath}/foodThumbnails.do?shop_id=${foodList.get(i).shop_id}&food_id=${foodList.get(i).food_id}">
												</div>
											</div>
										</a>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>

						<%-- set menu List --%>
						<div class="menu_butt_frame">
							<button id="beverageMenuButt" class="menu_butt" type="button" onclick="menuButtClick(this.id);" >
								음료 메뉴
							</button>
						</div>
						<div class="menu_list_frame" id="beverageMenuList" >
							<c:set var="foodList" value="${beverageFoodList}"/>
							<c:choose>
								<c:when test="${empty foodList}">
									<a class="food_list_a" href="javascript:void(0);">
										<div class="food_list">
											등록된 메인 메뉴가 없습니다.
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
													<img alt="" src="${contextPath}/foodThumbnails.do?shop_id=${foodList.get(i).shop_id}&food_id=${foodList.get(i).food_id}">
												</div>
											</div>
										</a>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div id="collapse2_sect" style="display: none;">
						<div style="border:1px solid #000000;padding:0;">
							<button type="button"  style="width: 100%; height: 100%">
								menu2_sect!!!
							</button>
						</div>
					</div>
					<div id="collapse3_sect" style="display: none;">
						<div  style="border:1px solid #000000;padding:0;">
							<button type="button"  style="width: 100%; height: 100%">
								menu3_sect!!!
							</button>
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
							<form:form modelAttribute="orderFood" id="orderForm" name="orderForm" action="${contextPath}/order/orderDetail.do">
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
										<img src="${contextPath}/image/minus_butt.png" style="width: 20px; height: 20px;">
									</a>
									<span id="modal_food_qty">
										1
									</span>
									<a id="modal_plus" onclick="modalQtyClick(this.id)">
										<img src="${contextPath}/image/plus_butt.png" style="width: 20px; height: 20px;">
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