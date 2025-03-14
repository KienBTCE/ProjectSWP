<%-- 
    Document   : CustomerDetailView
    Created on : 25-Feb-2025, 11:05:04
    Author     : kiuth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Customer Detail</title>
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

        <div class="content">

            <div class="table-container">
                <table class="table table-bordered">
                    <c:choose>
                        <c:when test="${customer != null}">
                            <tr>
                                <th>Customer ID</th>
                                <td>${customer.getId()}</td>
                            </tr>
                            <tr>
                                <th>Name</th>
                                <td>${customer.getFullName()}</td>
                            </tr>
                            <tr>
                                <th>Birthday</th>
                                <td>${customer.getBirthday()}</td>
                            </tr>
                            <tr>
                                <th>Gender</th>
                                <td>${customer.getGender()}</td>
                            </tr>
                            <tr>
                                <th>Phone</th>
                                <td>${customer.getPhoneNumber()}</td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td>${customer.getEmail()}</td>
                            </tr>
                            <tr>
                                <th>Created Date</th>
                                <td>${customer.getCreateAt()}</td>
                            </tr>
                            <tr>
                                <th>Avatar</th>
                                <td><img src="assets/imgs/CustomerAvatar/${customer.getAvatar()}" width="150px" height="150px" alt="alt"/></td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td>${customer.getEmail()}</td>
                            </tr>
                            <tr>
                                <th>Status</th>
                                <td>
                                    <span class="badge ${customer.getIsBlock() == 0 ? 'bg-success' : 'bg-danger'}">
                                        ${customer.getIsBlock() == 1 ? 'Deleted' : 'Activate'}
                                    </span>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="2" class="text-danger text-center">Customer not found!</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </table>
                <a href="CustomerListServlet" class="btn-back">Back to List</a>
            </div>
        </div>
    </body>
</html>
