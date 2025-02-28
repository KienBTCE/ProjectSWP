<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order List</title>
    <link rel="stylesheet" href="assets/css/orderlist.css">
</head>
<body>

    <jsp:include page="leftshopmanager.jsp" /> 

    <div class="container">
        <header>
            <h2>Order List</h2>
        </header>

        <div class="order-container">
            <c:forEach items="${data}" var="order">
                <div class="order-card">
                    <div>
                        <strong>Order ID:</strong> ${order.orderID}<br>
                        <strong>Customer ID:</strong> ${order.accountID}<br>
                        <strong>Full Name:</strong> ${order.fullName}<br>
                        <strong>Phone:</strong> ${order.phone}<br>
                        <strong>Address:</strong> ${order.address}<br>
                        <strong>Total Amount:</strong> ${order.totalAmount}<br>
                        <strong>Order Date:</strong> ${order.orderDate}<br>
                    </div>
                    <div class="status">
                        <c:choose>
                            <c:when test="${order.status == 1}">
                                <span class="status waiting">Waiting For Acceptance</span>
                            </c:when>
                            <c:when test="${order.status == 2}">
                                <span class="status packaging">Packaging</span>
                            </c:when>
                            <c:when test="${order.status == 3}">
                                <span class="status waiting-delivery">Waiting For Delivery</span>
                            </c:when>
                            <c:when test="${order.status == 4}">
                                <span class="status delivered">Delivered</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status cancelled">Cancelled</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div>
                        <a href="ViewOrderDetailServlet?orderID=${order.orderID}">Detail</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</body>
</html>