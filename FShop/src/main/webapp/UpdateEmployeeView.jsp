<%-- 
    Document   : UpdateEmployeeView
    Created on : Mar 1, 2025, 3:15:55 AM
    Author     : NguyenPVT-CE181835
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Employee Page</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/style.css">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .profile-container {
                max-width: 1600px;
                height: auto;
                margin: 20px auto;
                background: white;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .form-container {
                width: 60%;
            }
            .avatar-container {
                text-align: center;
                width: 35%;
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

            .popup {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
                display: none;
                text-align: center;
                z-index: 1000;
                font-size: 18px;
                font-weight: bold;
            }
            .popup.success {
                background-color: #d4edda;
                color: #28a745;
            }
            .popup.fail {
                background-color: #f8d7da;
                color: #dc3545;
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
                    <form action="UpdateEmployee" method="post" enctype="multipart/form-data">

                    <div class="profile-container">

                        <div class="form-container">

                            <div class="mb-3 d-flex">
                                <label class="form-label value">Employee ID</label>
                                <input type="text" class="form-control" name="txtEmployeeId" value="${employee.employeeId}" readonly>
                            </div>
                            <div class="mb-3 d-flex">
                                <label class="form-label value" value>Role ID</label>
                                <select class="form-select" name="txtRoleId" required>
                                    <option value="1" ${employee.roleId == 1 ? 'selected' : ''}>1-Admin</option>
                                    <option value="2" ${employee.roleId == 2 ? 'selected' : ''}>2-Shop Manager</option>
                                    <option value="3" ${employee.roleId == 3 ? 'selected' : ''}>3-Order Manager</option>
                                    <option value="4" ${employee.roleId == 4 ? 'selected' : ''}>4-Warehouse Manager</option>
                                </select>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value">Full Name</label>
                                <input type="text" class="form-control" name="txtName" value="${employee.fullname}" required>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value">Password</label>
                                <input type="text" class="form-control" name="txtPass" value="${employee.password}" required>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value">Birthday</label>
                                <input type="date" class="form-control" name="txtBirthday" value="${employee.birthday}" required>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value">Phone</label>
                                <input type="text" class="form-control" name="txtPhoneNumber" value="${employee.phoneNumber}" required>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value">Email</label>
                                <input type="text" class="form-control" name="txtEmail" value="${employee.email}" required>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value" value>Gender</label>
                                <select class="form-select" name="txtGender" required>
                                    <option value="Male" ${employee.gender eq 'Male' ? 'selected' : ''}>Male</option>
                                    <option value="Female" ${employee.gender eq 'Female' ? 'selected' : ''}>Female</option>                                  
                                </select>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value">Created Date</label>
                                <input type="date" class="form-control" name="txtCreatedDate" value="${employee.createdDate}" required>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value" value>Status</label>
                                <select class="form-select" name="txtStatus" required>
                                    <option value="1" ${employee.status == 1 ? 'selected' : ''}>Avaliable</option>
                                    <option value="0" ${employee.status == 0 ? 'selected' : ''}>Disable</option>
                                </select>
                            </div>

                            <div class="d-flex gap-1" style="justify-content: left;">
                                <a href="EmployeeList" style="background-color: #4da3ff; color: white; text-decoration: none; padding: 3px 9px; border-radius: 5px; display: inline-flex; align-items: center; gap: 5px; cursor: pointer;">
                                    <i class='bx bx-arrow-back'></i> Back to List
                                </a>
                                <button type="submit" style="background-color: #28a745; color: white; padding: 8px 20px; border: none; border-radius: 10px; display: inline-flex; align-items: center; gap: 5px; cursor: pointer;">
                                    <i class='bx bx-save'></i> Save
                                </button>                               
                            </div>
                        </div>

                        <div class="avatar-container">
                            <label class="form-label">Avatar</label>
                            <div class="mb-3">
                                <img id="avatarPreview" class="avatar-preview" src="assets/imgs/Employee/${currentAvatar}" alt="Avatar">                          
                            </div>
                            <input type="hidden" name="currentAvatar" value="${currentAvatar}">
                            <input type="file" class="form-control" name="txtAvatar" accept="image/*" onchange="previewImage(event)">
                        </div>
                    </div>
                </form>

                <script>
                    function previewImage(event) {
                        var output = document.getElementById('avatarPreview');
                        if (event.target.files.length > 0) {
                            var reader = new FileReader();
                            reader.onload = function () {
                                output.src = reader.result;
                            };
                            reader.readAsDataURL(event.target.files[0]);
                        }
                    }

                    
                </script>
            </main>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
