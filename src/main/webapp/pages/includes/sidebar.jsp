<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/style/sidebar.css">

</head>
<body>
<%@ include file="header.jsp" %>
<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
       <div id="sidebar-menu" class="sidebar-menu"><br>
          <ul>
             <li class="menu-title">
                <span style=font-size:19px;>Main Menu</span>
             </li><br>
             <li <% if(request.getRequestURI().endsWith("adminHome.jsp")) { %> class="active"<% } %>>
            <a href="adminHome.jsp"><i class="fa-solid fa-house"></i><span>Home</span></a>
            </li>
            <li <% if(request.getRequestURI().endsWith("adminCustomer.jsp")) { %> class="active"<% } %>>
                <a href="adminCustomer.jsp"><i class="fa-solid fa-people-group"></i></i> <span> Customers</span></span></a>
             </li>
             <li <% if(request.getRequestURI().endsWith("category.jsp")) { %> class="active"<% } %>>
                <a href="category.jsp"><i class="fa-solid fa-table-cells-large"></i></i> <span>Category</span></span></a>
             </li>
             <li <% if(request.getRequestURI().endsWith("adminProduct.jsp")) { %> class="active"<% } %>>
                <a href="adminProduct.jsp"><i class="fa-solid fa-table-cells-large"></i><span> Products</span></span></a>
             </li>
             <li <% if(request.getRequestURI().endsWith("orders.jsp")) { %> class="active"<% } %>>
                <a href="orders.jsp"><i class="fa-solid fa-table-list"></i> <span> Orders</span></span></a>
             </li>
            <li>
               <i class=""></i> 
               <a href="#"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a>
            </li>
          </ul>
          </div>
    </div>
 </div>
 <script src="https://kit.fontawesome.com/c69827d687.js" crossorigin="anonymous"></script>
</body>
</html>