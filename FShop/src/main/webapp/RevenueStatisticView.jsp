<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Revenue Statistic</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                display: flex;
            }

            .sidebar {
                width: 250px;
                height: 97vh;
                background: #FFFFFF;
                color: black;
                padding-top: 20px;
                box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);
                transform: translateZ(0);
                position: relative;
                z-index: 10;
                border-radius: 10px;
                margin-top: 10px;
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

            .content {
                flex-grow: 1;
                padding: 12px;
                margin-left: 250px;
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

            .icon {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                object-fit: cover;
            }

            .logo-side-bar {
                margin-left: 5%;
                margin-bottom: 3%;
            }

            .table-container {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            }

            /* Table Styling */
            table {
                width: 100%;
                border-collapse: collapse;
                border-radius: 10px;
                overflow: hidden;
            }

            thead {
                background: #7D69FF;
                color: white;
                text-align: center;
            }

            th,
            td {
                padding: 15px; /* Tăng padding để tạo không gian đồng đều */
                text-align: center;
                border: 1px solid #ddd; /* Adds border around each cell */
                line-height: 1.6; /* Cải thiện khoảng cách dòng */
            }

            tbody tr:hover {
                background: #f2f2f2;
                transition: 0.3s;
            }

            .table-navigate {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
            }

            .search-form {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }

            .search-form input {
                border-radius: 25px;
                padding: 10px 15px;
                border: 1px solid #ccc;
                width: 250px;
                font-size: 14px;
                margin-right: 10px;
                outline: none;
            }

            .search-form button {
                background-color: #007bff;
                border: none;
                border-radius: 25px;
                padding: 10px 15px;
                cursor: pointer;
            }

            .search-form button:hover {
                background-color: #0056b3;
            }

            .search-form input:focus {
                border-color: #0056b3;
            }

            .filter-form {
                display: flex;
                justify-content: left;
                align-items: center;
                margin-top: 20px;
                padding: 10px;
                border-radius: 20px;
            }

            .filter-form select, .filter-form button {
                border-radius: 25px;
                padding: 12px 20px;
                font-size: 16px;
                border: 1px solid #ddd;
                margin-right: 10px;
            }

            .filter-form select {
                width: 200px;
                background-color: #fff;
                color: #555;
                transition: border-color 0.3s ease;
            }

            .filter-form select:focus {
                outline: none;
                border-color: #007bff;
            }

            .filter-form button {
                background-color: #007bff;
                color: white;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .filter-form button:hover {
                background-color: #0056b3;
            }

            .filter-form label {
                font-size: 16px;
                margin-right: 10px;
                font-weight: bold;
                color: #333;
            }

        </style>
    </head>

    <body>
        <jsp:include page="SidebarDashboard.jsp"></jsp:include>
            <div class="content">
            <jsp:include page="HeaderDashboard.jsp"></jsp:include>

                <!-- Filter by Time Range (Day, Month, Year) -->
                <div class="filter-form">
                    <form action="RevenueStatisticServlet" method="GET" id="timePeriodForm">
                        <label for="timePeriod">Select Time Period:</label>
                        <select name="timePeriod" id="timePeriod">
                            <option value="day" ${time == 'day' ? 'selected' : ''}>By Day</option>
                        <option value="month" ${time == 'month' ? 'selected' : ''}>By Month</option>
                        <option value="year" ${time == 'year' ? 'selected' : ''} >By Year</option>
                    </select>
                    <button tyle="submit">Filter</button>
                </form>
            </div>
            <div class="table-container">
                <h3>Revenue Statistic</h3>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Time Period</th>                               
                            <th>Total Orders</th>
                            <th>Total Products Sold</th>
                            <th>Total Revenue (VND)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="data" items="${revenueData}">
                            <tr>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty data.orderDate}">
                                            <fmt:formatDate value="${data.orderDate}" pattern="dd/MM/yyyy" />
                                        </c:when>
                                        <c:when test="${not empty data.orderMonth and not empty data.orderYear}">
                                            ${data.orderMonth}/${data.orderYear}
                                        </c:when>
                                        <c:when test="${not empty data.orderYear}">
                                            ${data.orderYear}   
                                        </c:when>
                                        <c:otherwise>  

                                        </c:otherwise>
                                    </c:choose>
                                </td>                              
                                <td>${data.totalOrder}</td>
                                <td>${data.totalProductsSold}</td>
                                <td>${data.totalRevenue}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <a href="StatisticManagementServlet" style="background-color: orange; color: white; text-decoration: none; padding: 5px 15px; border-radius: 5px; display: inline-block; cursor: pointer;">
                    <i class='bx bx-edit'></i> Back
                </a>
            </div>
        </div>
    </body>
</html>
