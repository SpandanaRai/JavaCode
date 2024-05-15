<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.UserModel"%>
<%@page import="util.StringUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
	<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/login.css">

</head>
<body>

	<div class="wrapper">
		<span class="icon-close"><ion-icon name="close"></ion-icon>
		</span>
		<div class="form-box login">
			<h2>Login</h2>
			<form action="${pageContext.request.contextPath}/LoginServlet" method="post">
			<% 
	        String successMessage = (String) request.getAttribute(StringUtils.SUCCESS_MESSAGE);
	        String errorMessage = (String) request.getAttribute(StringUtils.ERROR_MESSAGE);
	
	        if (errorMessage != null && !errorMessage.isEmpty()) {
	        %>
	        <!-- Display error message -->
	         <div class="alert alert-danger mt-2" role="alert">
	            <%= errorMessage %>
	        </div>
	        <% } %>
	
	        <% 
	        if (successMessage != null && !successMessage.isEmpty()) {
	        %>
	        <!-- Display success message -->
	        <div class="alert alert-success mt-2" role="alert">
	            <%= successMessage %>
	        </div>
	        <% } %>
				<div class="input-box">
					<span class="icon"><ion-icon name="person"></ion-icon></span>
					<input type="text" id="username" name="username" required>
					<label>Username</label>
				</div>
				<div class="input-box">
					<span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
					<input type="password" id="password" name="password" required>
					<label>Password</label>
				</div>
				<div class="remember-forgot">
					<a href="#">Forgot Password?</a>
				</div>
				<button type="submit" class="btn">Login</button>
				<div class="login-register">
					<p>Don't have an account?<a href="register.jsp" class="register-link">Register</a></p>
				</div>
			</form>
		</div>
	</div>
	<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	       
</body>
</html>