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
<html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Employee List</title>


    </head>

    <body>

        <!-- Sidebar -->
        <jsp:include page="SidebarDashboardAdmin.jsp"></jsp:include>
            <!-- End of Sidebar -->

            <!-- Main Content -->
            <div class="content">
                <!-- Navbar -->
                <nav>
                    <i class='bx bx-menu'></i>

                    <form action="SearchEmployee" method="GET">
                        <div class="form-input">
                            <input type="text" name="query" value="${searchQuery}" placeholder="Search by Name..." required>
                        <button class="search-btn" type="submit"><i class='bx bx-search'></i></button>
                    </div>
                </form>
                <a href="ViewEmployeeProfile" class="profile">
                    <img src="assets/imgs/Dashboard/admin.png">
                </a>
            </nav>
            <!-- End of Navbar -->
            <main>
                <div class="header">
                    <div class="left">
                        <h1>Dashboard</h1>
                    </div>

                </div>
                <div class="bottom-data">
                    <div class="orders">
                        <div class="header">
                            <i class='bx bx-group'></i>
                            <h3>Employee Table</h3>
                            <a href="AddEmployeeView.jsp" style="background-color: #4da3ff; color: white; text-decoration: none; padding: 4px 20px; border-radius: 5px; display: inline-flex; align-items: center; gap: 5px; cursor: pointer; margin-right: 10px;">
                                <i class='bx bx-plus'></i> Add Employee
                            </a>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Employee ID</th>
                                    <th>Role Name</th>
                                    <th>Full Name</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${not empty searchQuery}">
                                    <c:choose>
                                        <c:when test="${not empty employees}">
                                            <c:forEach items="${employees}" var="e">
                                                <tr>
                                                    <td>${e.employeeId}</td>
                                                    <c:forEach items="${listR1}" var="r">
                                                        <c:if test="${e.roleId == r.roleId}">
                                                            <td>${r.roleName}</td>
                                                        </c:if>
                                                    </c:forEach>
                                                    <td>${e.fullname}</td>
                                                    <td>${e.email}</td>
                                                    <c:choose>
                                                        <c:when test="${e.status == 1}">
                                                            <td><span style="background-color: #28a745; color: white; padding: 5px 12px; border-radius: 15px; font-size: 12px;">
                                                                    <i class='bx bx-check-circle' style="font-size: 14px;"></i> Available
                                                                </span></td>
                                                            </c:when>
                                                            <c:otherwise>
                                                            <td><span style="background-color: #dc3545; color: white; padding: 5px 18px; border-radius: 15px; font-size: 12px;">
                                                                    <i class='bx bx-x-circle' style="font-size: 14px;"></i> Disable
                                                                </span></td>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    <td>
                                                        <a href="UpdateEmployee?id=${e.employeeId}" style="background-color: orange; color: white; text-decoration: none; padding: 3px 9px; border-radius: 5px; display: inline-block; cursor: pointer;">
                                                            <i class='bx bx-edit'></i> Update
                                                        </a>

                                                        <a href="Employee?id=${e.employeeId}" style="background-color: red; color: white; text-decoration: none; padding: 3px 9px; border-radius: 5px; display: inline-block; cursor: pointer;">
                                                            <i class='bx bx-detail'></i> Detail
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="6" style="text-align: center; color: red; font-weight: bold;">No employees found!</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <c:if test="${empty searchQuery}">
                                    <c:forEach items="${listE}" var="e">
                                        <tr>
                                            <td>${e.employeeId}</td>
                                            <c:forEach items="${listR}" var="r">
                                                <c:if test="${e.roleId == r.roleId}">
                                                    <td>${r.roleName}</td>
                                                </c:if>
                                            </c:forEach>
                                            <td>${e.fullname}</td>
                                            <td>${e.email}</td>
                                            <c:choose>
                                                <c:when test="${e.status == 1}">
                                                    <td><span style="background-color: #28a745; color: white; padding: 5px 12px; border-radius: 15px; font-size: 12px; display: inline-flex; align-items: center; gap: 5px; text-align: center;">
                                                            <i class='bx bx-check-circle' style="font-size: 14px;"></i> Available
                                                        </span></td>
                                                    </c:when>
                                                    <c:otherwise>
                                                    <td><span style="background-color: #dc3545; color: white; padding: 5px 18px; border-radius: 15px; font-size: 12px; display: inline-flex; align-items: center; gap: 5px; text-align: center;">
                                                            <i class='bx bx-x-circle' style="font-size: 14px;"></i> Disable
                                                        </span></td>
                                                    </c:otherwise>
                                                </c:choose>
                                            <td>
                                                <a href="UpdateEmployee?id=${e.employeeId}" style="background-color: orange; color: white; text-decoration: none; padding: 3px 9px; border-radius: 5px; display: inline-block; cursor: pointer;">
                                                    <i class='bx bx-edit'></i> Update
                                                </a>

                                                <a href="Employee?id=${e.employeeId}" style="background-color: red; color: white; text-decoration: none; padding: 3px 9px; border-radius: 5px; display: inline-block; cursor: pointer;">
                                                    <i class='bx bx-detail'></i> Detail
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
            <script src="assets/js/index.js"></script>
    </body>

</html>