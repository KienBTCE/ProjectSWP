<%-- 
    Document   : ProductDetailView
    Created on : 25-Feb-2025, 10:56:52
    Author     : kiuth
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product Detail</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Google Font (optional) -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./assets/css/popup.css"/>
        <style>
            body {
                font-family: 'Montserrat', sans-serif;
                background-color: #f5f5f5;
                color: #333;
            }
            .product-container {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
                padding: 20px;
                margin-top: 20px;
            }
            /* Gallery */
            .product-gallery {
                margin-bottom: 20px;
            }
            /* Larger main image */
            .product-gallery .main-image {
                width: 100%;
                max-width: 600px; /* increased size */
                border: 2px solid #ddd;
                border-radius: 8px;
                display: block;
                margin: 0 auto; /* center the image */
            }
            .sub-images {
                display: flex;
                gap: 10px;
                margin-top: 15px;
                justify-content: center; /* center the sub-images */
            }
            .sub-images img {
                width: 70px;
                height: 70px;
                object-fit: cover;
                border: 2px solid #ddd;
                border-radius: 4px;
                cursor: pointer;
                transition: transform 0.2s, border-color 0.2s;
            }
            .sub-images img:hover {
                transform: scale(1.05);
                border-color: #ff5722;
            }

            /* Product Info */
            .product-info {
                background: #fafafa; /* subtle background for emphasis */
                border-radius: 8px;
                padding: 20px;
            }
            .product-info h1 {
                font-size: 2rem; /* larger title */
                margin-bottom: 10px;
                font-weight: 700;
                line-height: 1.2;
            }
            .rating {
                color: #f59e0b; /* yellow star color */
                font-size: 1.25rem; /* slightly bigger stars */
            }
            .text-secondary {
                font-size: 0.95rem;
            }
            /* Highlight price */
            .price {
                color: #d0011b;
                font-size: 2rem; /* larger price font */
                font-weight: 700;
                margin-bottom: 15px;
            }
            /* Buttons */
            .btn-buy-now {
                background-color: #d0011b;
                border: none;
                color: #fff;
                font-weight: 600;
                padding: 12px 20px;
                border-radius: 6px;
                font-size: 1rem;
            }
            .btn-buy-now:hover {
                background-color: #b60015;
            }
            .btn-add-cart {
                background-color: #ff5722;
                border: none;
                color: #fff;
                font-weight: 600;
                padding: 12px 20px;
                border-radius: 6px;
                font-size: 1rem;
            }
            .btn-add-cart:hover {
                background-color: #e64a19;
            }
            /* Quantity Controls */
            .quantity-controls {
                display: inline-flex;
                align-items: center;
                margin-left: 15px;
            }
            .quantity-controls input {
                width: 60px;
                text-align: center;
                border: 1px solid #ccc;
                margin: 0 5px;
                border-radius: 4px;
                font-size: 1rem;
            }
            .quantity-controls button {
                background: #fff;
                border: 1px solid #ccc;
                width: 34px;
                height: 34px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 1.2rem;
                line-height: 1;
            }
            .quantity-controls button:hover {
                background: #f0f0f0;
            }
            /* Shipping Info */
            .shipping-info {
                background: #fff;
                border: 1px solid #eee;
                border-radius: 6px;
                padding: 15px;
                margin-top: 20px;
            }
            .shipping-info p {
                margin: 0 0 6px;
                font-size: 0.95rem;
            }
            .action-buttons .btn {
                margin-right: 10px;
            }
            .share-like a {
                margin-right: 15px;
                color: #666;
                text-decoration: none;
                font-weight: 500;
            }
            .share-like a:hover {
                color: #333;
            }
            /* Table for attributes */
            .product-attributes {
                margin-top: 20px;
            }
            .product-attributes h5 {
                font-weight: 700;
                margin-bottom: 15px;
            }
            /* Responsive */
            @media (max-width: 768px) {
                .product-container {
                    padding: 10px;
                }
                .product-gallery,
                .product-info {
                    width: 100%;
                }
                .product-gallery .main-image {
                    max-width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <c:choose>
                <c:when test="${product != null}">
                    <div class="product-container row">
                        <!-- Image section -->
                        <div class="col-md-6 product-gallery d-flex flex-column align-items-center">
                            <c:set var="mainImage" value="${product.image}" />
                            <img id="mainImage" 
                                 class="main-image" 
                                 src="<c:out value='${pageContext.request.contextPath}'/>/assets/imgs/Products/<c:out value='${mainImage}'/>" 
                                 alt="${product.fullName}"/>
                            <div class="sub-images">
                                <!-- Sub-image 1 -->
                                <c:if test="${not empty product.image1}">
                                    <img src="<c:out value='${pageContext.request.contextPath}'/>/assets/imgs/Products/${product.image1}" 
                                         alt="sub1" 
                                         onclick="swapImage(this)">
                                </c:if>
                                <!-- Sub-image 2 -->
                                <c:if test="${not empty product.image2}">
                                    <img src="<c:out value='${pageContext.request.contextPath}'/>/assets/imgs/Products/${product.image2}" 
                                         alt="sub2" 
                                         onclick="swapImage(this)">
                                </c:if>
                                <!-- Sub-image 3 -->
                                <c:if test="${not empty product.image3}">
                                    <img src="<c:out value='${pageContext.request.contextPath}'/>/assets/imgs/Products/${product.image3}" 
                                         alt="sub3" 
                                         onclick="swapImage(this)">
                                </c:if>
                            </div>
                        </div>

                        <!-- Product info section -->
                        <div class="col-md-6 product-info">
                            <h1>${product.fullName}</h1>

                            <!-- Price -->
                            <div class="price">
                                ${product.getPriceFormatted()}
                            </div>

                            <!-- Technical Specifications in a table -->
                            <div class="product-attributes">
                                <h5>Technical Specifications</h5>
                                <table class="table table-striped">
                                    <tbody>
                                        <c:forEach var="attr" items="${product.attributeDetails}">
                                            <tr>
                                                <th style="width: 35%;">${attr.attributeName}</th>
                                                <td>${attr.attributeInfor}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Shipping info / Policy -->
                            <div class="shipping-info">
                                <p><strong>Shipping:</strong> Free nationwide shipping</p>
                                <p><strong>Warranty:</strong> 12 months</p>
                                <p><strong>Return Policy:</strong> 15 days if defective</p>
                            </div>

                            <!-- Quantity -->
                            <div class="my-3 d-flex align-items-center">
                                <strong>Quantity:</strong>
                                <div class="quantity-controls">
                                    <button type="button" onclick="decreaseQuantity()">-</button>
                                    <input type="number" id="quantity" name="quantity" value="1" min="1" max="${product.stock}">
                                    <button type="button" onclick="increaseQuantity()">+</button>
                                </div>
                            </div>

                            <!-- Buttons: Add to cart / Buy now -->
                            <div class="action-buttons mb-3">
                                <!-- Add to Cart form -->
                                <form action="AddToCart?productID=${product.productId}" method="POST" class="d-inline">
                                    <input type="hidden" name="quantity" id="quantityInputHidden" value="1">
                                    <button type="submit" class="btn btn-add-cart">
                                        Add to Cart
                                    </button>
                                </form>
                                <!-- Buy Now form -->
                                <form action="order" method="POST" class="d-inline">
                                    <input type="hidden" name="quantity" id="quantityInputHiddenBuyNow" value="1">
                                    <input type="text" name="orderUrl" id="" value="buyNow" hidden>
                                    <input type="text" name="productSelected" value="${product.productId}" hidden>
                                    <input type="text" name="buyProductAction" value="checkout" hidden>
                                    <button type="submit" class="btn btn-buy-now">
                                        Buy Now
                                    </button>
                                </form>
                            </div>

                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <p class="text-center mt-5">Product not found.</p>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Popup Notification (if needed) -->
        <%
            String message = (String) session.getAttribute("message");
            if (message != null) {
        %>
        <div class="popup" id="updatePopup" style="display: flex;">
            <div class="popup-content">
                <h4>${sessionScope.message}</h4>
                <div style="display: flex; justify-content: center;">
                    <c:choose>
                        <c:when test="${sessionScope.message.contains('add your address')}">
                            <div>
                                <a class="btn btn-success" href="ViewShippingAddress">OK</a>
                                <a class="btn btn-danger text-white" onclick="closePopup()">Cancel</a>
                            </div>
                        </c:when>
                        <c:when test="${sessionScope.message.contains('add your phone number')}">
                            <div>
                                <a class="btn btn-success" href="viewCustomerProfile">OK</a>
                                <a class="btn btn-danger text-white" onclick="closePopup()">Cancel</a>
                            </div>
                        </c:when>
                        <c:otherwise>  
                            <button class="btn btn-primary" onclick="closePopup()">OK</button>
                        </c:otherwise>
                    </c:choose>


                </div>
            </div>
        </div>
        <%
                session.removeAttribute("message");
            }
        %>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                                // Swap main and sub images
                                function swapImage(img) {
                                    const mainImg = document.getElementById("mainImage");
                                    const tempSrc = mainImg.src;
                                    mainImg.src = img.src;
                                    img.src = tempSrc;
                                }

                                // Increase/decrease quantity
                                function increaseQuantity() {
                                    const quantityInput = document.getElementById('quantity');
                                    const maxQuantity = parseInt(quantityInput.max);
                                    let currentVal = parseInt(quantityInput.value);
                                    if (currentVal < maxQuantity) {
                                        quantityInput.value = currentVal + 1;
                                    }
                                    // Sync with hidden inputs
                                    document.getElementById("quantityInputHidden").value = quantityInput.value;
                                    document.getElementById("quantityInputHiddenBuyNow").value = quantityInput.value;
                                }

                                function decreaseQuantity() {
                                    const quantityInput = document.getElementById('quantity');
                                    let currentVal = parseInt(quantityInput.value);
                                    if (currentVal > 1) {
                                        quantityInput.value = currentVal - 1;
                                    }
                                    // Sync with hidden inputs
                                    document.getElementById("quantityInputHidden").value = quantityInput.value;
                                    document.getElementById("quantityInputHiddenBuyNow").value = quantityInput.value;
                                }

                                // Close popup
                                function closePopup() {
                                    document.getElementById("updatePopup").style.display = "none";
                                }

                                // When user manually changes the quantity input
                                document.getElementById("quantity")?.addEventListener("input", function () {
                                    document.getElementById("quantityInputHidden").value = this.value;
                                    document.getElementById("quantityInputHiddenBuyNow").value = this.value;
                                });
        </script>
    </body>
</html>
