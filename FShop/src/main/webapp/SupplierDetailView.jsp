<%@page import="Models.Supplier"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Supplier Detail</title>
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
            border-radius: 10px;
        }
        .content {
            flex-grow: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 20px;
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
        .table-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            width: 100%; /* Kéo dài bảng ra hết chiều ngang trống */
        }
        .table th {
            background: #7D69FF;
            color: white;
            width: 20%;
            text-align: left;
        }
        .btn-back {
            background-color: #7D69FF;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 20px;
        }
        .btn-back:hover {
            background-color: #5a4edc;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <img src="assets/imgs/Dashboard/Group 1521.svg" class="logo-side-bar">
        <h6><a href="#">Warehouse Management</a></h6>
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

        <div class="table-container">
            <h3>Supplier Detail</h3>
            <table class="table table-bordered">
                <c:choose>
                    <c:when test="${supplier != null}">
                        <tr>
                            <th>Tax ID</th>
                            <td>${supplier.getTaxId()}</td>
                        </tr>
                        <tr>
                            <th>Name</th>
                            <td>${supplier.getName()}</td>
                        </tr>
                        <tr>
                            <th>Phone Number</th>
                            <td>${supplier.getPhoneNumber()}</td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td>${supplier.getEmail()}</td>
                        </tr>
                        <tr>
                            <th>Address</th>
                            <td>${supplier.getAddress()}</td>
                        </tr>
                        <tr>
                            <th>Status</th>
                            <td>
                                <span class="badge ${supplier.isIsActivate() ? 'bg-success' : 'bg-danger'}">
                                    ${supplier.isIsActivate() ? 'Active' : 'Inactive'}
                                </span>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="2" class="text-danger text-center">Supplier not found!</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </table>
            <a href="Supplier" class="btn-back">Back to List</a>
        </div>
    </div>
</body>
</html>
