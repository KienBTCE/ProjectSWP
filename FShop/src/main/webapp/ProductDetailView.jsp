<%-- 
    Document   : ProductDetailView
    Created on : 25-Feb-2025, 10:56:52
    Author     : kiuth
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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
        .feedback-section {
            margin-top: 30px;
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
                            <img src="${pageContext.request.contextPath}/assets/imgs/Products/${imagePath}" 
                                 class="product-image" 
                                 alt="${product.fullName}" 
                                 width="150" height="150"/>
                        </c:if>
                    </div>
                    <div class="product-info">
                        <h3>${product.fullName}</h3>
                        <p><strong>Price:</strong> $${product.price}</p>
                        <p><strong>Quantity:</strong> ${product.stock}</p>
                        <form action="addToCart?productID=${product.productId}" method="POST" class="d-inline">
                            <div class="quantity-controls d-flex align-items-center mb-3">
                                <button type="button" onclick="decreaseQuantity()" class="btn btn-outline-secondary">-</button>
                                <input type="number" name="quantity" id="quantity" value="1" min="1" max="${product.stock}" class="form-control mx-2" style="width: 80px;"/>
                                <button type="button" onclick="increaseQuantity()" class="btn btn-outline-secondary">+</button>
                            </div>
                            <button type="submit" class="btn btn-success">Add to cart</button>
                        </form>
                        <a href="ViewProductServlet" class="btn btn-primary mt-3">Back to List</a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <p class="text-center">Product not found.</p>
            </c:otherwise>
        </c:choose>

        
        <div class="mt-4">
            <button type="button" class="btn btn-info" onclick="toggleFeedback()">View Feedback</button>
        </div>

        <!-- Container ch?a feedback ???c t?i v? -->
        <div id="feedbackContainer" class="feedback-section"></div>
    </div>

    <script>
        function increaseQuantity() {
            const quantityInput = document.getElementById('quantity');
            const maxQuantity = parseInt(quantityInput.max);
            let currentValue = parseInt(quantityInput.value);
            if (currentValue < maxQuantity) {
                quantityInput.value = currentValue + 1;
            }
        }
        function decreaseQuantity() {
            const quantityInput = document.getElementById('quantity');
            let currentValue = parseInt(quantityInput.value);
            if (currentValue > 1) {
                quantityInput.value = currentValue - 1;
            }
        }
        // Hàm toggle feedback: n?u feedback ?ang hi?n th? thì ?n ?i, n?u không thì g?i AJAX load feedback
        function toggleFeedback() {
            const container = document.getElementById("feedbackContainer");
            // N?u container có n?i dung, ?n nó ?i
            if (container.innerHTML.trim() !== "") {
                container.innerHTML = "";
            } else {
                const productId = "${product.productId}";
                fetch("CommentServlet?productId=" + productId)
                    .then(response => response.text())
                    .then(html => {
                        container.innerHTML = html;
                    })
                    .catch(error => console.error("Error loading feedback:", error));
            }
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
