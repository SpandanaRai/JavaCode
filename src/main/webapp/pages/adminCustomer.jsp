<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.UserModel"%>
<%@page import="util.StringUtils"%>
<%@page import="controller.DatabaseController"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/adminCustomer.css">
</head>
<body>
<%@ include file="./includes/header.jsp" %> 
<%@ include file="./includes/sidebar.jsp" %>
<%
    DatabaseController databaseController = new DatabaseController();
    List<UserModel> users_obj = databaseController.getAllUsers();
%>
<div class="customer-table">
    <h2>View Customers</h2>
    <br />
    <table>
        <thead>
            <tr>
                <th class="text-center">S.N.</th>
                <th class="text-center">Username</th>
                <th class="text-center">Email</th>
            </tr>
        </thead>
        <tbody>
            <% for (int i = 0; i < users_obj.size(); i++) { %>
        <tr>
            <td><%= i + 1 %></td>
            <td><%= users_obj.get(i).getUsername() %></td>
            <td><%= users_obj.get(i).getEmail() %></td>
        </tr>
     <% } %>
           
        </tbody>
    </table>
</div>
<script src="https://kit.fontawesome.com/c69827d687.js" crossorigin="anonymous"></script>
</body>
</html>