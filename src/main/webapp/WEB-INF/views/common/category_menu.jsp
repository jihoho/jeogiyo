<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
    request.setCharacterEncoding("UTF-8");
    ServletContext context=request.getServletContext();
    List categoryList= (ArrayList)context.getAttribute("categoryList");
%>
<style>
    #ct_menu{
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        height: 60px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #ct_menu span{
        padding: 15px;
        text-align: center;
        font-family: Roboto;
        font-style: normal;
        font-weight: normal;
        font-size: 24px;
        line-height: 28px;
        text-decoration-line: underline;
    }

    #ct_menu a{
        color: black;
    }

</style>
<script>
    function menu_check(){
        var menu=getParameter("category");
        console.log("menu: "+menu);
        var el= document.getElementById(menu);
        if(el!=null)
            el.style.color='blue';
    }
    function getParameter(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
</script>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>header</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="${contextPath}/static/lib/bootstrap-5.0.0-beta1-dist/css/bootstrap.css" rel="stylesheet" >
<script src="${contextPath}/static/lib/bootstrap-5.0.0-beta1-dist/js/bootstrap.js" type="text/javascript"></script>
<script src="${contextPath}/static/lib/bootstrap-5.0.0-beta1-dist/js/bootstrap.bundle.js" type="text/javascript"></script>

</head>
<body onload="menu_check();">


        <div id="ct_menu">
            <%
                for(int i=0;i<categoryList.size();i++){
                    Map category=(Map)categoryList.get(i);
            %><a id=<%=category.get("name")%> href="${contextPath}/shop/listShop?category=<%=category.get("name")%>&bcode=${bcode}">
            <span><%=category.get("ko_name") %></span>
        </a><%
            }
        %>
        </div>
	


</body>
</html>