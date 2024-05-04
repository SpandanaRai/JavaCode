<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/updateProduct.css">
    </head>
    <body>
    	<%@ include file="./includes/header.jsp" %> 
        <%@ include file="./includes/sidebar.jsp" %>
        <div class="container">
            <a href="adminProduct.jsp">
                <i class="fa fa-times" style="margin-left: 1025px;"></i>
            </a>
            <h2>Edit Product Details</h2>

            <form id="update-Items" onsubmit="updateItems()" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" id="product_id" value="" hidden />
                </div>
                <br />
                <div class="form-group">
                    <label for="name">Product Name:</label><br />
                    <input type="text" class="form-control" id="p_name" value="" />
                </div>
                <div class="form-group">
                    <label for="desc">Product Description:</label><br />
                    <input type="text" class="form-control" id="p_desc" value="" style="height: 100px;" />
                </div>
                <div class="form-group">
                    <label for="price">Unit Price:</label><br />
                    <input type="number" class="form-control" id="p_price" value="" />
                </div>
                <div class="form-group">
                    <label>Category:</label><br />
                    <select id="category" style="margin-top: 10px; height: 36px; width: 36%; border: 1px solid rgb(79, 73, 73);">
                        <option value="">Select Category</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Stock Quantity:</label><br />
                    <input type="number" class="form-control" id="p_qty" value="" style="margin-top: 10px; height: 24px; width: 35%;" />
                </div>

                <div class="form-group">
                    <img width="200px" height="150px" src="" />
                    <div>
                        <label for="file">Choose Image:</label>
                        <input type="text" id="existingImage" class="form-control" value="" hidden />
                        <input type="file" id="newImage" value="" style="height: 30px; border: none;" />
                    </div>
                </div>
                <br />
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Update Product</button>
                </div>
            </form>
        </div>
        <script src="https://kit.fontawesome.com/c69827d687.js" crossorigin="anonymous"></script>
    </body>
</html>
