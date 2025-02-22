<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #333;
            color: white;
            padding: 10px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #4CAF50;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table tr:hover {
            background-color: #ddd;
        }

        a {
            text-decoration: none;
            color: #007BFF;
        }

        a:hover {
            color: #0056b3;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .status {
            padding: 5px;
            text-align: center;
            font-weight: bold;
        }

        .status.waiting {
            background-color: #ffcc00;
        }

        .status.packaging {
            background-color: #f39c12;
        }

        .status.waiting-delivery {
            background-color: #3498db;
            color: white;
        }

        .status.delivered {
            background-color: #2ecc71;
            color: white;
        }

        .status.cancelled {
            background-color: #e74c3c;
            color: white;
        }

    </style>
</head>
<body>

    <jsp:include page="leftshopmanager.jsp" /> 

    <div class="container">
        <header>
            <h2>Order List</h2>
        </header>

        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer ID</th>
                    <th>Full Name</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Total Amount</th>
                    <th>Order Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${data}" var="order">
                    <tr>
                        <td>${order.orderID}</td>
                        <td>${order.accountID}</td>
                        <td>${order.fullName}</td>
                        <td>${order.phone}</td>
                        <td>${order.address}</td>
                        <td>${order.totalAmount}</td>
                        <td>${order.orderDate}</td>
                        <td>
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
                        </td>
                        <td>
                            <a href="ViewOrderDetailServlet?orderID=${order.orderID}">Detail</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
