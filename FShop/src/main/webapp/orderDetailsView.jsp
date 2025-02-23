<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Details</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f1f1f1;
                display: flex;
                justify-content: flex-start;
            }

            /* Sidebar */
            .sidebar {
                width: 250px;
                background: #343a40;
                color: white;
                padding: 20px;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            /* Main content container */
            .container {
                flex: 1;
                max-width: 900px;
                background: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                margin: 20px;
                overflow: hidden;
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            h2, h3 {
                color: #343a40;
                text-align: center;
                margin-bottom: 20px;
            }

            /* Order info section */
            .order-info, .customer-info {
                margin-bottom: 20px;
                padding: 20px;
                border-bottom: 1px solid #ddd;
                background: #fafafa;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .order-info div, .customer-info div {
                display: flex;
                justify-content: space-between;
                padding: 10px 0;
            }

            /* Order details */
            .order-details {
                background: #f9f9f9;
                padding: 15px;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .order-details div {
                display: flex;
                justify-content: space-between;
                padding: 10px;
                background: white;
                margin-bottom: 10px;
                border-radius: 5px;
                border: 1px solid #ddd;
            }

            /* Status styling */
            .status {
                font-weight: bold;
                color: #007bff;
            }

            /* Custom dropdown */
            .dropdown {
                position: relative;
                width: 100%;
            }

            .dropdown select {
                width: 100%;
                padding: 12px 15px;
                background-color: #f8f9fa;
                border-radius: 5px;
                border: 1px solid #ddd;
                font-size: 16px;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .dropdown select:hover,
            .dropdown select:focus {
                border-color: #007bff;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            }

            /* Button */
            input[type="submit"] {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            /* Responsiveness */
            @media (max-width: 768px) {
                .container {
                    padding: 20px;
                }

                .order-details div {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .dropdown select {
                    font-size: 14px;
                }
            }
        </style>
    </head>
    <body>

        <!-- Sidebar -->
        <div class="sidebar">
            <jsp:include page="leftshopmanager.jsp" />
        </div>

        <!-- Main content container -->
        <div class="container">
            <h2>Order Details</h2>

            <!-- Order Information Section -->
            <div class="order-info">
                <div><strong>Order ID:</strong> <span>${data.orderID}</span></div>
                <div><strong>Order Date:</strong> <span>${data.orderDate}</span></div>
                <div><strong>Order Status:</strong> 
                    <span class="status">
                        <c:choose>
                            <c:when test="${data.status == 1}">Waiting For Acceptance</c:when>
                            <c:when test="${data.status == 2}">Packaging</c:when>
                            <c:when test="${data.status == 3}">Waiting For Delivery</c:when>
                            <c:when test="${data.status == 4}">Delivered</c:when>
                            <c:otherwise>Cancelled</c:otherwise>
                        </c:choose>
                    </span>
                </div>
                <div><strong>Total Amount:</strong> <span>${data.totalAmount}</span></div>
            </div>

            <!-- Order Items Section -->
            <h3>Order Items</h3>
            <div class="order-details">
                <div><strong>Product</strong> <strong>Quantity</strong> <strong>Price</strong></div>
                <c:forEach items="${dataDetail}" var="detail">
                    <div>
                        <span>${detail.productName}</span>
                        <span>${detail.quantity}</span>
                        <span>${detail.price}</span>
                    </div>
                </c:forEach>
            </div>

            <!-- Customer Information Section -->
            <h3>Customer Information</h3>
            <div class="customer-info">
                <div><strong>Name:</strong> <span>${data.fullName}</span></div>
                <div><strong>Phone:</strong> <span>${data.phone}</span></div>
                <div><strong>Address:</strong> <span>${data.address}</span></div>
            </div>

            <!-- Update Status Form -->
            <form action="UpdateOrderServlet" method="POST">
                <input type="hidden" name="orderID" value="${data.orderID}" />
                <div class="dropdown">
                    <select name="update" size="1">
                        <option value="1" <c:if test="${data.status == 1}">selected</c:if>>Waiting For Acceptance</option>
                        <option value="2" <c:if test="${data.status == 2}">selected</c:if>>Packaging</option>
                        <option value="3" <c:if test="${data.status == 3}">selected</c:if>>Waiting For Delivery</option>
                        <option value="4" <c:if test="${data.status == 4}">selected</c:if>>Delivered</option>
                    </select>
                </div>
                <input type="submit" value="Update" />
            </form>
        </div>

    </body>
</html>
