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
        <title>Employee Login</title>
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
            .bg-image-vertical {
                position: relative;
                overflow: hidden;
                background-repeat: no-repeat;
                background-position: right center;
                background-size: auto 100%;
            }

            @media (min-width: 1025px) {
                .h-custom-2 {
                    height: 100%;
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
        <section class="vh-100">
            <div class="container">
                <div class="row">

                    <div class="col-md-6 text-black">
                        <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 pt-5 pt-xl-0 mt-xl-n5">

                            <form style="width: 23rem;" action="EmployeeLogin" method="POST">
                                <img src="./assets/imgs/Dashboard/Group 1521.svg" alt="alt"/>

                                <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px; font-size: 40px; font-weight: bold;">Login</h3>

                                <div data-mdb-input-init class="form-outline mb-4">
                                    <label class="form-label" for="form2Example18">Email address</label>
                                    <input name="email" type="email" id="form2Example18" class="form-control form-control-lg" />

                                </div>

                                <div data-mdb-input-init class="form-outline mb-4">
                                    <label class="form-label" for="form2Example28">Password</label>
                                    <input name="password" type="password" id="form2Example28" class="form-control form-control-lg" />

                                </div>

                                <div class="pt-1 mb-4">
                                    <button data-mdb-button-init data-mdb-ripple-init class="btn btn-info btn-lg btn-block" type="submit">Login</button>
                                </div>

                            </form>

                        </div>

                    </div>
                    <div class="col-md-6">
                        <img src="./assets/imgs/icon/shop.jpg"
                             alt="Login image" width="500px" height="700px" style="object-fit: cover; object-position: left; margin-top: 10px; border-radius: 10px;">
                    </div>
                </div>
            </div>
        </section>


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
                if (session.getAttribute("message") != null || session.getAttribute("message") == "") {
                    out.print("showPopup();");
                }
                session.removeAttribute("message");
            %>
        </script>

    </body>
</html>
