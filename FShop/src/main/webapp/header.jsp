<%-- 
    Document   : header
    Created on : Dec 8, 2024, 11:37:14 AM
    Author     : KienBTCE180180
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <style>
            body{
                margin: 0;
                padding: 0;
            }
            .header-infor{
                width: 100%;
                height: 44px;
                background-color: #D10000;
                text-align: right;
                display: flex;
                align-items: center;
                justify-content: right;
            }
            .header-infor > p{
                display: inline;
                color: white;
            }
            .header-content{
                width: 100%;
                height: 136px;
            }
            .header-content{
                /*margin-bottom: 50px;*/
            }
            .header-content h1{
                color: white;
                margin: 0;
            }
            #name-shop{
                display: inline-block;
            }
            #cartBtn, #loginBtn{
                float: right;
            }
            #login-form{
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: #fff;
                border: 1px solid #ccc;
                width: 300px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                z-index: 1000;
            }
            #modal-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 999;
            }
        </style>
    </head>
    <body>
        <div class="header-content">
            <div class="header-infor">
                <p class="">Call Us: (+84) 012 345 6789</p>
            </div>
            <h1 id="name-shop">F Shop</h1>
            <button id="cartBtn"><a href="shoppingCart.jsp">Cart</a></button>
            <button id="loginBtn">Login</button>
        </div>

        <div id="modal-overlay" style="display: none;">
            <div id="login-form" style="display: none;">
                <h2>Login</h2>
                <form>
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required><br><br>

                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required><br><br>

                    <button type="submit">Submit</button>
                </form>
            </div>
        </div>

        <script src="assets/js/bootstrap.min.js">
            // show modal and its children when click login button
            document.getElementById("loginBtn").onclick = function () {
                var form = document.getElementById("login-form");
                var modal = document.getElementById("modal-overlay");

                if (form.style.display === "none") {
                    modal.style.display = "block";
                    form.style.display = "block";
                } else {
                    modal.style.display = "none";
                    form.style.display = "none";
                }
            };

            // close modal when click out
            document.getElementById("modal-overlay").onclick = function (event) {
                if (this === event.target) {
                    var modal = document.getElementById("modal-overlay");
                    var form = document.getElementById("login-form");
                    modal.style.display = "none";
                    form.style.display = "none";
                }
            };
        </script>
    </body>
</html>
