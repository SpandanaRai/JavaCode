<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/adminHome.css" />
    </head>
    <body>
        <%@ include file="./includes/header.jsp" %> 
        <%@ include file="./includes/sidebar.jsp" %>
        <div class="box-container">
            <a href="${pageContext.request.contextPath}/pages/adminCustomer.jsp">
                <img src="${pageContext.request.contextPath}/images/image.png" alt="Logo" />
            </a>
            <a href="${pageContext.request.contextPath}/pages/category.jsp">
                <img src="${pageContext.request.contextPath}/images/image2.png" alt="Logo" />
            </a>
            <a href="${pageContext.request.contextPath}/pages/product.jsp">
                <img src="${pageContext.request.contextPath}/images/image3.png" alt="Logo" />
            </a>
        </div>
        <div class="box-container" style="margin-top: 40px;">
            <a href="${pageContext.request.contextPath}/pages/orders.jsp">
                <img src="${pageContext.request.contextPath}/images/image4.png" alt="Logo" />
            </a>
        </div>
        <script src="https://kit.fontawesome.com/c69827d687.js" crossorigin="anonymous"></script>
    </body>
</html>
