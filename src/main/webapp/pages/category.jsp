<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/category.css">
    </head>
    <body>
        <%@ include file="./includes/header.jsp" %> 
        <%@ include file="./includes/sidebar.jsp" %>
        <div class="category-container">
            <h2 style="font-family: Montserrat, sans-serif;">Category Items</h2>
            <br />
            <table>
                <thead>
                    <tr>
                        <th class="text-center">S.N.</th>
                        <th class="text-center">Category Name</th>
                        <th class="text-center" colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Sample Category 1</td>
                        <td>
                            <button style="height: 40px; background-color: rgb(247, 132, 132); color: white; width: 70px; border-radius: 5px; margin-left: 20px;">Delete</button>
                        </td>
                    </tr>
                </tbody>
            </table>

            <button id="add-category-btn" style="height: 40px; background-color: #6c757d; color: white; border-radius: 5px; width: 120px; font-family: Montserrat, sans-serif; margin-left:5px;">Add Category</button>

            <div id="category-form-container" class="form-container" style="display: none;">
                <i class="fa-solid fa-xmark" style="margin-left: 339px;"></i>
                <h2 style="margin-top: -5px;">New Category Item</h2>
                <form>
                    <label for="category">Category Name:</label>
                    <input type="text" id="category" name="category" /><br />
                    <button type="submit">Add Category</button>
                </form>
            </div>
        </div>
        <script>
            var addCategoryBtn = document.getElementById("add-category-btn");
            var categoryFormContainer = document.getElementById("category-form-container");
            var closeIcon = categoryFormContainer.getElementsByClassName("fa-solid fa-xmark")[0];

            addCategoryBtn.addEventListener("click", function () {
                categoryFormContainer.style.display = "block";
            });

            closeIcon.addEventListener("click", function () {
                categoryFormContainer.style.display = "none";
            });
        </script>
        <script src="https://kit.fontawesome.com/c69827d687.js" crossorigin="anonymous"></script>
    </body>
</html>
