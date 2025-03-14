<%-- 
    Document   : WarehouseDashboard
    Created on : Feb 27, 2025, 12:28:28 PM
    Author     : KienBTCE180180
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F Shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <style>
            body {
                display: flex;
                padding: 12px;
            }

            .sidebar {
                width: 250px;
                height: 100%;
                background: #FFFFFF;
                color: black;
                padding-top: 20px;
                box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);
                transform: translateZ(0);
                position: relative;
                border-radius: 10px;
                margin-top: 10px;
                position: fixed;
            }

            .sidebar a {
                color: #7A7D90;
                text-decoration: none;
                padding: 10px;
                display: block;
            }

            .sidebar a:hover {
                background: #7D69FF;
                color: white;
                width: 90%;
                font-weight: bold;

                border-top-right-radius: 10px;
                border-bottom-right-radius: 10px;
                border-top-left-radius: 0;
                border-bottom-left-radius: 0;

            }

            .header {
                display: flex;
                justify-content: right;
                align-items: center;
                padding: 10px;
                background: #FFFFFF;
                box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);
                border-radius: 10px;
                height: 85px;
            }

            .logo-side-bar {
                margin-left: 5%;
                margin-bottom: 3%;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <img src="assets/imgs/Dashboard/Group 1521.svg" class="logo-side-bar">
            <c:if test="${sessionScope.employee.getRoleId() == 1}">
                <h6><a href="#">Admin</a></h6>
                <a href="Employee">Employee Management</a>
                <a href="#">Statistic Management</a>
            </c:if>
            <c:if test="${sessionScope.employee.getRoleId() == 2}">
                <h6><a href="ShopDashboardServlet">Shop Management</a></h6>
                <a href="CustomerListServlet">Customer Management</a>
                <a href="ProductListServlet">Product Management</a>
                <a href="ProductStatisticServlet">Product Statistic</a>
            </c:if>
            <c:if test="${sessionScope.employee.getRoleId() == 3}">
                <h6><a href="#">Order Management</a></h6>
                <a href="ViewListNewFeedbackServlet">Feedback</a>
                <a href="ViewOrderListServlet">Order</a>
            </c:if>
            <c:if test="${sessionScope.employee.getRoleId() == 4}">
                <h6><a href="ImportStatistic">Warehouse Management</a></h6>
                <a href="ImportOrder">Import Order</a>
                <a href="Supplier">Supplier</a>
                <a href="#">Product Management</a>
            </c:if>
            <a style="margin-top: auto; color: red;" href="" onclick="confirmLogout()"><i class="bi bi-box-arrow-right"></i> Logout</a>
        </div>
        <script>
            function confirmLogout() {
                if (confirm("Are you sure you want to log out?")) {
                    fetch('<%= request.getContextPath()%>/Logout', {
                        method: 'GET'
                    }).then(response => {
                        if (response.redirected) {
                            window.location.href = response.url;
                        }
                    }).catch(error => console.error('Logout failed:', error));
                }
            }
        </script>
    </body>
</html>