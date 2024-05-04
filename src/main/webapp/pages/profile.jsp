<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/profile.css">
</head>
<body>
<%@ include file="./partials/header.jsp" %> 

    <div class="container" style="display: flex;  height: 550px;">
        <div class="left-container">
            <i class="fa-solid fa-arrow-left" style="margin-left: 30px; margin-top:20px;"></i>
            <img src="${pageContext.request.contextPath}/images/AU1.jpg" alt="Image">
        </div>
        <div class="right-container" >
            <h1 style="text-align:center; font-weight: bold; font-size:20px;">User Details</h1>
            <form>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
                <br><br>
                <label for="phone">Phone Number:</label>
                <input type="text" id="phone" name="phone" required>
                <br><br>
                <label for="email">Email Address:</label>
                <input type="email" id="email" name="email" required>
                <br><br>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <br><br>
                <a href="${pageContext.request.contextPath}/pages/updateProfile.jsp" class="submit-link">Edit Details</a>
            </form>
        </div>
    </div>
    <script src="https://kit.fontawesome.com/e32763a4cc.js" crossorigin="anonymous"></script>
     <%@ include file="./partials/footer.jsp" %> 
</body>
</html>