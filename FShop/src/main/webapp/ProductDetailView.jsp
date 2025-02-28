<%-- 
    Document   : ProductDetailView
    Created on : 25-Feb-2025, 10:56:52
    Author     : kiuth
--%>

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
                    <img src="assets/imgs/Products/${product.getImage()}" class="product-image" alt="${product.getFullName()}"/>
                    <div class="product-info">
                        <h3>${product.getFullName()}</h3>
                        <p><strong>Price:</strong> $${product.getPrice()}</p>
                        <p><strong>Quantity:</strong> ${product.getQuantity()}</p>
                        <form action="AddToCartServlet" method="post" class="d-inline">
                            <input type="hidden" name="productId" value="${product.getProductId()}">
                            <button type="submit" class="btn-add-cart">Add to Cart</button>
                        </form>
                        <a href="ViewProductServlet" class="btn-back">Back to List</a>
                    </div>
                </div>
            </c:when>
        </c:choose>
    </div>
</body>
</html>
