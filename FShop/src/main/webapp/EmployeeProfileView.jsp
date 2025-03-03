<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Profile Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .sidebar {
                width: 100%;
                height: 97vh;
                background: #FFFFFF;
                color: black;
                padding-top: 20px;
                box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);
                transform: translateZ(0);
                position: relative;
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

            .profile-container {
                max-width: 1600px;
                height: auto;
                margin: 20px auto;
                background: white;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                display: flex;
                flex-wrap: wrap;
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
            /* Popup styles */
            .popup {
                display: block;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
            }
            .popup-content {
                background-color: white;
                padding: 30px;
                border-radius: 8px;
                text-align: center;
                width: 300px;
                margin: 150px auto;
            }
            .popup button {
                background-color: #007bff;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .popup button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                    <div class="sidebar">
                        <img src="assets/imgs/Dashboard/Group 1521.svg" class="logo-side-bar">
                        <c:if test="${sessionScope.employee.getRoleId() == 1}">
                            <h6><a href="#">Admin</a></h6>
                            <a href="Employee">Employee Management</a>
                            <a href="#">Statistic Management</a>
                        </c:if>
                        <c:if test="${sessionScope.employee.getRoleId() == 2}">
                            <h6><a href="#">Shop Management</a></h6>
                            <a href="CustomerListServlet">Customer Management</a>
                            <a href="ProductListServlet">Product Management</a>
                            <a href="#">Product Statistic</a>
                        </c:if>
                        <c:if test="${sessionScope.employee.getRoleId() == 3}">
                            <h6><a href="#">Order Management</a></h6>
                            <a href="ViewListNewFeedbackServlet">Feedback</a>
                            <a href="ViewOrderListServlet">Order</a>
                        </c:if>
                        <c:if test="${sessionScope.employee.getRoleId() == 4}">
                            <h6><a href="#">Warehouse Management</a></h6>
                            <a href="ImportOrder">Import Order</a>
                            <a href="Supplier">Supplier</a>
                            <a href="#">Product Management</a>
                        </c:if>
                        <a style="margin-top: auto; color: red;" href="" onclick="confirmLogout()"><i class="bi bi-box-arrow-right"></i> Logout</a>
                    </div>
                </div>
                <div class="col-md-10" style="padding: 10px;">
                    <jsp:include page="HeaderDashboard.jsp"></jsp:include>
                        <form action="UpdateEmployeeProfile" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">

                            <div class="profile-container">

                                <div class="form-container">

                                    <div class="mb-3 d-flex">
                                        <label class="value">Email:</label>
                                        <p>${sessionScope.employee.getEmail()}</p>
                                </div>

                                <div class="mb-3 d-flex">
                                    <label class="value">Role:</label>
                                    <c:if test="${sessionScope.employee.getRoleId() == 1}">
                                        <p class="fw-bold">Admin</p>
                                    </c:if>
                                    <c:if test="${sessionScope.employee.getRoleId() == 2}">
                                        <p class="fw-bold">Shop Manager</p>
                                    </c:if>
                                    <c:if test="${sessionScope.employee.getRoleId() == 3}">
                                        <p class="fw-bold">Order Manager</p>
                                    </c:if>
                                    <c:if test="${sessionScope.employee.getRoleId() == 4}">
                                        <p class="fw-bold">Warehouse Manager</p>
                                    </c:if>
                                </div>

                                <div class="mb-3 d-flex">
                                    <label class="form-label value">Full Name</label>
                                    <input type="text" class="form-control" name="fullName" value="${sessionScope.employee.getFullname()}" required>
                                </div>

                                <div class="mb-3 d-flex">
                                    <label class="form-label value" value>Gender</label>
                                    <select class="form-select" name="gender" required>
                                        <option value="Male" ${sessionScope.employee.getGender() == 'Male' ? 'selected' : ''}>Male</option>
                                        <option value="Female" ${sessionScope.employee.getGender() == 'Female' ? 'selected' : ''}>Female</option>
                                        <option value="Other" ${sessionScope.employee.getGender() == 'Other' ? 'selected' : ''}>Other</option>
                                    </select>
                                </div>

                                <div class="mb-3 d-flex">
                                    <label class="form-label value">Phone</label>
                                    <input type="text" class="form-control" name="phone" value="${sessionScope.employee.getPhoneNumber()}" required>
                                </div>

                                <div class="mb-3 d-flex">
                                    <label class="form-label value">Date Of Birth</label>
                                    <input type="date" class="form-control" name="dob" value="${sessionScope.employee.getBirthday().toString()}" required>
                                </div>

                            </div>

                            <div class="avatar-container">
                                <label class="form-label">Avatar</label>
                                <div class="mb-3">
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.employee.getAvatar()}">
                                            <img id="avatarPreview" class="avatar-preview" src="assets/imgs/EmployeeAvatar/${sessionScope.employee.getAvatar()}" alt="Avatar">
                                        </c:when>
                                        <c:otherwise>
                                            <img id="avatarPreview" class="avatar-preview" src="assets/imgs/EmployeeAvatar/defauft_avatar.jpg" alt="Avatar">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <input type="file" class="form-control" name="avatar" accept="image/*" onchange="previewImage(event)">
                            </div>
                            <div class="form-container">
                                <div class="d-flex gap-3" style="justify-content: space-between;">
                                    <button type="submit" class="btn btn-save px-4 py-2">Save</button>
                                    <button type="button" class="btn btn-change px-4 py-2" onclick="changePassword()">Change Password</button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
        <c:if test="${sessionScope.empromess != null}">
            <!-- Popup -->
            <div class="popup" id="Popup">
                <div class="popup-content">
                    <h3>${sessionScope.empromess}</h3>
                    <button onclick="closePopup()">Close</button>
                </div>
            </div>
            <c:remove scope="session" var="empromess"/>

        </c:if>

        <script>
            function confirmLogout() {
                if (confirm("Are you sure you want to log out?")) {
                    // Chuyển hướng tới trang logout hoặc gọi API logout
                    window.location.href = "/Logout";
                }
            }
            function closePopup() {
                document.getElementById("Popup").style.display = "none";
            }


            function validateForm() {
                var phone = document.getElementsByName('phone')[0].value;
                var phonePattern = /^\d{10}$/;
                if (!phonePattern.test(phone)) {
                    alert('Phone number must be exactly 10 digits.');
                    return false;
                }
                return true;
            }

            function previewImage(event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.getElementById('avatarPreview');
                    output.src = reader.result;
                };
                reader.readAsDataURL(event.target.files[0]);
            }


            function changePassword() {
                window.location.href = '/ChangeEmployeePassword';
            }

        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
