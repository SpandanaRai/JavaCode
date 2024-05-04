<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.UserModel"%>
<%@page import="util.StringUtils"%>
<%@page import="controller.DatabaseController"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    DatabaseController databaseController = new DatabaseController();
    List<UserModel> users_obj = databaseController.getAllUsers();
%>
<c:forEach var="user" items="${users_obj}" varStatus="loop">
                <tr>
                    <td>${loop.index + 1}</td>
                    <td>${user.getUsername()}</td>
                    <td>${user.getEmail()}</td>
                </tr>
            </c:forEach>
</body>
</html>