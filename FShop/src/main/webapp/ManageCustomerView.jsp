<%-- 
    Document   : CustomerListView
    Created on : 22-Feb-2025, 15:25:44
    Author     : kiuthi
--%>

<%@page import="java.util.List"%>
<%@page import="DAOs.SupplierDAO"%>
<%@page import="Models.Supplier"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F Shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                display: flex;
            }

            .sidebar {
                width: 250px;
                height: auto;
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
            /* ========================================================= */

            .table-container {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            }

            table {
                border-radius: 10px;
                overflow: hidden;
            }

            thead {
                background: #7D69FF;
                color: white;
            }

            tbody tr:hover {
                background: #f2f2f2;
                transition: 0.3s;
            }

            .search-box {
                max-width: 300px;
                margin-bottom: 10px;
            }

            .table-navigate{
                display: flex;
                justify-content: space-between;
            }
            .btn-add {
                background-color: #003375;
                color: white;
                border: none;
                display: inline-block;
                padding: 5px 10px;
            }
            .btn-delete {
                background-color: red;
                color: white;
                border: none;
                display: inline-block;
                padding: 5px 10px;
            }
            .btn-edit {
                background-color: #007bff;
                color: white;
                border: none;
                display: inline-block;
                padding: 5px 10px;
            }
            .search-container {
                display: flex;
                align-items: center;
                width: 100%;
                max-width: 300px; /* Giảm kích thước tối đa */
                background: white;
                border-radius: 13px; /* Bo góc mềm hơn */
                overflow: hidden;
                border: 2px solid #7D69FF;
                margin-bottom: 15px;
            }

            .search-input {
                flex: 1;
                border: none;
                outline: none;
                padding: 8px 12px; /* Giảm padding để nhỏ hơn */
                font-size: 14px; /* Giảm kích thước chữ */
                color: #555;
            }

            .search-button {
                border: none;
                padding: 8px 12px; /* Giảm padding của nút */
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 14px;
            }

            .search-button:hover {
                background: #6454cc;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <img src="assets/imgs/Dashboard/Group 1521.svg" class="logo-side-bar">
            <h6><a href="ShopDashboardServlet">Shop Management</a></h6>
            <a href="CustomerListServlet">Customer Management</a>
            <a href="ProductListServlet">Product Management</a>
            <a href="ProductStatisticServlet">Product Statistic</a>
        </div>
        <div class="content">
            <jsp:include page="HeaderDashboard.jsp"></jsp:include>
                <form action="CustomerListServlet" method="get" class="search-container">
                    <input type="text" name="txt" value="${param.txt}" placeholder="Search by name..." class="search-input">
                <button type="submit" class="search-button">
                    🔍
                </button>
            </form>

            <div class="table-container">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Customer ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="customerTable">
                        <c:forEach items="${customers}" var="s">
                            <tr>
                                <td>${s.getId()}</td>
                                <td>${s.getFullName()}</td>
                                <td>${s.getEmail()}</td>
                                <td>${s.getPhoneNumber()}</td>
                                <td>
                                    <span class="badge ${s.getIsBlock() ==0 ? 'bg-success' : 'bg-danger' }">
                                        ${s.getStatus()}
                                    </span>
                                </td>
                                <td>
                                    <a href="CustomerListServlet?${s.getIsBlock() == 1 ? 'Activate' : 'Blocked'}=${s.getId()}" 
                                       class="btn ${s.getIsBlock() == 1 ? 'btn-success' : 'btn-danger'}" 
                                       onclick="return confirm('Are you sure?');">
                                        ${s.getIsBlock() == 0 ? 'Blocked' : 'Activate'}
                                    </a>
                                    <a href="CustomerListServlet?id=${s.getId()}" class="btn btn-detail" style="background-color: #BDF3BD">Detail</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <script>
            function filterTable() {
                let input = document.getElementById("searchInput");
                let filter = input.value.toLowerCase();
                let table = document.getElementById("customerTable");
                let rows = table.getElementsByTagName("tr");

                for (let i = 0; i < rows.length; i++) {
                    let nameCell = rows[i].getElementsByTagName("td")[1];
                    if (nameCell) {
                        let nameText = nameCell.textContent || nameCell.innerText;
                        rows[i].style.display = nameText.toLowerCase().includes(filter) ? "" : "none";
                    }
                }
            }
        </script>

    </div>
</body>
</html>
