<%-- 
    Document   : changeCustomerPassword
    Created on : Feb 16, 2025, 2:15:21 PM
    Author     : TuongMPCE180644
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Customer Password</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .error-message {
                color: red;
                font-size: 0.9em;
                margin-top: 5px;
                margin-bottom: 10px;
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
                                <form action="changeCustomerPassword" method="POST" onsubmit="return validatePassword()">
                                    <div class="mb-4">
                                        <label for="currentPassword" class="form-label">Current Password</label>
                                        <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                                    </div>
                                    <div class="mb-4">
                                        <label for="newPassword" class="form-label">New Password</label>
                                        <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                                        <div id="passwordError" class="error-message mb-8"></div>
                                    </div>
                                    <div class="mb-4">
                                        <label for="confirmPassword" class="form-label">Confirm New Password</label>
                                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                                        <div id="confirmError" class="error-message mb-8"></div>
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
            <script src="./assets/js/changeCustomerPassword.js"></script>

            <script>

            </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
