<%-- 
    Document   : ImportOrderListView
    Created on : Feb 23, 2025, 7:44:24 PM
    Author     : KienBTCE180180
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
        </style>
    </head>
    <body>
        <div class="sidebar">
            <img src="assets/imgs/Dashboard/Group 1521.svg" class="logo-side-bar">
            <h6><a href="ImportOrder">Warehouse Management</a></h6>
            <a href="#">Import Order</a>
            <a href="Supplier">Supplier</a>
            <a href="#">Product Management</a>
        </div>
        <div class="content">
            <div class="header">
                <div style="margin-right: 30px">
                    <img style="float: left; margin-right: 15px;"
                         src="assets/imgs/Dashboard/FF8D5F6D-1708-4455-81D8-5F4456F83F52_LE_auto_x2-min.png" alt="User Icon" class="icon">
                    <p style="display: flex; margin: 12px 0 0 0;">Hi, Kien</p>
                </div>
            </div>
            <div class="table-navigate">
                <div class="table-navigate">
                    <label for="startDate" class="me-2">From:</label>
                    <input type="date" id="startDate" class="form-control me-3">

                    <label for="endDate" class="me-2">To:</label>
                    <input type="date" id="endDate" class="form-control me-3">

                    <button onclick="filterByDate()" class="btn btn-primary">Filter</button>
                </div>
            </div>

            <div class="table-container">
                <div>
                    <h3>Import Order History</h3>
                </div>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Import ID</th>
                            <th>Date & Time</th>
                            <th>Amount</th>
                            <th>Supplier</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="supplierTable">
                        <c:forEach items="${importOrders}" var="i">
                            <tr>
                                <td>${i.getIoid()}</td>
                                <td>${i.getImportDate()}</td>
                                <td>${i.getPriceFormatted()}</td>
                                <td>${i.getSupplier().getName()}</td>
                                <td>
                                    <a href="ImportOrder?id=${i.getIoid()}" class="btn btn-detail" style="background-color: #BDF3BD">Detail</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        function filterByDate() {
            let startDate = document.getElementById("startDate").value;
            let endDate = document.getElementById("endDate").value;
            let table = document.getElementById("supplierTable");
            let rows = table.getElementsByTagName("tr");

            // Chuyển đổi định dạng ngày về timestamp để so sánh
            let startTimestamp = new Date(startDate).getTime();
            let endTimestamp = new Date(endDate).getTime();

            for (let i = 0; i < rows.length; i++) {
                let dateCell = rows[i].getElementsByTagName("td")[1]; // Lấy cột ngày
                if (dateCell) {
                    let rowDate = new Date(dateCell.textContent.trim()).getTime();

                    if ((!startDate || rowDate >= startTimestamp) &&
                            (!endDate || rowDate <= endTimestamp)) {
                        rows[i].style.display = "";
                    } else {
                        rows[i].style.display = "none";
                    }
                }
            }
        }
    </script>

</body>
</html>

