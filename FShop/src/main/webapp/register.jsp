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
                                <form id="registerForm" action="RegisterServlet" method="post" enctype="multipart/form-data">
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
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                            <option value="other">Other</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="phoneNumber">Phone Number:</label>
                                        <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" pattern="[0-9]{10}" placeholder="1234567890" required>
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

                                    <div class="form-group">
                                        <label for="avatar">Avatar:</label>
                                        <input type="file" class="form-control-file" id="avatar" name="avatar" accept="image/*">
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
        </script>
    </body>
</html>
