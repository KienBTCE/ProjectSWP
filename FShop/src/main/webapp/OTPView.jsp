<%-- 
    Document   : OTPView
    Created on : 03-Mar-2025, 12:19:47
    Author     : ThyLTKCE181577
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Verify OTP</title>
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
                text-align: center;
                letter-spacing: 2px;
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
            <h2>Verify OTP</h2>
            <p>Enter the OTP sent to your email</p>
            <form action="RegisterOTPServlet" method="post">
                <div class="input-group">
                    <label>OTP Code</label>
                    <input type="text" name="otp" required>
                </div>
                <button type="submit">VERIFY</button>
            </form>
            <% if (request.getAttribute("error") != null) {%>
            <p class="error"><%= request.getAttribute("error")%></p>
            <% }%>
        </div>
    </body>
</html>

