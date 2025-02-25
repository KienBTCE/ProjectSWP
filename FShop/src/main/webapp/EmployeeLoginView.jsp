<%-- 
    Document   : employeeLogin
    Created on : Feb 14, 2025, 10:00:53 PM
    Author     : TuongMPCE180644
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <link href="assets/fonts/themify-icons/themify-icons.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                background-color: #f8f9fa;
            }
            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }
            h1 {
                font-weight: bold;
                margin-bottom: 20px;
                color: #333;
            }
            .login-form {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 20px;
                margin: 20px 0px;
            }
            .form-box {
                background-color: #f5f7ff;
                display: inline-block;
                padding: 20px;
                width: 80%;
                min-width: 400px;
                border: 1px solid #ddd;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .form-box h2 {
                margin-bottom: 15px;
                color: #333;
            }

            form label{
                font-weight: bold;
            }

            .form-box input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 12px;
            }
            .summit {
                margin: 10px 0px;
                width: 100%;
                background-color: #007bff;
                color: white;
                border: none;
                padding: 12px 50px;
                border-radius: 10px;
                display: block;
                text-decoration: none;
            }
            .summit:hover {
                background-color: #0056b3;
                color: white;
            }
            .forgotpass {
                width: 100px;
                display: inline;
                margin: 10px 20px;
                color: #007bff;
                text-decoration: none;
            }
            .forgotpass:hover {
                text-decoration: underline;
            }
            ul {
                padding-left: 20px;
            }
            ul li {
                margin-bottom: 10px;
                font-size: 14px;
                color: #555;
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
        <div class="container">

            <div class="login-form">
                <h1>Employee Login</h1>

                <div class="form-box">
                    <p>If you have an account, sign in with your email address.</p>
                    <form action="employeeLogin" method="post">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Your Email" required>

                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Your Password" required>

                        <button class="summit" type="submit">Sign In</button>
                        <a class="forgotpass" href="#">Forgot Your Password?</a>
                    </form>
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
            function showPopup() {
                document.getElementById("loginFailPopup").style.display = "flex";
            }

            function closePopup() {
                document.getElementById("loginFailPopup").style.display = "none";
            }

            // Show popup if login fails (you can trigger this with backend error)
            // For example, if you're using a session attribute or response error:
            <%
                if (session.getAttribute("message") != null) {
                    out.print("showPopup();");
                }
                session.removeAttribute("message");
            %>
        </script>

    </body>
</html>
