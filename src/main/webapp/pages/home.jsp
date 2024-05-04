<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>Home</title>
      <%@ include file="./partials/header.jsp"%>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/home.css " />
   </head>
   <body>
      <div id="home">
         <h1 class= "para">At Nexus Laptop,<br> we have a fantastic selection of diverse laptop options available.</h1>
         <div class= "image" > <img src="${pageContext.request.contextPath}/images/home.jpg" alt="" class="img"> </div>
         <div class= "recc">
            <h2> Recommended </h2>
            <div class="top">
               <div class="three">
                  <div class="topimage">
                     <img src="${pageContext.request.contextPath}/images/product.png}" alt="" class="productimg">
                  </div>
                  <p class="productname"> gff</p>
                  <div class="rating">
                     <img src="${pageContext.request.contextPath}/images/rate.png" alt="" class="rateimg">
                     <img src="${pageContext.request.contextPath}/images/rate.png" alt="" class="rateimg">
                     <img src="${pageContext.request.contextPath}/images/rate.png" alt="" class="rateimg">
                     <img src="${pageContext.request.contextPath}/images/rate.png" alt="" class="rateimg">
                  </div>
                  <div class="add">
                     <a href="" class="cartbutton"> Add To Cart</a>
                     <a href="" class="productprice"> Price </a>
                  </div>
               </div>
               <div class="three">
                  <div class="topimage">
                     <img src="${pageContext.request.contextPath}/images/product.png}" alt="" class="productimg">
                  </div>
                  <p class="productname"> gff</p>
                  <div class="rating">
                     <img src="${pageContext.request.contextPath}/images/rate.png" alt="" class="rateimg">
                     <img src="${pageContext.request.contextPath}/images/rate.png" alt="" class="rateimg">
                     <img src="${pageContext.request.contextPath}/images/rate.png" alt="" class="rateimg">
                     <img src="${pageContext.request.contextPath}/images/rate.png" alt="" class="rateimg">
                  </div>
                  <div class="add">
                     <a href="" class="cartbutton"> Add To Cart</a>
                     <a href="" class="productprice"> Price </a>
                  </div>
               </div>
               <div class="three">
                  <div class="topimage">
                     <img src="${pageContext.request.contextPath}/images/product.png}" alt="" class="productimg">
                  </div>
                  <p class="productname"> gff</p>
                  <div class="rating">
                     <img src="${pageContext.request.contextPath}/images/rate.png" alt="" class="rateimg">
                     <img src="${pageContext.request.contextPath}/images/rate.png" alt="" class="rateimg">
                     <img src="${pageContext.request.contextPath}/images/rate.png" alt="" class="rateimg">
                     <img src="${pageContext.request.contextPath}/images/rate.png" alt="" class="rateimg">
                  </div>
                  <div class="add">
                     <a href="" class="cartbutton"> Add To Cart</a>
                     <a href="" class="productprice"> Price </a>
                  </div>
               </div>
            </div>
            <div class="explore">
               <a href="Product.jsp" class="productbutton"> Explore More</a>
            </div>
         </div>
         <div class= "new">
            <h3> Newley Added</h3>
            <div class="bottom">
               <div class="newly">
                  <div class="bottomimage">
                     <img src="${pageContext.request.contextPath}/images/product.png}" alt="" class="productimg">
                  </div>
                  <p class="productname"> gff</p>
                  <div class="add">
                     <a href="" class="cartbutton"> Add To Cart</a>
                     <a href="" class="productprice"> Price </a>
                  </div>
               </div>
               <div class="newly">
                  <div class="bottomimage">
                     <img src="${pageContext.request.contextPath}/images/product.png}" alt="" class="productimg">
                  </div>
                  <p class="productname"> gff</p>
                  <div class="add">
                     <a href="" class="cartbutton"> Add To Cart</a>
                     <a href="" class="productprice"> Price </a>
                  </div>
               </div>
               <div class="newly">
                  <div class="bottomimage">
                     <img src="${pageContext.request.contextPath}/images/product.png}" alt="" class="productimg">
                  </div>
                  <p class="productname"> gff</p>
                  <div class="add">
                     <a href="cart.jsp" class="cartbutton"> Add To Cart</a>
                     <a href="" class="productprice"> Price </a>
                  </div>
               </div>
            </div>
            <div class="explore">
               <a href="Product.jsp" class="productbutton"> Explore More</a>
            </div>
         </div><br><br>
         <%@ include file="./partials/footer.jsp"%>
      </div>
   </body>
</html>