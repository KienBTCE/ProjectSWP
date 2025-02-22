<%-- 
    Document   : forgotPassword
    Created on : 22-Feb-2025, 19:23:20
    Author     : kiuth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .popup {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
            display: none;
        }
        .popup h2 {
            font-size: 20px;
            margin-bottom: 10px;
        }
        .popup input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .popup button {
            width: 100%;
            background-color: #28a745;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
            font-size: 16px;
        }
        .popup button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <!-- Form nhập email -->
    <div class="popup" id="emailPopup">
        <h2>Reset Password</h2>
        <p>Enter your registration email to reset your password</p>
        <input type="email" id="email" placeholder="Your Email">
        <button onclick="showOtpPopup()">Next</button>
    </div>

    <!-- Form nhập OTP -->
    <div class="popup" id="otpPopup">
        <h2>Verify Account</h2>
        <p>Enter the verification code sent to your email</p>
        <input type="text" id="otp" placeholder="Enter OTP">
        <button onclick="showNewPassPopup()">Next</button>
    </div>

    <!-- Form nhập mật khẩu mới -->
    <div class="popup" id="newPassPopup">
        <h2>Set New Password</h2>
        <p>Enter your new password</p>
        <input type="password" id="newPassword" placeholder="New Password">
        <input type="password" id="confirmPassword" placeholder="Re-enter New Password">
        <button onclick="resetPassword()">Confirm</button>
    </div>

    <script>
        function showOtpPopup() {
            document.getElementById("emailPopup").style.display = "none";
            document.getElementById("otpPopup").style.display = "block";
        }

        function showNewPassPopup() {
            document.getElementById("otpPopup").style.display = "none";
            document.getElementById("newPassPopup").style.display = "block";
        }

        function resetPassword() {
            alert("Password has been reset successfully!");
        }

        // Hiển thị popup đầu tiên khi tải trang
        document.getElementById("emailPopup").style.display = "block";
    </script>
</body>
</html>
