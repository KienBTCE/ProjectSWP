<%-- 
    Document   : profile
    Created on : Jan 30, 2025, 9:12:30 PM
    Author     : TuongMPCE180644
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>My Profile</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

        <style>
            body {
                background-color: #f5f5f5;
            }
            .container-fluid {
                display: flex;
                min-height: 100vh;
            }
            .sidebar {
                width: 250px;
                background: white;
                padding: 20px;
                box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            }
            /* Đổi màu khi nhấn vào liên kết */
            .sidebar-link {
                text-decoration: none;
                color: #333;
                font-size: 14px;
                display: block;
                padding: 8px 0;
            }

            /* Màu sáng khi chọn */
            .sidebar-link.active {
                background-color: #f8f9fa;
                color: #007bff;
            }

            .profile-content {
                flex: 1;
                padding: 30px;
                background: white;
                margin: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }
            .avatar-preview {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
            }

            .profile {
                display: flex;
                flex-wrap: wrap;
                align-items: center;
                justify-content: space-between;
            }

            .info {
                width: 50%;
                min-width: 400px;
            }

            .avatar {
                width: 50%;
                min-width: 400px;
                text-align: center;
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container-fluid">
                <!-- Sidebar -->
                <aside class="sidebar">
                    <h5 class="text-center">${sessionScope.customer.getFullName()}</h5>
                <p class="text-center"><a href="#">Edit Profile</a></p>
                <nav>
                    <a href="#" class="sidebar-link">Shopping</a>
                    <a href="#" class="sidebar-link">Notifications</a>
                    <a href="#" class="sidebar-link">Profile</a>
                    <a href="#" class="sidebar-link">Address</a>
                    <a href="#" class="sidebar-link">Change Password</a>
                    <a href="#" class="sidebar-link">Orders</a>
                    <a href="#" class="sidebar-link">Voucher</a>
                    <a href="#" class="sidebar-link">Coins</a>
                </nav>
            </aside>

            <!-- Main Profile Content -->
            <main class="profile-content">
                <form action="updateProfile" method="post" enctype="multipart/form-data">
                    <div class="profile">
                        <div class="info">
                            <h3>My Profile</h3>
                            <p class="text-muted">Manage your profile information to secure your account</p>

                            <div class="mb-3">
                                <label class="form-label">Email:</label>
                                <p>${sessionScope.customer.getEmail()}</p>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Name:</label>
                                <input type="text" class="form-control" name="fullname" value="${sessionScope.customer.getFullName()}" readonly>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Phone Number:</label>
                                <p>********${sessionScope.customer.getPhoneNumber().substring(sessionScope.customer.getPhoneNumber().length()-2)} <a href="#">Change</a></p>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Gender:</label>
                                <div>
                                    <input type="radio" name="gender" value="Male" ${sessionScope.customer.getGender().trim().equalsIgnoreCase("Male") ? 'checked' : ''}> Male
                                    <input type="radio" name="gender" value="Female" ${sessionScope.customer.getGender().trim().equalsIgnoreCase("Female") ? 'checked' : ''}> Female
                                    <input type="radio" name="gender" value="Other" ${sessionScope.customer.getGender().trim().equalsIgnoreCase("Other") ? 'checked' : ''}> Other
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Date of Birth:</label>
                                <div class="row">
                                    <div class="col">
                                        <select class="form-select" name="day">
                                            <option>Day</option>
                                            <c:forEach var="i" begin="1" end="31">
                                                <option ${sessionScope.customer.getBirthday() != null && sessionScope.customer.getBirthday().split("-")[1].equals(String.format("%02d", i)) ? 'selected' : ''}>${i}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <select class="form-select" name="month">
                                            <option>Month</option>
                                            <c:forEach var="i" begin="1" end="12">
                                                <option ${sessionScope.customer.getBirthday() != null && sessionScope.customer.getBirthday().split("-")[2].equals(String.format("%02d", i)) ? 'selected' : ''}>${i}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <select class="form-select" name="year">
                                            <option>Year</option>
                                            <c:forEach var="i" begin="1900" end="2024">
                                                <option ${sessionScope.customer.getBirthday() != null && sessionScope.customer.getBirthday().split("-")[0].equals(String.valueOf(i)) ? 'selected' : ''}>${i}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="mb-3 avatar">
                            <label class="form-label">Avatar:</label>
                            <div class="d-block align-items-center">
                                <img id="avatarPreview" class="avatar-preview mb-3" src="${sessionScope.customer.getAvatar() != null ? sessionScope.customer.getAvatar() : 'assets/imgs/icon/person.jpg'}" alt="Avatar">
                                <input type="file" class="form-control" name="avatar" onchange="previewImage(event)" >
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-danger">Save</button>
                </form>
            </main> 
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Script to preview image -->
        <script>
                                    function previewImage(event) {
                                        var reader = new FileReader();
                                        reader.onload = function () {
                                            var output = document.getElementById('avatarPreview');
                                            output.src = reader.result;
                                        };
                                        reader.readAsDataURL(event.target.files[0]);
                                    }
                                    
                                    
                                    // Thêm lớp active cho liên kết khi nhấn
                                    const links = document.querySelectorAll('.sidebar-link');
                                    links.forEach(link => {
                                        link.addEventListener('click', function () {
                                            links.forEach(link => link.classList.remove('active')); // Xóa lớp active ở tất cả các liên kết
                                            this.classList.add('active'); // Thêm lớp active cho liên kết được chọn
                                        });
                                    });
        </script>
    </body>
</html>
    