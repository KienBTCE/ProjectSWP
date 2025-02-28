<%-- 
    Document   : ProductDetailManagerView
    Created on : 25-Feb-2025, 10:56:39
    Author     : kiuth
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product Detail</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                display: flex;
            }
            .sidebar {
                width: 250px;
                height: 97vh;
                background: #FFFFFF;
                color: black;
                padding-top: 20px;
                box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);
                border-radius: 10px;
                margin-top: 10px;
            }
            .sidebar a {
                color: #7A7D90;
                text-decoration: none;
                padding: 10px;
                display: block;
            }
            .sidebar a:hover {
                background: #7D69FF;
                color: white;
                width: 90%;
                font-weight: bold;
                border-radius: 10px;
            }
            .content {
                flex-grow: 1;
                padding: 20px;
                display: flex;
                flex-direction: column;
                gap: 20px;
            }
            .header {
                display: flex;
                justify-content: right;
                align-items: center;
                padding: 10px;
                background: #FFFFFF;
                box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);
                border-radius: 10px;
                height: 85px;
            }
            .icon {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                object-fit: cover;
            }
            .table-container {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
                width: 100%; /* Kéo dài bảng ra hết chiều ngang trống */
            }
            .table th {
                background: #7D69FF;
                color: white;
                width: 20%;
                text-align: left;
            }
            .btn-back {
                background-color: #7D69FF;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                text-decoration: none;
                margin-top: 20px;
            }
            .btn-back:hover {
                background-color: #5a4edc;
            }
        </style>
    </head>
    <body>

        <div class="content">

            <div class="table-container">
                <h3>Product Detail</h3>
                <table class="table table-bordered">
                    <c:choose>
                        <c:when test="${product != null}">
                            <tr>
                                <th>Product ID</th>
                                <td>${product.getProductId()}</td>
                            </tr>
                            <tr>
                                <th>Category</th>
                                <td>${product.getCategoryName()}</td>
                            </tr>
                            <tr>
                                <th>Brand</th>
                                <td>${product.getBrandName()}</td>
                            </tr>
                            <tr>
                                <th>Product Name</th>
                                <td>${product.getFullName()}</td>
                            </tr>
                            <tr>
                                <th>Price</th>
                                <td>${product.getPrice()}</td>
                            </tr>
                            <tr>
                                <th>Quantity</th>
                                <td>${product.getQuantity()}</td>
                            </tr>
                            <tr>
                                <th>Status</th>
                                <td>
                                    <span class="badge ${product.getDeleted() == 1 ? 'bg-success' : 'bg-danger'}">
                                        ${product.getDeleted() == 1 ? 'Deleted' : 'Activate'}
                                    </span>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="2" class="text-danger text-center">Product not found!</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </table>
                <a href="ProductListServlet" class="btn-back">Back to List</a>
            </div>
        </div>
    </body>
</html>
