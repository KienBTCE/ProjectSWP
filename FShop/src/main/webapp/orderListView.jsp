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

        <!-- CSS bổ sung -->
        <style>
            /* Cố định Header */
            .fixed-header {
                position: fixed;
                top: 0;
                left: 250px; /* Điều chỉnh để tránh che sidebar */
                width: calc(100% - 250px); /* Chiều rộng trừ đi sidebar */
                background-color: white;
                z-index: 1050;
                padding: 10px 20px;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            }

            /* Cố định Sidebar */
            .sidebar-container {
                position: fixed;
                top: 0;
                left: 0;
                width: 250px;
                height: 100vh;
                background-color: white;
                z-index: 1100;
                padding-top: 60px; /* Tạo khoảng cách tránh bị header che */
            }

            /* Điều chỉnh khoảng cách để tránh che nội dung */
            .main-layout {
                display: flex;
            }

            .content {
                flex-grow: 1;
                margin-left: 250px; /* Khoảng cách để không bị chồng lên sidebar */
                margin-top: 80px; /* Để tránh bị header che */
                padding: 20px;
            }

            /* Căn chỉnh layout header */
            .header-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                gap: 20px;
            }

            /* Căn chỉnh phần tìm kiếm */
            .search-container {
                display: flex;
                align-items: center;
                gap: 10px;
                flex-grow: 1; /* Giúp phần tìm kiếm chiếm không gian linh hoạt */
                max-width: 600px;
            }

            .search-container input {
                flex: 1;
            }

            /* Đưa tiêu đề về phía bên phải */
            .header-title {
                white-space: nowrap;
                font-size: 1.5rem;
                font-weight: bold;
            }


        </style>
    </head>
    <body>
        <div class="sidebar-container">
            <jsp:include page="SidebarDashboard.jsp"></jsp:include>
            </div>

            <div class="main-layout">
                <div class="fixed-header">
                    <div class="header-container">
                        <form action="ViewOrderListServlet" method="GET" class="search-container">
                            <input type="text" name="search" id="searchInput" value="${searchQuery}" 
                               placeholder="Search by Name, Phone..." class="form-control">
                        <button type="submit" class="btn btn-primary">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>

                    <h2 class="header-title"><i class="fa-solid fa-box"></i> Order List</h2>
                    <jsp:include page="HeaderDashboard.jsp"></jsp:include>

                    </div>
                </div>

                <div class="content">
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
                                        <span class="status waiting">
                                            <i class="fa-solid fa-hourglass-half"></i> Waiting For Acceptance
                                        </span>
                                    </c:when>
                                    <c:when test="${order.status == 2}">
                                        <span class="status packaging">
                                            <i class="fa-solid fa-box"></i> Packaging
                                        </span>
                                    </c:when>
                                    <c:when test="${order.status == 3}">
                                        <span class="status waiting-delivery">
                                            <i class="fa-solid fa-truck"></i> Waiting For Delivery
                                        </span>
                                    </c:when>
                                    <c:when test="${order.status == 4}">
                                        <span class="status delivered">
                                            <i class="fa-solid fa-check-circle"></i> Delivered
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status cancelled">
                                            <i class="fa-solid fa-times-circle"></i> Cancelled
                                        </span>
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
        </div>

    </body>
</html>
