<%-- 
    Document   : userAccout
    Created on : 18-Dec-2024, 15:24:57
    Author     : ThyLTK_CE181577
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>My Dashboard</title>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            />
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
            }

            .dashboard-container {
                margin: 0 auto;
                max-width: 1200px;
            }

            .dashboard-sidebar {
                background-color: #f5f5f5;
                padding: 15px;
                border: 1px solid #ddd;
            }

            .dashboard-sidebar h5 {
                font-weight: bold;
            }

            .dashboard-sidebar ul {
                list-style: none;
                padding: 0;
            }

            .dashboard-sidebar ul li {
                margin: 10px 0;
            }

            .dashboard-sidebar ul li a {
                text-decoration: none;
                color: #000;
            }

            .dashboard-sidebar ul li a:hover {
                text-decoration: underline;
            }

            .dashboard-content {
                padding: 20px;
                border: 1px solid #ddd;
                background-color: #fff;
            }

            .dashboard-content h2 {
                font-weight: bold;
                margin-bottom: 20px;
            }

            .dashboard-content .section-title {
                font-weight: bold;
                margin-top: 20px;
                margin-bottom: 10px;
                border-bottom: 1px solid #ddd;
                padding-bottom: 5px;
            }

            .dashboard-content a {
                color: #007bff;
                text-decoration: none;
            }

            .dashboard-content a:hover {
                text-decoration: underline;
            }

            .compare-products,
            .wishlist {
                border: 1px solid #ddd;
                padding: 15px;
                background-color: #f5f5f5;
                margin-top: 20px;
            }

            .compare-products p,
            .wishlist p {
                margin: 0;
                color: #555;
            }

            .divider {
                border-bottom: 1px solid #ddd;
                margin: 15px 0;
            }

            .feature-icon {
                background-color: #0066ff;
                color: #fff;
                width: 60px;
                height: 60px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 50%;
                margin: 0 auto 10px auto;
            }

            .feature-title {
                font-size: 1.2rem;
                font-weight: bold;
                margin-bottom: 8px;
                text-align: center;
            }

            .feature-description {
                font-size: 0.9rem;
                color: #555;
                text-align: center;
                margin: 0 auto;
                max-width: 250px;
            }

            .row.text-center .col-md-4 {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container dashboard-container">
                <div class="row">
                    <div class="col-md-3">
                        <h2>My Dashboard</h2>
                        <div class="dashboard-sidebar">
                            <h5>Account Dashboard</h5>
                            <ul>
                                <li><a href="#">Account Information</a></li>
                                <li><a href="#">Address Book</a></li>
                                <li><a href="#">My Orders</a></li>
                                <li><a href="#">My Downloadable Products</a></li>
                                <li><a href="#">Stored Payment Methods</a></li>
                                <li><a href="#">Billing Agreements</a></li>
                                <li><a href="#">My Wish List</a></li>
                                <li><a href="#">My Product Reviews</a></li>
                                <li><a href="#">Newsletter Subscriptions</a></li>
                            </ul>
                            <div class="compare-products">
                                <h6>Compare Products</h6>
                                <p>You have no items to compare.</p>
                            </div>
                            <div class="wishlist">
                                <h6>My Wish List</h6>
                                <p>You have no items in your wish list.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-9">
                        <div class="dashboard-content">
                            <div class="section-title">Account Information</div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="section-title">Contact Information</div>
                                    <p>Alex Driver<br />ExampleAdress@gmail.com</p>
                                    <a href="#">Edit</a> | <a href="#">Change Password</a>
                                </div>
                                <div class="col-md-6">
                                    <div class="section-title">Newsletters</div>
                                    <p>You don't subscribe to our newsletter.</p>
                                    <a href="#">Edit</a>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div>
                                    <span class="section-title">Address Book</span>
                                    <a href="#">Manage Addresses</a>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="section-title">Default Billing Address</div>
                                    <p>You have not set a default billing address.</p>
                                    <a href="#">Edit Address</a>
                                </div>
                                <div class="col-md-6">
                                    <div class="section-title">Default Shipping Address</div>
                                    <p>You have not set a default shipping address.</p>
                                    <a href="#">Edit Address</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container py-5">
                <div class="row text-center">
                    <div class="col-md-4">
                        <div class="feature-icon">
                            <i class="bi bi-headset"></i>
                        </div>
                        <div class="feature-title">Product Support</div>
                        <p class="feature-description">
                            Up to 3 years on-site warranty available for your peace of mind.
                        </p>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-icon">
                            <i class="bi bi-person"></i>
                        </div>
                        <div class="feature-title">Personal Account</div>
                        <p class="feature-description">
                            With big discounts, free delivery and a dedicated support
                            specialist.
                        </p>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-icon">
                            <i class="bi bi-rocket"></i>
                        </div>
                        <div class="feature-title">Amazing Savings</div>
                        <p class="feature-description">
                            Up to 70% off new Products, you can be sure of the best price.
                        </p>
                    </div>
                </div>
            </div>

        <jsp:include page="footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
            />
    </body>
</html>

