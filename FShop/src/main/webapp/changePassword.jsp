<%-- 
    Document   : changePassword
    Created on : Feb 16, 2025, 2:15:21 PM
    Author     : TuongMPCE180644
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .error-message {
                color: red;
                font-size: 0.9em;
                margin-top: -10px;
                margin-bottom: 10px;
            }
            /* Popup styles */
            .popup {
                display: none;
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
        <div style="padding: 15px; background-color: white; border-radius: 5px; height: 500px">
            <h3>Change Password</h3>
            <div class="container mt-5" >
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div id="changePasswordForm" class="card-body" style="background-color: rgb(245,245,245);">
                                <form action="changePassword" method="POST">
                                    <div class="mb-4">
                                        <label for="currentPassword" class="form-label">Current Password</label>
                                        <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                                    </div>
                                    <div class="mb-4">
                                        <label for="newPassword" class="form-label">New Password</label>
                                        <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                                    </div>
                                    <div class="mb-4">
                                        <label for="confirmPassword" class="form-label">Confirm New Password</label>
                                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                                    </div>
                                    <div class="d-grid">
                                        <button type="submit" class="btn btn-primary">Change Password</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Popup -->
            <div class="popup" id="loginFailPopup">
                <div class="popup-content">
                    <h3>${sessionScope.message}</h3>
                    <button onclick="closePopup()">Close</button>
                </div>
            </div>
            <script>

                // Hiển thị popup khi có thông báo lỗi từ session
                function showPopup() {
                    document.getElementById("loginFailPopup").style.display = "flex";
                }

                function closePopup() {
                    document.getElementById("loginFailPopup").style.display = "none";
                }

                // Kiểm tra xem có message từ session hay không
                <%
                    if (session.getAttribute("message") != null) {
                        out.print("window.onload = function() { showPopup(); };");
                        session.removeAttribute("message");
                    }
                %>

            </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
