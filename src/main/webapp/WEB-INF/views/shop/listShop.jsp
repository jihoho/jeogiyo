<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>

<style>


	#shop_list{
		display: flex;
		justify-content: center;
		align-items: center;
		margin-left: 110px;
		margin-right: 110px;
	}
	
	.shop{
		width: 550px;
		height: 150px;
		background: rgba(196, 196, 196, 0.15);
		margin-left: 60px;
		margin-top: 30px;
		float:left;
		
	}
	.shop a{
		color: black;
		text-decoration: none;
	}
	
	.shop_img img{
		float: left;
		margin-left: 15px;
		margin-top: 15px;
		width: 120px;
		height: 120px;
	}
	
	.shop_name{
		float: left;
		margin-left: 20px;
		margin-top: 20px;
	}
	
	.shop_starpoint{
		margin-top: 60px;
		margin-left: 180px;
	}
	
	.shop_dv_info{
		
		margin-left: 180px;
		margin-top: 10px;
	}
	
	.shop_dv_time{
		float:right;
		margin-right: 8px;
		margin-bottom: 8px;
	}
	
</style>

<script type="text/javascript">
	function getParameter(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

</script>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<div id="shop_list">
		<c:choose>
			<c:when test="${empty shopList }">
				<h1>현재 위치의 가게 정보가 없습니다.</h1>
			</c:when>
			<c:otherwise>
				<table>
				<c:forEach var="i" begin="0" end="${shopList.size()-1}" step="1">
					<c:choose>
						<c:when test="${i%2==0}">
							<tr>
						</c:when>
					</c:choose>	
					
						<td class="shop">
							
							<a href="${contextPath}/shop/shopDetail?shop_id=${shopList.get(i).shop_id}">
							<div class="shop_img">
								<img alt="" src="${contextPath}/shopThumbnails?shop_id=${shopList.get(i).shop_id}&fileName=${shopList.get(i).image_file}">
								
							</div>
							
							<div class="shop_name">
								<span>${shopList.get(i).shop_name}</span>
							</div>
							<div class="shop_starpoint">	
								<span>평점 : ${shopList.get(i).star_avg}</span>
								<span>리뷰 ${shopList.get(i).review_cnt}</span>
							</div>
							<div class="shop_dv_info">
								<span>최소 주문 ${shopList.get(i).min_order_price}</span>
								<span>배달 팁 ${shopList.get(i).delivery_tip}</span>
							</div>
							<div class="shop_dv_time">
								<span>${shopList.get(i).delivery_min_time}~${shopList.get(i).delivery_max_time}분</span>
							</div>
							</a>
						</td>
						
					<c:choose>
						<c:when test="${i%2==1}">
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		
	</div>
</body>
</html>