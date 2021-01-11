<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<link href="${contextPath}/css/layout.css" rel="stylesheet" type="text/css" media="screen">
	
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body>
    <div id="container">
    	<header>
        	<tiles:insertAttribute name="header"/>
     	</header>
        <div>
            <tiles:insertAttribute name="category"/>
        </div>
     	<article>
        	<tiles:insertAttribute name="body"/>
        </article>
        <footer>
        	<tiles:insertAttribute name="footer"/>
		</footer>
    </div>
  </body>
</html>