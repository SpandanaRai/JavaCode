<%@page import="util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.UserModel"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
	<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/register.css">

</head>
<body>
	<div class="wrapper">
		<span class="icon-close"><ion-icon name="close"></ion-icon>
		</span>
		<div class="form-box register">
			<h2>Registration</h2>
			<form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
		<%
		String errorMessage = (String) request.getAttribute(StringUtils.ERROR_MESSAGE);
		
		if (errorMessage !=null && !errorMessage.isEmpty()) {
		%>
		<p class="error-message"> <%= errorMessage %> </p>
		<% 
		}
		%>
				<div class="input-box">
					<span class="icon"><ion-icon name="person"></ion-icon></span>
					<input type="text" id="name" name="name" required>
					<label>Name</label>
				</div>
				<div class="input-box">
					<span class="icon"><ion-icon name="mail"></ion-icon></span>
					<input type="email" id="email" name="email" required>
					<label>Email</label>
				</div>
				<div class="input-box">
					<span class="icon"><ion-icon name="call"></ion-icon></span>
					<input type="tel" id="phoneNumber" name="phoneNumber" required>
					<label>Phone Number</label>
				</div>
				<div class="input-box">
					<span class="icon"><ion-icon name="location"></ion-icon></span>
					<input type="text" id="address" name="address" required>
					<label>Address</label>
				</div>
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
				<div class="input-box">
					<span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
					<input type="password" id="retypePassword" name="retypePassword" required>
					<label>Retype Password</label>
				</div>
				<button type="submit" class="btn">Register</button>
				<div class="login-register">
					<p>Already have an account?<a href="login.jsp" class="login-link">Login</a></p>
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