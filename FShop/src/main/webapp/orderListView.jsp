<%-- 
    Document   : oderListView
    Created on : 29-Feb-2025, 12:01:16
    Author     : HP
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order List</title>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">

        <!-- Font Awesome for icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="assets/css/orderlist.css">
    </head>
    <body>

<!--        < jsp:include page="leftshopmanager.jsp"  /> -->

        <div class="container">
            <header>
                <h2><i class="fa-solid fa-box"></i> Order List</h2>

                <!-- Search Bar -->
                <form action="ViewOrderListServlet" method="GET" class="search-container">
                    <input type="text" name="search" id="searchInput" value="${searchQuery}" 
                           placeholder="Search by Order ID, Name, Phone..." class="form-control">
                    <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                </form>
            </header>

            <div class="order-container">
                <c:forEach items="${data}" var="order">
                    <div class="order-card">
                        <div class="order-header">
                            <h5><i class="fa-solid fa-receipt"></i> Order ID: #${order.orderID}</h5>
                        </div>

                        <div class="order-details">
                            <p><i class="fa-solid fa-user"></i> <strong>Customer:</strong> ${order.fullName}</p>
                            <p><i class="fa-solid fa-phone"></i> <strong>Phone:</strong> ${order.phone}</p>
                            <p><i class="fa-solid fa-map-marker-alt"></i> <strong>Address:</strong> ${order.address}</p>
                            <p><i class="fa-solid fa-dollar-sign"></i> <strong>Total Amount:</strong> ${order.totalAmount}</p>
                            <p><i class="fa-solid fa-calendar"></i> <strong>Order Date:</strong> ${order.orderDate}</p>
                        </div>

                        <div class="order-status">
                            <c:choose>
                                <c:when test="${order.status == 1}">
                                    <span class="status waiting"><i class="fa-solid fa-hourglass-half"></i> Waiting For Acceptance</span>
                                </c:when>
                                <c:when test="${order.status == 2}">
                                    <span class="status packaging"><i class="fa-solid fa-box"></i> Packaging</span>
                                </c:when>
                                <c:when test="${order.status == 3}">
                                    <span class="status waiting-delivery"><i class="fa-solid fa-truck"></i> Waiting For Delivery</span>
                                </c:when>
                                <c:when test="${order.status == 4}">
                                    <span class="status delivered"><i class="fa-solid fa-check-circle"></i> Delivered</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status cancelled"><i class="fa-solid fa-times-circle"></i> Cancelled</span>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <div class="order-actions">
                            <a href="ViewOrderDetailServlet?orderID=${order.orderID}" class="btn btn-primary">
                                <i class="fa-solid fa-eye"></i> View Details
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

    </body>
</html>
