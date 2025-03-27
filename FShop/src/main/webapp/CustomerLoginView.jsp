<%-- 
    Document   : CustomerLogin
    Created on : Dec 11, 2024, 8:31:26 PM
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
            .container_a {
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
                width: 40%;
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
                width: auto;
                background-color: #007bff;
                color: white;
                border: none;
                padding: 12px 50px;
                border-radius: 50px;
                display: inline;
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
            .list_ul {
                padding-left: 20px;
            }
            .list_ul li {
                margin-bottom: 10px;
                font-size: 14px;
                color: #555;
            }
            .features {
                width: 100%;
                padding: 50px 0px;
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                background-color: #f5f7ff;
            }
            .feature-box {
                display: inline-block;
                text-align: center;
                padding: 10px 60px;
                width: 33.33%;
                max-width: 400px;
            }

            .feature-box img{
                width: 25%;
                height: auto;
                background-color: #f5f7ff;
                border-radius: 50%;
                margin: 10px;
            }

            .feature-box h3 {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 10px;
                color: #333;
            }
            .feature-box p {
                font-size: 14px;
                color: #666;
            }
            /* Mobile Styles */
            @media screen and (max-width: 600px) {
                .feature-box {
                    width: 100%;
                    max-width: none;
                }
                .form-box{
                    width: 100%;
                    min-width: 0px;
                }
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
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container_a">
                <p>Home > Login</p>
                <h1>Customer Login</h1>

                <div class="login-form">
                    <div class="form-box">
                        <h2>Registered Customers</h2>
                        <p>If you have an account, sign in with your email address.</p>
                        <form action="customerLogin" method="post">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="Your Email" required>

                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" placeholder="Your Password" required>

                            <button class="summit" type="submit">Sign In</button>
                            <a class="forgotpass" href="SendMailServlet">Forgot Your Password?</a>
                            <div style="display: flex; align-items: center; text-align: center;">
                                <hr style="flex: 1; border: none; border-top: 1px solid #ccc; margin: 0;">
                                <span style="padding: 0 10px; color: #666; font-weight: bold;">OR</span>
                                <hr style="flex: 1; border: none; border-top: 1px solid #ccc; margin: 0;">
                            </div>
                            <br>
                            <a style="width: 100%" class="btn btn-danger" href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/GoogleLogin&response_type=code&client_id=1041129117035-jujhcv76iq77j9a3t75g3m451ku5b1lb.apps.googleusercontent.com&approval_prompt=force">
                                <img src="./assets/imgs/icon/google.png" alt="Google" width="30px" height="30px"/> Login With Google Account
                            </a>
                        </form>

                    </div>
                    <div class="form-box">
                        <h2>New Customer?</h2>
                        <p>Creating an account has many benefits:</p>
                        <ul class="list_ul">
                            <li>Check out faster</li>
                            <li>Keep more than one address</li>
                            <li>Track orders and more</li>
                        </ul>
                        <a href="/register" class="summit"> Create An Account</a>
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

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
