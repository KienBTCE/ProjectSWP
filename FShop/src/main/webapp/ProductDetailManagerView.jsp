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
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f8f9fa;
            }
            .container {
                max-width: 900px;
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            }
            .table th {
                background: #7D69FF;
                color: white;
                width: 30%;
                text-align: left;
            }
            .image-container {
                text-align: right;
            }
            .product-image {
                max-width: 370px;
                height: auto;
            }
            .btn-back {
                background-color: #7D69FF;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                text-decoration: none;
                display: block;
                text-align: center;
                margin-top: 20px;
            }
            .btn-back:hover {
                background-color: #5a4edc;
            }
            .product-details {
                display: flex;
                align-items: center;
                gap: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h3 class="mb-4 text-center">Product Detail</h3>
            <div class="product-details">

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
                                <th>Model</th>
                                <td>${product.getModel()}</td>
                            </tr>
                            <tr>
                                <th>Product Name</th>
                                <td>${product.getFullName()}</td>
                            </tr>
                            <tr>
                                <th>Stock</th>
                                <td>${product.getStock()}</td>
                            </tr>
                            <tr>
                                <th>Price</th>
                                <td>${product.getPrice()}</td>
                            </tr>
                            <tr>
                                <th>Description</th>
                                <td>${product.getDescription()}</td>
                            </tr>
                            <tr>
                                <th>Status</th>
                                <td>
                                    <span class="badge ${product.getDeleted() == 1 ? 'bg-danger' : 'bg-success'}">
                                        ${product.getDeleted() == 1 ? 'Deleted' : 'Active'}
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
                <div class="image-container">
                    <c:set var="imagePath" value="${product.image}" />
                    <c:if test="${not empty imagePath}">
                        <img src="<c:out value='${pageContext.request.contextPath}'/>/assets/imgs/Products/<c:out value='${imagePath}'/>" 
                             class="product-image" 
                             alt="${product.fullName}" 
                             width="150" height="150"/>
                    </c:if>
                </div>
            </div>
            <a href="ProductListServlet" class="btn-back">Back to List</a>
        </div>
    </body>
</html>
