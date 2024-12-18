<%-- 
    Document   : aboutProduct
    Created on : 18-Dec-2024, 15:32:28
    Author     : ThyLTK_CE181577
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Support Interface</title>
        <link
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
            rel="stylesheet"
            />
        <style>
            img {
                max-width: 100%;
                height: auto;
                display: block;
                margin: 0 auto;
            }
            body,
            html {
                background-color: #f9f9ff;
                margin: 0;
                padding: 0;
            }
            .container-fluid {
                display: flex;
                flex-wrap: nowrap;
                overflow: hidden;
                height: 50vh;
                padding: 0;
                width: 100%;
                box-sizing: border-box;
            }

            .left-section {
                background-color: white;
                display: flex;
                flex-direction: column;
                justify-content: center;
                padding-left: 3%;
                padding-right: 3%;
                width: 50%;
                margin-left: 150px;
            }

            .btn-custom {
                background-color: white;
                color: #333;
                border: 1px solid #ddd;
                box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
                font-size: 1rem;
                padding: 10px 15px;
                margin-bottom: 12px;
                text-align: left;
                position: relative;
            }

            .btn-custom:hover {
                text-decoration: none;
                box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
            }

            .btn-custom::after {
                content: "→";
                position: absolute;
                right: 15px;
                font-weight: bold;
                color: #007bff;
            }

            .right-section {
                flex: 1;
                max-width: 50%;
                background-color: #f9f9ff;
                background: url("./assets/imgs/Banners/banner-helper.png") no-repeat center center;
                background-size: contain;
                justify-content: center;
                align-items: center;
                box-sizing: border-box;
            }
            .product-container {
                margin: 50px auto;
                max-width: 1200px;
            }
            .product-image img {
                max-width: 100%;
            }
            .price {
                color: #333;
                font-size: 1.5rem;
                font-weight: bold;
            }
            .add-to-cart-btn,
            .paypal-btn {
                font-weight: bold;
                border-radius: 25px;
            }
            .add-to-cart-btn {
                background-color: #007bff;
                color: white;
            }
            .paypal-btn {
                background-color: #ffcc00;
                color: black;
            }
            .info-text {
                color: #777;
                font-size: 0.9rem;
            }
            .feature-bullets {
                font-size: 0.9rem;
            }
            .zip-logo img {
                width: 50px;
            }
            .nav-tabs .nav-link {
                color: #333;
            }

            .comment-section {
                margin-top: 50px;
                background-color: #f1f1f1;
                padding: 20px;
                border-radius: 10px;
            }
            .comment-form textarea {
                width: 100%;
                height: 100px;
                margin-bottom: 10px;
            }
            .comment-list .comment {
                background-color: #fff;
                padding: 15px;
                margin-bottom: 15px;
                border-radius: 8px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            }
            .comment-list .comment h5 {
                margin-bottom: 10px;
            }
            .quantity-selector {
                display: flex;
                align-items: center;
                margin-top: 15px;
            }
            .quantity-selector input {
                width: 80px; /* Increase the width to make it longer */
                text-align: center;
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 5px;
                font-size: 1rem;
            }

            .quantity-selector button {
                background-color: transparent;
                color: #007bff;
                border: 1px solid #007bff;
                border-radius: 5px;
                padding: 5px 10px;
                cursor: pointer;
                font-size: 1.2rem;
                width: 30px;
                height: 30px;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .quantity-selector button:hover {
                background-color: #007bff;
                color: white;
            }
            .quantity-selector button:disabled {
                background-color: #cccccc;
                border-color: #cccccc;
                cursor: not-allowed;
            }
        </style>
    </head>

    <body>

        <jsp:include page="header.jsp"></jsp:include>
            <!-- Product Container -->
            <div class="container product-container">
                <!-- More Info -->
                <div class="mt-5">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a
                                class="nav-link active"
                                id="about-tab"
                                data-toggle="tab"
                                href="#about"
                                role="tab"
                                aria-controls="about"
                                aria-selected="true"
                                >About Product</a
                            >
                        </li>
                        <li class="nav-item" role="presentation">
                            <a
                                class="nav-link"
                                id="details-tab"
                                data-toggle="tab"
                                href="#details"
                                role="tab"
                                aria-controls="details"
                                aria-selected="false"
                                >Details</a
                            >
                        </li>
                        <li class="nav-item" role="presentation">
                            <a
                                class="nav-link"
                                id="specs-tab"
                                data-toggle="tab"
                                href="#specs"
                                role="tab"
                                aria-controls="specs"
                                aria-selected="false"
                                >Specs</a
                            >
                        </li>
                    </ul>
                    <div class="tab-content mt-3" id="myTabContent">
                        <div
                            class="tab-pane fade show active"
                            id="about"
                            role="tabpanel"
                            aria-labelledby="about-tab"
                            ></div>
                        <div
                            class="tab-pane fade"
                            id="details"
                            role="tabpanel"
                            aria-labelledby="details-tab"
                            ></div>
                        <div
                            class="tab-pane fade"
                            id="specs"
                            role="tabpanel"
                            aria-labelledby="specs-tab"
                            ></div>
                    </div>
                </div>

                <div class="row">
                    <!-- Product Image -->
                    <div class="col-md-6 product-image text-center">
                        <img src="./assets/imgs/PC/PC1.png" alt="MSI MPG Trident 3"/>
                    </div>
                    <!-- Product Info -->
                    <div class="col-md-6">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb bg-transparent p-0">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Laptops</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    MSI WS Series
                                </li>
                            </ol>
                        </nav>

                        <h2 class="font-weight-bold">MSI MPG Trident 3</h2>
                        <p class="info-text">Be the first to review this product</p>
                        <ul class="list-unstyled feature-bullets">
                            <li>
                                Intel i7 10700F, 2060 SUPER, 16GB RAM, 512GB SSD, 2TB HDD, Windows
                                10 Home
                            </li>
                            <li>Gaming Keyboard and Mouse</li>
                            <li>3 Years Warranty</li>
                        </ul>

                        <p class="price">On Sale from <span>$3,299.00</span></p>
                        <!-- Quantity Selector -->
                        <div class="quantity-selector">
                            <button onclick="decreaseQuantity()">&#8722;</button>
                            <input type="number" id="quantity" value="1" min="1" />
                            <button onclick="increaseQuantity()">&#43;</button>
                        </div>

                        <div class="d-flex align-items-center mt-3">
                            <button class="btn add-to-cart-btn mr-2 px-4 py-2">
                                Add to Cart
                            </button>
                            <button class="btn paypal-btn px-4 py-2">PayPal</button>
                        </div>
                    </div>
                </div>
                <!-- Comment Section -->
                <div class="comment-section">
                    <h3>Customer Reviews</h3>
                    <!-- Comment Form -->
                    <div class="comment-form">
                        <textarea
                            class="form-control"
                            placeholder="Write a comment..."
                            ></textarea>
                        <button class="btn btn-primary mt-2">Submit Comment</button>
                    </div>

                    <!-- Existing Comments -->
                    <div class="comment-list mt-4">
                        <div class="comment">
                            <h5>John Doe <small>(5 days ago)</small></h5>
                            <p>Great product! Highly recommended for gamers.</p>
                        </div>
                        <div class="comment">
                            <h5>Jane Smith <small>(1 week ago)</small></h5>
                            <p>Very fast and efficient. Worth the price.</p>
                        </div>
                    </div>
                </div>
            </div>
            <img src="./assets/imgs/Banners/banner-chip.png" alt="Banner Chip"/>
            <div class="container-fluid">

                <div class="col-md-4 left-section">
                    <a href="#" class="btn btn-custom d-block">Product Support</a>
                    <a href="#" class="btn btn-custom d-block">FAQ</a>
                    <a href="#" class="btn btn-custom d-block">Our Buyer Guide</a>
                </div>

                <div class="col-md-8 right-section"></div>
            </div>

            <img src="./assets/imgs/Banners/banner-details.png" alt="Banner Details"/>
            <img src="./assets/imgs/Banners/banner-icon.png" alt="Banner Icon"/>
        <jsp:include page="footer.jsp"></jsp:include>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
    </body>
</html>
