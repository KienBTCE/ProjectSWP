<%-- 
    Document   : oderDetailsView
    Created on : 29-Feb-2025, 14:01:16
    Author     : HP
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/orderDetail.css">
</head>
<body>

    <div class="main-layout">
        <!-- Sidebar giữ nguyên thiết kế -->
        <jsp:include page="sidebarOrderManager.jsp" />

        <!-- Nội dung chính -->
        <div class="main-content">
            <div class="container">
                <h2><i class="fa-solid fa-receipt"></i> Order Details</h2>

                <div class="order-layout">
                    <!-- Left: Order Information & Items -->
                    <div class="left-section">
                        <div class="order-info">
                            <h3><i class="fa-solid fa-info-circle"></i> Order Information</h3>
                            <p><strong>Order ID:</strong> <span>${data.orderID}</span></p>
                            <p><strong>Order Date:</strong> <span>${data.orderDate}</span></p>
                            <p><strong>Order Status:</strong> <span class="status-${data.status}">${data.status}</span></p>
                            <p><strong>Total Amount:</strong> <span>${data.totalAmount}</span></p>
                        </div>

                        <h3><i class="fa-solid fa-box"></i> Order Items</h3>
                        <div class="order-details">
                            <c:forEach items="${dataDetail}" var="detail">
                                <div>
                                    <span><i class="fa-solid fa-cube"></i> ${detail.productName}</span>
                                    <span><i class="fa-solid fa-cart-plus"></i> ${detail.quantity}</span>
                                    <span><i class="fa-solid fa-dollar-sign"></i> ${detail.price}</span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Right: Customer Info & Manage Order -->
                    <div class="right-section">
                        <div class="customer-info">
                            <h3><i class="fa-solid fa-user"></i> Customer Information</h3>
                            <p><strong>Name:</strong> <span>${data.fullName}</span></p>
                            <p><strong>Phone:</strong> <span>${data.phone}</span></p>
                            <p><strong>Address:</strong> <span>${data.address}</span></p>
                        </div>

                        <div class="manage-order">
                            <h3><i class="fa-solid fa-cogs"></i> Manage Order</h3>
                            <form action="UpdateOrderServlet" method="POST">
                                <input type="hidden" name="orderID" value="${data.orderID}" />
                                <div class="dropdown">
                                    <select name="update">
                                        <option value="1" <c:if test="${data.status == 1}">selected</c:if>>Waiting For Acceptance</option>
                                        <option value="2" <c:if test="${data.status == 2}">selected</c:if>>Packaging</option>
                                        <option value="3" <c:if test="${data.status == 3}">selected</c:if>>Waiting For Delivery</option>
                                        <option value="4" <c:if test="${data.status == 4}">selected</c:if>>Delivered</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-success"><i class="fa-solid fa-pen"></i> Update</button>
                            </form>

                            <!-- Delete Form -->
                            <form id="deleteForm" action="DeleteOrderServlet" method="POST">
                                <input type="hidden" name="orderID" value="${data.orderID}" />
                                <button type="button" onclick="confirmDelete();" class="btn btn-danger">
                                    <i class="fa-solid fa-trash"></i> Delete
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
