<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Employee</title>
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

            /* Popup Style */
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.4);
                display: none;
                z-index: 999;
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
                width: 300px;
            }

            .popup.success {
                background-color: #d4edda;
                color: #28a745;
            }

            .popup.fail {
                background-color: #f8d7da;
                color: #dc3545;
            }

            .popup i {
                margin-right: 10px;
                font-size: 24px;
            }

        </style>
    </head>
    <body>
        <!-- Sidebar -->
        <jsp:include page="SidebarDashboardAdmin.jsp"></jsp:include>
            <!-- End of Sidebar -->

            <!-- Overlay and Popup -->
            <div id="overlay" class="overlay"></div>
            <div id="popup" class="popup"></div>

            <!-- Main Content -->
            <div class="content">
                <!-- Navbar -->
                <nav>
                    <i class='bx bx-menu'></i>
                    <form action="#">
                        <div class="form-input">                           
                        </div>
                    </form>
                    <a href="#" class="profile">
                        <img src="assets/imgs/Dashboard/admin.png">
                    </a>
                </nav>
                <!-- End of Navbar -->

                <main>
                    <form action="AddEmployee" method="post" enctype="multipart/form-data">
                    <c:if test="${not empty errorMsg}">
                        <div class="alert alert-danger text-center">${errorMsg}</div>
                    </c:if>
                    <div class="profile-container">
                        <div class="form-container">
                            <div class="mb-3 d-flex">
                                <label class="form-label value" value>Role ID</label>
                                <select class="form-select" name="txtRoleId" required>
                                    <option value="1" ${txtRoleId == 1 ? 'selected' : ''}>1-Admin</option>
                                    <option value="2" ${txtRoleId == 2 ? 'selected' : ''}>2-Shop Manager</option>
                                    <option value="3" ${txtRoleId == 3 ? 'selected' : ''}>3-Order Manager</option>
                                    <option value="4" ${txtRoleId == 4 ? 'selected' : ''}>4-Warehouse Manager</option>
                                </select>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value">Full Name</label>
                                <input type="text" class="form-control" name="txtName" value="${txtName != null ? txtName : ''}" required>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value">Password</label>
                                <input type="password" class="form-control" name="txtPass" value="${txtPass != null ? txtPass : ''}" required>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value">Birthday</label>
                                <input type="date" class="form-control" name="txtBirthday" value="${txtBirthday != null ? txtBirthday : ''}" required>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value">Phone</label>
                                <input type="text" class="form-control" name="txtPhoneNumber" value="${txtPhoneNumber != null ? txtPhoneNumber : ''}" required>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value">Email</label>
                                <input type="email" class="form-control" name="txtEmail" value="${txtEmail != null ? txtEmail : ''}" required>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value" value>Gender</label>
                                <select class="form-select" name="txtGender" required>
                                    <option value="Male" ${txtGender == 'Male' ? 'selected' : ''}>Male</option>
                                    <option value="Female" ${txtGender == 'Female' ? 'selected' : ''}>Female</option>                                  
                                </select>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value">Created Date</label>
                                <input type="date" class="form-control" name="txtCreatedDate" value="${txtCreatedDate != null ? txtCreatedDate : ''}" required>
                            </div>

                            <div class="mb-3 d-flex">
                                <label class="form-label value" value>Status</label>
                                <select class="form-select" name="txtStatus" required>
                                    <option value="1" ${txtStatus == 1 ? 'selected' : ''}>Available</option>
                                    <option value="0" ${txtStatus == 0 ? 'selected' : ''}>Disable</option>
                                </select>
                            </div>

                            <div class="d-flex gap-1" style="justify-content: left;">
                                <a href="Employee" style="background-color: #4da3ff; color: white; text-decoration: none; padding: 3px 9px; border-radius: 5px; display: inline-flex; align-items: center; gap: 5px; cursor: pointer;">
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
                                <img id="avatarPreview" class="avatar-preview" src="assets/imgs/Employee/${currentAvatar != null ? currentAvatar : 'default.png'}" alt="Avatar">                          
                            </div>
                            <input type="hidden" name="currentAvatar" value="${currentAvatar != null ? currentAvatar : ''}">
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

                    // Function to show popup
                    function showPopup(message, type) {
                        var popup = document.getElementById("popup");
                        var overlay = document.getElementById("overlay");

                        // Set the content of the popup
                        popup.innerHTML = "<i class='bx bx-check-circle'></i>" + message;

                        // Set the class for success or fail
                        if (type === 'success') {
                            popup.className = "popup success";
                        } else {
                            popup.className = "popup fail";
                            popup.innerHTML = "<i class='bx bx-error-circle'></i>" + message;
                        }

                        // Show overlay and popup
                        overlay.style.display = "block";
                        popup.style.display = "block";

                        // Hide after 1 second and redirect
                        setTimeout(function() {
                            overlay.style.display = "none";
                            popup.style.display = "none";
                            window.location.href = "Employee"; // Redirect to Employee page
                        }, 2000);
                    }

                    // Example: Show success or fail message
                    <c:if test="${not empty popupSuccessMsg}">
                        window.onload = function () {
                            showPopup("${popupSuccessMsg}", 'success');
                        };
                    </c:if>
                    <c:if test="${not empty popupErrorMsg}">
                        window.onload = function () {
                            showPopup("${popupErrorMsg}", 'fail');
                        };
                    </c:if>
                </script>
            </main>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
