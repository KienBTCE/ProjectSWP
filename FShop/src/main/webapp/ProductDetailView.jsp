<%-- 
    Document   : ProductDetailView
    Created on : 25-Feb-2025, 10:56:52
    Author     : kiuth
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product Detail</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            .container {
                max-width: 800px;
                margin: 50px auto;
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            }
            .product-card {
                display: flex;
                align-items: flex-start;
                gap: 20px;
                flex-wrap: wrap;
            }
            .product-image {
                max-width: 250px;
                height: auto;
                border-radius: 10px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            }
            .product-info {
                flex: 1;
                min-width: 300px;
            }
            .btn-back, .btn-add-cart {
                padding: 10px 20px;
                border-radius: 5px;
                text-decoration: none;
                display: inline-block;
                margin-top: 10px;
            }
            .btn-back {
                background-color: #7D69FF;
                color: white;
                border: none;
            }
            .btn-add-cart {
                background-color: #28a745;
                color: white;
                border: none;
            }
            .btn-back:hover {
                background-color: #5a4edc;
            }
            .btn-add-cart:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <c:choose>
                <c:when test="${product != null}">
                    <div class="product-card">
                        <div class="image-container">
                            <c:set var="imagePath" value="${product.image}" />
                            <c:if test="${not empty imagePath}">
                                <img src="<c:out value='${pageContext.request.contextPath}'/>/assets/imgs/Products/<c:out value='${imagePath}'/>" 
                                     class="product-image" 
                                     alt="${product.fullName}" 
                                     width="150" height="150"/>
                            </c:if>
                        </div>
                        <div class="product-info">
                            <h3>${product.getFullName()}</h3>
                            <p><strong>Price:</strong> $${product.getPrice()}</p>
                            <p><strong>Quantity:</strong> ${product.getStock()}</p>
                            <form action="addToCart?productID=${product.getProductId()}" method="POST" class="d-inline">
                                <div class="quantity-controls">
                                    <button style="border: 1px solid white;" type="button" onclick="decreaseQuantity()">-</button>
                                    <input type="number" name="quantity" id="quantity" value="1" min="1" max="${product.getStock()}">
                                    <button style="border: 1px solid white;" type="button" onclick="increaseQuantity()">+</button>
                                </div>
                                <input type="submit" value="Add to cart" class="btn-add-cart">
                            </form>

                            <a href="ViewProductServlet" class="btn-back">Back to List</a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <p class="text-center">Product not found.</p>
                </c:otherwise>
            </c:choose>
        </div>
        <script>
            function increaseQuantity() {
                const quantityInput = document.getElementById('quantity');
                const maxQuantity = parseInt(quantityInput.max);
                if (!quantityInput.hasAttribute('readonly') && quantityInput.value < maxQuantity) {
                    quantityInput.value = parseInt(quantityInput.value) + 1;
                }
            }

            function decreaseQuantity() {
                const quantityInput = document.getElementById('quantity');
                if (quantityInput.value > 1) {
                    quantityInput.value = parseInt(quantityInput.value) - 1;
                }
            }
        </script>
    </body>
</html>
