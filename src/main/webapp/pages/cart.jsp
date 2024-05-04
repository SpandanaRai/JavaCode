<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/cart.css" />
    </head>
    <body>
        <div id="cartpage">
            <div class="cartnav">
                <h1>
                    Add To Cart
                </h1>
            </div>

            <div class="cart">
                <p>Total Amount: <span id="totalamt"></span></p>
                <button id="checkoutbutton">Checkout</button>
            </div>
        </div>
    </body>
</html>
