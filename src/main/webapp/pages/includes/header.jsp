<%@page import="util.StringUtils"%> <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@page import="model.UserModel"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.html" />
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.html" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/style/header.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/images" />
    </head>
    <body>
        <div class="header">
            <div class="header-left" style="background-color: #f7f7fa;">
                <a class="logo">
                    <img src="${pageContext.request.contextPath}/images/laptop.png" alt="Logo" style="margin-left: 30px; width: 250px; height: 100px; margin-top: 20px;"t/>
                </a>
            </div>
            <div class="top-nav-search">
                <h4 style="margin-left: 40px;">Welcome admin</h4>
                <a href="profile.jsp">
                    <i class="fa-solid fa-user"></i>
                </a>
            </div>
        </div>
        <script src="https://kit.fontawesome.com/c69827d687.js" crossorigin="anonymous"></script>
    </body>
</html>
