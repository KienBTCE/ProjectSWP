<%-- 
    Document   : manageProduct
    Created on : 23-Feb-2025, 22:36:47
    Author     : kiuth
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
        </style>
    </head>
    <body>
        <div class="sidebar">
            <img src="assets/imgs/Dashboard/Group 1521.svg" class="logo-side-bar">
            <h6><a href="#">Shop Management</a></h6>
            <a href="CustomerListServlet">Customer Management</a>
            <a href="ProductListServlet">Product Management</a>
            <a href="#">Product Statistic</a>
        </div>
        <div class="content">
            <!--            <div class="header">
                            <div style="margin-right: 30px">
                                <img style="float: left; margin-right: 15px;"
                                     src="assets/imgs/Dashboard/FF8D5F6D-1708-4455-81D8-5F4456F83F52_LE_auto_x2-min.png" alt="User Icon" class="icon">
                                <p style="display: flex; margin: 12px 0 0 0;">Hi, Kien</p>
                            </div>
                        </div>-->
            <div class="table-navigate">
                <input type="text" id="searchInput" class="form-control search-box" placeholder="Find by name ..." onkeyup="filterTable()">
            </div>
            <a href="CreateProductServlet" class="btn btn-detail" style="background-color: #BDF3BD">Create</a>
            <div class="table-container">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Category</th>
                            <th>Brand</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="productTable">
                        <c:forEach items="${products}" var="s">
                            <tr>
                                <td>${s.getProductId()}</td>
                                <td>${s.getCategoryName()}</td>
                                <td>${s.getBrandName()}</td>
                                <td>${s.getFullName()}</td>
                                <td>${s.getPrice()}</td>
                                <td>${s.getQuantity()}</td>
                                <td>
                                    <span class="badge ${s.getDeleted() == 1 ?  'bg-danger':'bg-success'}">
                                        ${s.getStatus()}
                                    </span>
                                </td>
                                <td>
                                    <a href="ProductListServlet?id=${s.getProductId()}" class="btn btn-edit" style="">Update</a>
                                    <a href="ProductListServlet?${s.getDeleted() == 1 ? 'restore' : 'delete'}=${s.getProductId()}" 
                                       class="btn ${s.getDeleted() == 1 ? 'btn-success' : 'btn-danger'}" 
                                       onclick="return confirm('Are you sure?');">
                                        ${s.getDeleted() == 1 ? 'Activate' : 'Delete'}
                                    </a>
                                    <a href="ProductListServlet?id=${s.getProductId()}" class="btn btn-detail" style="background-color: #BDF3BD">Detail</a>
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
                let table = document.getElementById("productTable");
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
