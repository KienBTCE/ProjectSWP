<%-- 
    Document   : ProductDetailManagerView
    Created on : 25-Feb-2025, 10:56:39
    Author     : kiuth
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product Detail</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                background-color: #f8f9fa;
            }
            .table th {
                background: #7D69FF;
                color: white;
                width: 35%;
            }
            .badge {
                font-size: 100%;
            }
            .product-img {
                max-width: 100%;
                height: auto;
            }
        </style>
    </head>
    <body>
        <div class="container my-5">
            <div class="row">
                <!-- Product details table -->
                <div class="col-md-8">
                    <table class="table table-bordered">
                        <c:choose>
                            <c:when test="${product != null}">
                                <tr>
                                    <th>Product ID</th>
                                    <td>${product.productId}</td>
                                </tr>
                                <tr>
                                    <th>Category</th>
                                    <td>${product.categoryName}</td>
                                </tr>
                                <tr>
                                    <th>Brand</th>
                                    <td>${product.brandName}</td>
                                </tr>
                                <tr>
                                    <th>Model</th>
                                    <td>${product.model}</td>
                                </tr>
                                <tr>
                                    <th>Product Name</th>
                                    <td>${product.fullName}</td>
                                </tr>
                                <tr>
                                    <th>Attributes</th>
                                    <td>
                                        <c:if test="${not empty product.attributeDetails}">
                                            <ul class="list-unstyled mb-0">
                                                <c:forEach var="attr" items="${product.attributeDetails}">
                                                    <li>
                                                        <strong>${attr.attributeName}:</strong> ${attr.attributeInfor}
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </c:if>
                                        <c:if test="${empty product.attributeDetails}">
                                            <span class="text-danger">No attributes found</span>
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Stock</th>
                                    <td>${product.stock}</td>
                                </tr>
                                <tr>
                                    <th>Price</th>
                                    <td>${product.price}</td>
                                </tr>
                                <tr>
                                    <th>Description</th>
                                    <td>${product.description}</td>
                                </tr>
                                <tr>
                                    <th>Status</th>
                                    <td>
                                        <span class="badge ${product.deleted == 1 ? 'bg-danger' : 'bg-success'}">
                                            ${product.deleted == 1 ? 'Deleted' : 'Active'}
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
                </div>
                <!-- Product images -->
                <div class="col-md-4">
                    <div class="row">
                        <!-- Ảnh chính -->
                        <c:if test="${not empty product.image}">
                            <div class="col-6 mb-3">
                                <img src="${pageContext.request.contextPath}/assets/imgs/Products/${product.image}" 
                                     class="img-fluid rounded product-img" alt="${product.fullName} - Image 1">
                            </div>
                        </c:if>
                        <!-- Ảnh thứ 2 -->
                        <c:if test="${not empty product.image1}">
                            <div class="col-6 mb-3">
                                <img src="${pageContext.request.contextPath}/assets/imgs/Products/${product.image1}" 
                                     class="img-fluid rounded product-img" alt="${product.fullName} - Image 2">
                            </div>
                        </c:if>
                        <!-- Ảnh thứ 3 -->
                        <c:if test="${not empty product.image2}">
                            <div class="col-6 mb-3">
                                <img src="${pageContext.request.contextPath}/assets/imgs/Products/${product.image2}" 
                                     class="img-fluid rounded product-img" alt="${product.fullName} - Image 3">
                            </div>
                        </c:if>
                        <!-- Ảnh thứ 4 -->
                        <c:if test="${not empty product.image3}">
                            <div class="col-6 mb-3">
                                <img src="${pageContext.request.contextPath}/assets/imgs/Products/${product.image3}" 
                                     class="img-fluid rounded product-img" alt="${product.fullName} - Image 4">
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <!-- Back button -->
            <div class="text-start mt-3">
                <a href="ProductListServlet" class="btn btn-primary">Back to List</a>
            </div>
        </div>
    </body>
</html>
