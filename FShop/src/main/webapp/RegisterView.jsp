<%-- 
    Document   : register
    Created on : Jan 26, 2025, 10:59:55 PM
    Author     : TuongMPCE180644
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .error-message {
                color: red;
                font-size: 0.9em;
                margin-top: -10px;
                margin-bottom: 10px;
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
            @media screen and (max-width: 800px) {
                .features {
                    width: 100%;
                    padding: 50px 0px;
                    display: block;
                    justify-content: center;
                    background-color: #f5f7ff;
                }
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

            <div class="container mt-5 mb-5">
                <div class="row justify-content-center">
                    <div class="col-md-9">
                        <h2>Create An Account</h2>
                        <div class="card shadow">
                            <div class="card-body">
                                <form id="registerForm" action="register" method="post">
                                    <div class="form-group">
                                        <label for="fullName">Full Name:</label>
                                        <input type="text" class="form-control" id="fullName" name="fullName" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="birthday">Birthday:</label>
                                        <input type="date" class="form-control" id="birthday" name="birthday" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="gender">Gender:</label>
                                        <select class="form-control" id="gender" name="gender" required>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            <option value="Other">Other</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="phoneNumber">Phone Number:</label>
                                        <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" pattern="[0-9]{10}" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="email">Email:</label>
                                        <input type="email" class="form-control" id="email" name="email" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Password:</label>
                                        <input type="password" class="form-control" id="password" name="password" required>
                                        <div id="passwordRules" class="error-message"></div>
                                    </div>

                                    <div class="form-group">
                                        <label for="confirmPassword">Confirm Password:</label>
                                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                                        <div id="passwordError" class="error-message"></div>
                                    </div>

                                    <button type="submit" class="btn btn-primary btn-block">Register</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="features">
                <div class="feature-box">
                    <img src="./assets/imgs/ShoppingCartImg/headphone.jpg" alt="head_phone"/>
                    <h3>Product Support</h3>
                    <p>Up to 3 years on-site warranty available for your peace of mind.</p>
                </div>
                <div class="feature-box">
                    <img src="./assets/imgs/ShoppingCartImg/person.jpg" alt="personal"/>
                    <h3>Personal Account</h3>
                    <p>With big discounts, free delivery, and a dedicated support specialist.</p>
                </div>
                <div class="feature-box">
                    <img src="./assets/imgs/ShoppingCartImg/tag.jpg" alt="tag"/>
                    <h3>Amazing Savings</h3>
                    <p>Up to 70% off new products, you can be sure of the best price.</p>
                </div>
            </div>
            <!-- Popup -->
            <div class="popup" id="loginFailPopup">
                <div class="popup-content">
                    <h3>${sessionScope.message}</h3>
                <button onclick="closePopup()">Close</button>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>

            <!-- Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

            <!-- Custom JS -->
            <script>
                    document.getElementById("registerForm").addEventListener("submit", function (event) {
                        const password = document.getElementById("password").value;
                        const confirmPassword = document.getElementById("confirmPassword").value;
                        const passwordRules = document.getElementById("passwordRules");
                        const passwordError = document.getElementById("passwordError");

                        // Kiểm tra mật khẩu có đáp ứng yêu cầu không
                        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%!&*?]).{8,}$/;
                        if (!passwordRegex.test(password)) {
                            event.preventDefault();
                            passwordRules.textContent = "Password must be at least 8 characters, include one uppercase, one lowercase, one number, and one special character.";
                            return;
                        } else {
                            passwordRules.textContent = "";
                        }

                        // Kiểm tra Confirm Password có khớp với Password không
                        if (password !== confirmPassword) {
                            event.preventDefault();
                            passwordError.textContent = "Password and Confirm Password do not match.";
                        } else {
                            passwordError.textContent = "";
                        }
                    });
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
