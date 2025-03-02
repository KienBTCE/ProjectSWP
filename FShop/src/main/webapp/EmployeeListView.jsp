<%-- 
    Document   : EmployeeListView
    Created on : Feb 23, 2025, 8:44:33 PM
    Author     : NguyenPVT-CE181835
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
            <h6><a href="#">Admin</a></h6>
            <a href="Employee">Employee Management</a>
            <a href="#">Statistic Management</a>
        </div>
        <div class="content">
            <jsp:include page="HeaderDashboard.jsp"></jsp:include>
                <!--                <div style="margin-right: 30px">
                                    <img style="float: left; margin-right: 15px;"
                                         src="#" alt="User Icon" class="icon">
                                    <p style="display: flex; margin: 12px 0 0 0;">Hi, ThNguyen</p>
                                </div>-->
                <div class="table-navigate">
                    <input type="text" id="searchInput" class="form-control search-box" placeholder="Tìm kiếm theo tên..." onkeyup="filterTable()">
                    <button class="btn btn-detail" style="background-color: #BDF3BD; height: 100%">Create</button>
                </div>

                <div class="table-container">
                    <div>
                        <h3>Employees</h3>
                    </div>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Employee ID</th>
                                <th>Role ID</th>
                                <th>Full Name</th>
                                <th>Birthday</th>
                                <th>Gender</th>
                                <th>Email</th>
                                <th>Created Date</th>
                                <th>Status</th>
                                <th>Action</th> <!-- Cột mới -->
                            </tr>
                        </thead>
                        <tbody id="employeeTable">
                        <c:forEach items="${listEmp}" var="e">
                            <tr>
                                <td>${e.getEmployeeId()}</td>
                                <td>${e.getRoleId()}</td>
                                <td>${e.getFullname()}</td>
                                <td>${e.getBirthday()}</td>
                                <td>${e.getGender()}</td>
                                <td>${e.getEmail()}</td>
                                <td>${e.getCreatedDate()}</td>
                                <td>${e.getStatus()}</td>
                                <td>
                                    <a href="Employee?id=${e.getEmployeeId()}" class="btn btn-detail" style="background-color: #BDF3BD">Detail</a>
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
                let table = document.getElementById("employeeTable");
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
