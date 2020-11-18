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
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	#shop_img{
		width: 300px; 
		height: 300px;
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
	<section>
	<table>
	<%
		for(int i=0;i<categoryList.size();i++){
			if(i%4==0){
				%>
				<tr>
				<% 
			}
			Map category=(Map)categoryList.get(i);
			%>
				<td>
					<a href="${contextPath}/shop/searchShopListByCategory.do?category=<%=category.get("name")%>">
					<div>
						<img  id="shop_img" src="<%= category.get("img_file") %>">
					</div>
					</a>
				</td>
			<%
			if (i%4==3){
				%>
				</tr>
				<%
			}
		}
	%>
	</table>
	</section>
</body>
</html>