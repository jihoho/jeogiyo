<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		height: 200px;
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

</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
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
				<div class="col-sm-8">
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
							<button class="menu_list" type="button" style="">
								메인 메뉴 리스트!!!
							</button>
						</div>

						<%-- side menu List --%>
						<div class="menu_butt_frame">
							<button id="sideMenuButt" class="menu_butt" type="button" onclick="menuButtClick(this.id);" >
								사이드 메뉴
							</button>
						</div>
						<div class="menu_list_frame" id="sideMenuList">
							<button class="menu_list" type="button">
								사이드 메뉴 리스트!!!
							</button>
						</div>

						<%-- set menu List --%>
						<div class="menu_butt_frame">
							<button id="setMenuButt" class="menu_butt" type="button" onclick="menuButtClick(this.id);" >
								세트 메뉴
							</button>
						</div>
						<div class="menu_list_frame" id="setMenuList">
							<button class="menu_list" type="button">
								세트 메뉴 리스트!!!
							</button>
						</div>

						<%-- set menu List --%>
						<div class="enu_butt_frame">
							<button id="beverageMenuButt" class="menu_butt" type="button" onclick="menuButtClick(this.id);" >
								음료 메뉴
							</button>
						</div>
						<div class="menu_list_frame" id="beverageMenuList" >
							<button class="menu_list" type="button">
								음료 메뉴 리스트!!!
							</button>
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

				<div class="col-sm-4"  style="">
					<div id="order_sect">
						<div id="order_header">
							<span>주문표</span>
						</div>
						<div id="order_content">
							주문표에 담긴 메뉴가 없음.
						</div>
						<div>
							<button type="button" id="order_butt"><span>주문하기</span></button>
						</div>
					</div>
				</div>
			</div>



		</div>
	</section>

</body>
</html>