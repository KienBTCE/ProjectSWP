<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory Statistic</title>
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
                text-align: left;
            }

            th,
            td {
                padding: 15px; /* Tăng padding để tạo không gian đồng đều */
                text-align: left;
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
        </style>
    </head>
    <body>
        <jsp:include page="SidebarDashboard.jsp"></jsp:include>
            <div class="content">
            <jsp:include page="HeaderDashboard.jsp"></jsp:include>

                <div class="table-navigate">
                    <form action="SearchInventoryServlet" method="GET" class="search-form">
                        <input type="text" name="query" value="${searchQuery}" placeholder="Search by Name...">
                    <button type="submit"><i class="bx bx-search"></i></button>
                </form>
            </div>

            <div class="table-container">
                <div>
                    <h3>Inventory</h3>
                </div>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Category Name</th>
                            <th>Brand Name</th>
                            <th>Model</th>
                            <th>Product Name</th>
                            <th>Stock Quantity</th>
                            <th>Supplier</th>
                            <th>Import Date</th>
                            <th>Import Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty searchQuery}">
                            <c:forEach items="${listI}" var="i">
                                <tr>
                                    <td>${i.categoryName}</td>
                                    <td>${i.brandName}</td>
                                    <td>${i.model}</td>
                                    <td>${i.fullName}</td>
                                    <td>${i.stockQuantity}</td>
                                    <td>${i.supplierName}</td>
                                    <td><fmt:formatDate value="${i.importDate}" pattern="dd/MM/yyyy" /></td>
                                    <td>${i.productImportPrice}</td>
                                </tr>
                            </c:forEach>
                        </c:if>
                                <c:if test="${not empty searchQuery}">
                            <c:forEach items="${listI}" var="i">
                                <tr>
                                    <td>${i.categoryName}</td>
                                    <td>${i.brandName}</td>
                                    <td>${i.model}</td>
                                    <td>${i.fullName}</td>
                                    <td>${i.stockQuantity}</td>
                                    <td>${i.supplierName}</td>
                                    <td><fmt:formatDate value="${i.importDate}" pattern="dd/MM/yyyy" /></td>
                                    <td>${i.productImportPrice}</td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </body>

</html>
