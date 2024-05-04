<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.ProductModel"%>
<%@page import="util.StringUtils"%>
<%@page import="controller.DatabaseController"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/adminProduct.css" />
    </head>
    <body>
        <%@ include file="./includes/header.jsp" %> 
        <%@ include file="./includes/sidebar.jsp" %>
	    <%
	    DatabaseController databaseController = new DatabaseController();
	    List<ProductModel>product = databaseController.getAllProducts();
		%>
        <div class="product-category">
            <h2>Product Items</h2>
            <form action="${pageContext.request.contextPath}/ProductServlet" method="post">
            <br />
            <table class="table">
                <thead>
                    <tr>
                        <th class="text-center">S.N.</th>
                        <th class="text-center">Product Image</th>
                        <th class="text-center">Product Name</th>
                        <th class="text-center">Product Description</th>
                        <th class="text-center">Category Name</th>
                        <th class="text-center">Unit Price</th>
                        <th class="text-center" colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                <% for (int i = 0; i < product.size(); i++) { %>
                <tr>
                    <td><%= i + 1 %></td>
                    <td><img height="100px" src="<%= product.get(i).getImageUrl() %>" /></td>
                    <td><%= product.get(i).getName() %></td>
                    <td><%= product.get(i).getDescription() %></td>
                    <td><%= product.get(i).getCategoryName() %></td>
                    <td><%= product.get(i).getPrice() %></td>
                    <td><button id="edit-button" style="height: 36px; background-color: rgb(96, 96, 223); color: white; width: 70px; border-radius: 5px; margin-left: 80px;">Edit</button></td>
                    <td><button style="height: 36px; background-color: rgb(247, 132, 132); color: white; width: 70px; border-radius: 5px;" onclick="itemDelete('1')">Delete</button></td>
                </tr>
                <% } %>
                </tbody>
            </table>

            <!-- Trigger the modal with a button -->
            <button type="button" id="add-product-btn" style="height: 40px; background-color: #6c757d; color: white; border-radius: 5px;">Add Product</button>

            <div id="popup-form" class="popup" style="display: none;">
                <i class="fa-solid fa-xmark" style="margin-left: 380px;"></i>
                <h2>New Product Item</h2>
               		<form action="${pageContext.request.contextPath}/AddProductServlet" method="post" enctype="multipart/form-data">
			<div class="mb-4">
				<label for="name" class="block text-gray-700 font-bold mb-2">Product
					Name:</label> <input type="text" id="name" name="name"
					class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
			</div>
			<div class="mb-4">
				<label for="description" class="block text-gray-700 font-bold mb-2">Description:</label>
				<textarea type="text" id="description" name="description" rows="2"
					class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"></textarea>
			</div>
			<div class="mb-4">
				<label for="price" class="block text-gray-700 font-bold mb-2">Price:</label>
				<input type="number" id="price" name="price"
					class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
			</div>
			<div class="mb-4">
				<label for="stock" class="block text-gray-700 font-bold mb-2">Stock:</label>
				<input type="number" min=1 id="stock" name="stock"
					class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
			</div>
			<label for="category" class="block text-gray-700 font-bold mb-2">Category:</label>
			<select id="category" name="category"
				class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
				<option value="" disabled selected>Select Category</option>
				<option value="1">Ultrabooks</option>
				<option value="2">Gaming</option>
				<option value="3">2-in-1</option>
				<option value="4">Business</option>
				<option value="5">Budget</option>
				<option value="6">Workstation</option>
				<option value="7">Chromebooks</option>
				<option value="8">Student</option>
				<option value="9">Multimedia</option>
				<option value="10">Thin and Light</option>
			</select>
			<div class="mb-4">
				<br><label for="image" class="block text-gray-700 font-bold mb-2">Image:</label>
				<input id="image" type="file" accept="image/*" id="image" multiple
					name="image"
					class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
			</div>
<br>
			<div class="flex items-center justify-between mt-5">
				<button type="submit"
					class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
					Add Product</button>
			</div>
	</div>
	</form>
            </div>
        </div>

        <script>
            var addProductBtn = document.getElementById("add-product-btn");
            var popupForm = document.getElementById("popup-form");
            var closeIcon = popupForm.getElementsByClassName("fa-solid fa-xmark")[0];

            addProductBtn.addEventListener("click", function () {
                popupForm.style.display = "block";
            });
            closeIcon.addEventListener("click", function () {
                popupForm.style.display = "none";
            });
        </script>
        <script>
            document.getElementById("edit-button").addEventListener("click", function () {
                window.location.href = "updateProduct.jsp";
            });
        </script>
        <script src="https://kit.fontawesome.com/c69827d687.js" crossorigin="anonymous"></script>
    </body>
</html>
