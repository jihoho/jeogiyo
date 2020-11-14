<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%
  request.setCharacterEncoding("UTF-8");

%> 

<% 
	ServletContext context=request.getServletContext();
	List categoryList= (ArrayList)context.getAttribute("categoryList");
%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			<td style="width: 300px; height: 300px;">
				<span style="margin-left:5px; margin-top: 5px;"><%= category.get("name") %></span><br>
				<img  src="<%= category.get("img_file") %>" style="margin-right: 5px; margin-bottom: 5px;width: 125px; height: 125px;">
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
</body>
</html>