<%-- 
    Document   : ProductDetailManagerView
    Created on : 25-Feb-2025, 10:56:39
    Author     : kiuth
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Product Detail</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome & Google Fonts -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Montserrat', sans-serif;
            }
            .product-card {
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.15);
                overflow: hidden;
                margin: 40px auto;
                max-width: 1200px;
            }
            .card-header {
                background: #7D69FF; /* Tông màu tím */
                color: #fff;
                text-align: center;
                font-size: 1.75rem;
                font-weight: 700;
                padding: 20px;
            }
            .card-body {
                padding: 20px 40px;
            }
            .product-content {
                display: flex;
                flex-wrap: wrap;
            }
            /* Left: Product Images */
            .product-images {
                flex: 1 1 40%;
                padding: 20px;
                text-align: center;
            }
            .main-image {
                width: 100%;
                max-width: 500px;
                border: 3px solid #7D69FF;
                border-radius: 8px;
                margin-bottom: 20px;
                transition: transform 0.3s;
            }
            .main-image:hover {
                transform: scale(1.03);
            }
            .product-gallery {
                display: flex;
                justify-content: center;
                gap: 10px;
                flex-wrap: wrap;
            }
            .product-gallery img {
                width: 70px;
                height: 70px;
                object-fit: cover;
                border: 2px solid #ccc;
                border-radius: 4px;
                cursor: pointer;
                transition: transform 0.2s, border-color 0.2s;
            }
            .product-gallery img:hover {
                transform: scale(1.1);
                border-color: #7D69FF;
            }
            /* Right: Product Information */
            .product-info {
                flex: 1 1 60%;
                padding: 20px;
            }
            .product-info h2 {
                font-size: 2.2rem;
                font-weight: 700;
                color: #7D69FF;
                margin-bottom: 20px;
            }
            .info-item {
                margin-bottom: 15px;
                font-size: 1rem;
            }
            .info-label {
                font-weight: 700;
                color: #6c757d;
            }
            .info-value {
                color: #333;
            }
            .badge {
                font-size: 1rem;
                padding: 0.5em 0.75em;
            }
            .back-btn {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="product-card">
                <div class="card-header">
                    Product Details
                </div>
                <div class="card-body">
                    <div class="product-content row">
                        <!-- Left: Product Images -->
                        <div class="col-md-5 product-images">
                            <c:if test="${not empty product.image}">
                                <img id="mainImage" class="main-image" 
                                     src="${pageContext.request.contextPath}/assets/imgs/Products/${product.image}" 
                                     alt="${product.fullName} - Main Image">
                            </c:if>
                            <div class="product-gallery">
                                <c:if test="${not empty product.image1}">
                                    <img src="${pageContext.request.contextPath}/assets/imgs/Products/${product.image1}" 
                                         alt="${product.fullName} - Image 1" onclick="swapImage(this)">
                                </c:if>
                                <c:if test="${not empty product.image2}">
                                    <img src="${pageContext.request.contextPath}/assets/imgs/Products/${product.image2}" 
                                         alt="${product.fullName} - Image 2" onclick="swapImage(this)">
                                </c:if>
                                <c:if test="${not empty product.image3}">
                                    <img src="${pageContext.request.contextPath}/assets/imgs/Products/${product.image3}" 
                                         alt="${product.fullName} - Image 3" onclick="swapImage(this)">
                                </c:if>
                            </div>
                        </div>
                        <!-- Right: Product Information -->
                        <div class="col-md-7 product-info">
                            <h2>${product.fullName}</h2>
                            <div class="info-item">
                                <span class="info-label">Product ID:</span>
                                <span class="info-value">${product.productId}</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Category:</span>
                                <span class="info-value">${product.categoryName}</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Brand:</span>
                                <span class="info-value">${product.brandName}</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Model:</span>
                                <span class="info-value">${product.model}</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Attributes:</span>
                                <c:if test="${not empty product.attributeDetails}">
                                    <ul class="list-unstyled">
                                        <c:forEach var="attr" items="${product.attributeDetails}">
                                            <li><strong>${attr.attributeName}:</strong> ${attr.attributeInfor}</li>
                                            </c:forEach>
                                    </ul>
                                </c:if>
                                <c:if test="${empty product.attributeDetails}">
                                    <span class="text-danger">No attributes found</span>
                                </c:if>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Stock:</span>
                                <span class="info-value">${product.stock}</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Price:</span>
                                <span class="info-value">${product.price}</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Description:</span>
                                <span class="info-value">${product.description}</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Status:</span>
                                <span class="badge ${product.deleted == 1 ? 'bg-danger' : 'bg-success'}">
                                    ${product.deleted == 1 ? 'Deleted' : 'Active'}
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="back-btn">
                        <a href="ProductListServlet" class="btn btn-primary">Back to List</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- JavaScript: Swap Main Image -->
        <script>
            function swapImage(img) {
                const mainImg = document.getElementById("mainImage");
                const tempSrc = mainImg.src;
                mainImg.src = img.src;
                img.src = tempSrc;
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
