<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%
 	request.setCharacterEncoding("UTF-8");
	ServletContext context=request.getServletContext();
	List categoryList= (ArrayList)context.getAttribute("categoryList");

%> 

<style>
	section {
		padding: 5px;
		border: 0px solid #bcbcbc;
		text-align: center;
	}
	
	#shop_img{
		
	}
</style>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<div class="category-list">
		<div class="row" style="padding: 30px; max-width: 1020px; margin: 0 auto;">
		
		<%
		for(int i=0;i<categoryList.size();i++){
			if(i%4==0){
				%>
				
				<% 
			}
			Map category=(Map)categoryList.get(i);
			%>
				<div class="col-xs6 col-sm-4 col-md-3 col-lg-3" style="padding-left: 5px; padding-right: 5px;">
					<a style="margin: 5px 0;" href="${contextPath}/shop/listShop?category=<%=category.get("name")%>&bcode=${bcode}">
					<div>
						<img  id="shop_img" style="max-width: 100%; height: auto; margin-left: auto; margin-bottom: auto;" src="<%= category.get("img_file") %>">
					</div>
					</a>
				</div>
			<%
			if (i%4==3){
				%>
				<%
			}
		}
	%>
		
		</div>
	</div>

</body>
	<script>
		function func(){

		}
	</script>
</html>