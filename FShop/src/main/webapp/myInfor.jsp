<%-- 
    Document   : myInfor
    Created on : Jan 31, 2025, 2:57:46 PM
    Author     : nhutb
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>My Profile</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

        <style>
            body {
                background-color: #f5f5f5;
            }
            .container-fluid {
                display: flex;
                min-height: 100vh;
            }
            .sidebar {
                width: 250px;
                background: white;
                padding: 20px;
                box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            }
            .sidebar-link {
                text-decoration: none;
                color: #333;
                display: block;
                padding: 10px 0;
            }
            .sidebar-link.active {
                background-color: #f8f9fa;
                color: #007bff;
            }
            .content {
                flex: 1;
                padding: 30px;
                background: white;
                margin: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }
        </style>
    </head>
    <body>

        <jsp:include page="header.jsp"></jsp:include>

            <div class="container">
                <div class="container-fluid">
                    <!-- Sidebar -->
                    <aside class="sidebar">
                        <h5 class="text-center">${sessionScope.customer.getFullName()}</h5>
                    <p class="text-center"><a href="Logout">Log out</a></p>
                    <nav>
                        <a href="#" class="sidebar-link" data-page="profile.jsp">Profile</a>
                        <a href="#" class="sidebar-link" data-page="address.jsp">Address</a>
                        <a href="#" class="sidebar-link" data-page="orders.jsp">Orders</a>
                        <a href="#" class="sidebar-link" data-page="notifications.jsp">Notifications</a>
                        <a href="#" class="sidebar-link" data-page="shopping.jsp">Shopping</a>
                        <a href="#" class="sidebar-link" data-page="change-password.jsp">Change Password</a>
                        <a href="#" class="sidebar-link" data-page="voucher.jsp">Voucher</a>
                        <a href="#" class="sidebar-link" data-page="coins.jsp">Coins</a>
                    </nav>
                </aside>

                <!-- Nội dung động -->
                <main id="content" class="content">
                    <jsp:include page="profile.jsp"></jsp:include>
                    </main>
                </div>
            </div>

        <jsp:include page="footer.jsp"></jsp:include>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Script to load content dynamically -->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                function loadPage(page) {
                    fetch("/" + page)
                            .then(response => response.text())
                            .then(data => {
                                document.getElementById("content").innerHTML = data;
                            })
                            .catch(error => console.error("Error loading page:", error));
                }

                document.querySelectorAll(".sidebar-link").forEach(link => {
                    link.addEventListener("click", function (event) {
                        event.preventDefault();
                        document.querySelectorAll(".sidebar-link").forEach(link => link.classList.remove("active"));
                        this.classList.add("active");

                        let page = this.getAttribute("data-page");
                        loadPage(page);
                    });
                });

                // Load default page (Profile)
                loadPage("profile.jsp");
            });
        </script>

    </body>
</html>

