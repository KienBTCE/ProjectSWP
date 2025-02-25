<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Profile Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        </style>
    </head>
    <body>
        <form action="updateProfile" method="post" enctype="multipart/form-data">

            <div class="profile-container">

                <div class="form-container">

                    <div class="mb-3 d-flex">
                        <label class="value">Email:</label>
                        <p>nguyenvana@example.com</p>
                    </div>

                    <div class="mb-3 d-flex">
                        <label class="value">Role:</label>
                        <p class="fw-bold">Shop Manager</p>
                    </div>

                    <div class="mb-3 d-flex">
                        <label class="form-label value">Full Name</label>
                        <input type="text" class="form-control" name="fullName" value="${sessionScope.employee.getFullName()}" required>
                    </div>

                    <div class="mb-3 d-flex">
                        <label class="form-label value" value>Gender</label>
                        <select class="form-select" name="gender" required>
                            <option value="Female" ${sessionScope.employee.getGender() == 'Female' ? 'selected' : ''}>Female</option>
                            <option value="Male" ${sessionScope.employee.getGender() == 'Male' ? 'selected' : ''}>Male</option>
                        </select>
                    </div>

                    <div class="mb-3 d-flex">
                        <label class="form-label value">Phone</label>
                        <input type="text" class="form-control" name="phone" value="${sessionScope.employee.getPhone()}" required>
                    </div>

                    <div class="mb-3 d-flex">
                        <label class="form-label value">Date Of Birth</label>
                        <input type="date" class="form-control" name="dob" value="${sessionScope.employee.getDob()}" required>
                    </div>

                    <div class="d-flex gap-3" style="justify-content: space-between;">
                        <button type="submit" class="btn btn-save px-4 py-2">Save</button>
                        <button type="button" class="btn btn-change px-4 py-2" onclick="changePassword()">Change Password</button>
                    </div>

                </div>

                <div class="avatar-container">
                    <label class="form-label">Avatar</label>
                    <div class="mb-3">
                        <c:choose>
                            <c:when test="${not empty sessionScope.employee.getAvatar()}">
                                <img id="avatarPreview" class="avatar-preview" src="assets/imgs/CustomerAvatar/${sessionScope.employee.getAvatar()}" alt="Avatar">
                            </c:when>
                            <c:otherwise>
                                <img id="avatarPreview" class="avatar-preview" src="assets/imgs/icon/person.jpg" alt="Avatar">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <input type="file" class="form-control" name="avatar" accept="image/*" onchange="previewImage(event)">
                </div>


            </div>
        </form>


        <script>
            function previewImage(event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.getElementById('avatarPreview');
                    output.src = reader.result;
                };
                reader.readAsDataURL(event.target.files[0]);
            }

            function changePassword() {
                window.location.href = 'changePassword.jsp';
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
