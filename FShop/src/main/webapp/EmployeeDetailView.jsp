<%-- 
    Document   : EmployeeDetailView
    Created on : Feb 23, 2025, 10:00:41 PM
    Author     : NguyenPVT-CE181835
--%>

<%@page import="Models.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Dashboard Design</title>
        <style>
            body {
                background-color: #f8f9fa;
            }
            .profile-container {
                max-width: 900px;
                height: auto;
                margin: 0px 80px 20px 5px;
                background: white;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .form-container {
                width: 50%;
            }
            .avatar-container {
                text-align: center;
                width: 50%;
            }
            .avatar-preview {
                width: 180px;
                height: 180px;
                border-radius: 50%;
                object-fit: cover;
                border: 3px solid #ddd;
            }
            .btn-save {
                background-color: #007bff;
                color: white;
            }
            .btn-change {
                background-color: #dc3545;
                color: white;
            }

            .value{
                width: 150px;

            }
        </style>
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
                    <form action="#">
                        <div class="form-input">
                            <input type="search" placeholder="Search by Name...">
                            <button class="search-btn" type="submit"><i class='bx bx-search'></i></button>
                        </div>
                    </form>
                    <input type="checkbox" id="theme-toggle" hidden>
                    <label for="theme-toggle" class="theme-toggle"></label>
                    <a href="#" class="notif">
                        <i class='bx bx-bell'></i>
                        <span class="count">12</span>
                    </a>
                    <a href="#" class="profile">
                        <img src="assets/imgs/Dashboard/admin.png">
                    </a>
                </nav>
                <!-- End of Navbar -->
                <main>
                    <div class="profile-container">
                        <div class="form-container">
                            <div class="mb-1 d-flex">
                                <label class="value fw-bold">Employee ID:</label>
                                <p>${employee.employeeId}</p>
                        </div>

                        <div class="mb-1 d-flex">
                            <label class="value fw-bold">Role Name:</label>
                            <c:forEach items="${listR1}" var="r">
                                <c:if test="${r.roleId eq employee.roleId}">
                                    <p>${r.roleName}</p>
                                </c:if>
                            </c:forEach>
                        </div>

                        <div class="mb-1 d-flex">
                            <label class="value fw-bold">Full Name:</label>
                            <p>${employee.fullname}</p>
                        </div>

                        <div class="mb-1 d-flex">
                            <label class="value fw-bold">Birthday:</label>
                            <p>${employee.birthday}</p>
                        </div>

                        <div class="mb-1 d-flex">
                            <label class="value fw-bold">Password:</label>
                            <p>${employee.password}</p>
                        </div>

                        <div class="mb-1 d-flex">
                            <label class="value fw-bold">Phone Number:</label>
                            <p>${employee.phoneNumber}</p>
                        </div>

                        <div class="mb-1 d-flex">
                            <label class="value fw-bold">Email:</label>
                            <p>${employee.email}</p>
                        </div>

                        <div class="mb-2 d-flex">
                            <label class="value fw-bold">Gender:</label>
                            <p>${employee.gender}</p>
                        </div>

                        <div class="mb-1 d-flex">
                            <label class="value fw-bold">Created Date:</label>
                            <p>${employee.createdDate}</p>
                        </div>

                        <div class="mb-1 d-flex">
                            <label class="value fw-bold">Status:</label>
                            <c:choose>
                                <c:when test="${employee.status == 1}">
                                    <p><span style="background-color: #28a745; color: white; padding: 5px 12px; border-radius: 15px; font-size: 12px; display: inline-flex; align-items: center; gap: 5px; text-align: center;">
                                            <i class='bx bx-check-circle' style="font-size: 14px;"></i> Available
                                        </span></p>
                                    </c:when>
                                    <c:otherwise>
                                    <p><span style="background-color: #dc3545; color: white; padding: 5px 12px; border-radius: 15px; font-size: 12px; display: inline-flex; align-items: center; gap: 5px; text-align: center; margin-left: 10px;">
                                            <i class='bx bx-x-circle' style="font-size: 14px;"></i> Disable
                                        </span></p>
                                    </c:otherwise>
                                </c:choose>
                        </div>

                        <div class="d-flex gap-1" style="justify-content: left;">
                            <a href="EmployeeList" style="background-color: #4da3ff; color: white; text-decoration: none; padding: 3px 9px; border-radius: 5px; display: inline-flex; align-items: center; gap: 5px; cursor: pointer;">
                                <i class='bx bx-arrow-back'></i> Back to List
                            </a>
                            <a href="UpdateEmployee?id=${employee.employeeId}" style="background-color: orange; color: white; text-decoration: none; padding: 3px 9px; border-radius: 5px; display: inline-block; cursor: pointer;">
                                <i class='bx bx-edit'></i> Update
                            </a>
                        </div>

                    </div>
                    <div class="avatar-container">
                        <div class="mb-3">
                            <img id="avatarPreview" class="avatar-preview" src="assets/imgs/Employee/${employee.avatar}" alt="Avatar">
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/index.js"></script>
    </body>
</html>