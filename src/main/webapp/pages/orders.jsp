<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/order.css">
        
    </head>
    <body>
        <%@ include file="./includes/header.jsp" %> 
        <%@ include file="./includes/sidebar.jsp" %>
        <div id="ordersBtn">
            <h2>Orders</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>O.N.</th>
                        <th>Customer</th>
                        <th>Contact</th>
                        <th>OrderDate</th>
                        <th>Order Status</th>
                        <th>More Details</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tr>
                    <td>O-1</td>
                    <td>Pratima Limbu</td>
                    <td>+9779830649153</td>
                    <td>2024-04-25</td>
                    <td>
                        <button style="height: 37px; background-color: rgb(247, 132, 132); color: white; width: 70px; border-radius: 5px; margin-left: 20px;">Pending</button>
                    </td>
                    <td>
                        <a id="view-order-details" class="btn btn-primary openPopup" style="cursor: pointer;">View</a>
                    </td>
                    <td>
                        <button style="height: 37px; background-color: rgb(247, 132, 132); color: white; width: 70px; border-radius: 5px; margin-left: 20px;">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>O-2</td>
                    <td>Jeena Rai</td>
                    <td>+9779830649153</td>
                    <td>2024-04-20</td>
                    <td>
                        <button style="height: 37px; background-color: rgb(99, 179, 244); color: white; width: 70px; border-radius: 5px; margin-left: 20px;">Delivered</button>
                    </td>
                    <td>
                        <a id="view-order-details" class="btn btn-primary openPopup" style="cursor: pointer;">View</a>
                    </td>
                    <td>
                        <button style="height: 37px; background-color: rgb(247, 132, 132); color: white; width: 70px; border-radius: 5px; margin-left: 20px;">Delete</button>
                    </td>
                </tr>
            </table>
            <form>
                <div id="popup-form" class="popup" style="display: none;">
                    <div class="form-group">
                        <i class="fa-solid fa-xmark" style="margin-left: 1010px;"></i>
                        <h2>Order Details</h2>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>S.N.</th>
                                    <th>Product Name</th>
                                    <th>Quantity</th>
                                    <th>Unit Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Lenovo</td>
                                    <td>2</td>
                                    <td>80000</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>
        <script>
            var viewOrderDetailsBtn = document.getElementById("view-order-details");
            var popupForm = document.getElementById("popup-form");
            var closeIcon = popupForm.querySelector(".fa-solid.fa-xmark");

            viewOrderDetailsBtn.addEventListener("click", function () {
                popupForm.style.display = "block";
            });

            closeIcon.addEventListener("click", function () {
                popupForm.style.display = "none";
            });
        </script>
        <script src="https://kit.fontawesome.com/c69827d687.js" crossorigin="anonymous"></script>
    </body>
</html>
