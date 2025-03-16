<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Reset Password</title>
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
            }
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f8f9fc;
            }
            .container {
                background: white;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: left;
                width: 400px;
                position: relative;
            }
            .back-btn {
                font-size: 20px;
                color: black;
                text-decoration: none;
                position: absolute;
                top: 20px;
                left: 20px;
                font-weight: bold;
            }
            h2 {
                margin-bottom: 10px;
                font-size: 24px;
            }
            p {
                font-size: 14px;
                color: #666;
                margin-bottom: 20px;
            }
            label {
                display: block;
                font-weight: bold;
                font-size: 14px;
                margin-bottom: 5px;
            }
            .input-group {
                width: 100%;
                margin-bottom: 20px;
            }
            input {
                width: 100%;
                padding: 12px;
                border-radius: 5px;
                border: 1px solid #ccc;
                font-size: 16px;
            }
            button {
                width: 100%;
                padding: 12px;
                border-radius: 5px;
                font-size: 16px;
                font-weight: bold;
                background-color: #28a745;
                color: white;
                border: none;
                cursor: pointer;
                transition: 0.3s;
            }
            button:hover {
                background-color: #218838;
            }
            .error {
                color: red;
                font-size: 14px;
                text-align: center;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Reset Password</h2>
            <p>Enter your new password below</p>
            <form action="ResetPasswordServlet" method="post">
                <div class="input-group">
                    <label>New Password</label>
                    <input type="password" name="newPassword" required>
                </div>
                <div class="input-group">
                    <label>Confirm Password</label>
                    <input type="password" name="confirmPassword" required>
                </div>
                <button type="submit">Update Password</button>
            </form>
            <% if (request.getAttribute("error") != null) {%>
            <p class="error"><%= request.getAttribute("error")%></p>
            <% }%>
        </div>
    </body>
</html>
