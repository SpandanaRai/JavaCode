<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.AboutUsModel"%>
<%@page import="util.StringUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/aboutUs.css" />
</head>
<body>
<%@ include file="./partials/header.jsp"%>
        <div class="container1"><br>
            <div class="heading"> 
                <h1 style="font-weight:bold; font-size:26px;">About Us</h1>
                <form action="${pageContext.request.contextPath}/AboutUsServlet" method="post">
                <% 
			        String successMessage = (String) request.getAttribute(StringUtils.FEEDBACK_SUCCESS_MESSAGE);
			        String errorMessage = (String) request.getAttribute(StringUtils.FEEDBACK_ERROR_MESSAGE);
			
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
                <br />
                <br />
                <p>
                    Welcome to Laptop Nexus, your go-to destination for top-quality laptops. We're here to make your shopping experience straightforward and satisfying. At Laptop Nexus, we've handpicked a selection of reliable laptops to
                    suit your needs, whether you're a student, professional, tech enthusiast or a gamer. Our focus is on delivering quality products at affordable prices. With us, you can shop confidently knowing that each laptop has been
                    carefully selected for its performance and reliability. Plus, our friendly customer service team is always available to assist you every step of the way. Discover the perfect laptop for your needs at Laptop Nexus and
                    take your first step towards seamless productivity and entertainment.
                </p>
            </div>
            <br />
            <hr />
            <div class="container2">
                <div class="box1" style="background-image: url('${pageContext.request.contextPath}/images/AU3.png');">
                    <h2>In the world of technology, where innovation meets versatility, our laptops are the bridge between dreams and reality, empowering you to unleash your full potential wherever your journey takes you.</h2>
                </div>
                <div class="box2">
                    <h2>Our Mission</h2>
                </div>
                <div class="ourmission">
                    <img src="${pageContext.request.contextPath}/images/AU1.jpg" />
                </div>
                <div class="text1">
                    <p>
                        Our mission at Laptop Nexus is to empower individuals with access to reliable, high-quality laptops that enhance productivity, creativity, and connectivity in their personal and professional lives. We are committed
                        to providing an exceptional shopping experience, where customers can easily find the perfect laptop to suit their unique needs, backed by unparalleled customer service and support.
                    </p>
                </div>
            </div>
            <div class="box3">
                <h2>Our Values</h2>
                <div class="ourvalues">
                    <img src="${pageContext.request.contextPath}/images/AU2.png" />
                </div>
                <div class="text2">
                    At Laptop Nexus, we're committed to putting our customers first, ensuring their satisfaction with every purchase. Our dedication to quality means that each laptop we offer undergoes rigorous testing for reliability and
                    performance. Transparency and honesty are fundamental to our operations, providing clear information at every stage. We stay ahead of the curve with the latest technology, empowering our customers with cutting-edge
                    solutions. Sustainability is a priority, as we strive to minimize our environmental impact. We're passionate about education, bridging the digital divide, and giving back to our communities. These values shape our
                    actions and guide us in delivering exceptional service and products.
                </div>
            </div>
            <div class="container3" style="height:490px;">
                <div class="text3">
                    <br />
                    <br />
                    <br />
                    <br />
                    <h3>Contact Us</h3>
                    <br />
                    <h3><i class="fa-solid fa-location-dot"></i> &nbsp;Sundar, Dulari</h3>
                    <br />
                    <h3><i class="fa-solid fa-phone"></i> &nbsp;9810654378</h3>
                    <br />
                    <h3><i class="fa-solid fa-envelope"></i> &nbsp;info@laptopnexus.com</h3>
                </div>
                <div class="box4">
                    <h3>Send ur message to us</h3>
                    <br />
                    <input type="number" placeholder="Your Phone Number" style="height: 30px; border-radius: 5px;" />
                    <br />
                    <br />
                    <input type="email" placeholder="Enter your Email" style="height: 30px; border-radius: 5px;" />
                    <br />
                    <br />
                    <textarea type="message" rows="5" placeholder="Input your message" style="border-radius: 5px;"> </textarea>
                    <br />
                    
                    <button type="submit" style="row: 4; background-color: skyblue; width:80px; border-radius: 5px; height: 40px; margin-top:10px;">Submit</button>
                </div>
            </div>
        </div>
        <script src="https://kit.fontawesome.com/e32763a4cc.js" crossorigin="anonymous"></script>

</body>
</html>