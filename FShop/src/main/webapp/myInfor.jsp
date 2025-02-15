<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile Management</title>
        <style>
            #avatar {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
            }

            .edit-profile {
                font-size: 14px;
                color: gray;
                text-decoration: none;
            }

            .menu-item {
                display: block;
                padding: 10px;
                color: #333;
                text-decoration: none;
                transition: 0.3s;
            }

            .menu-item:hover {
                background: #f7f7f7;
            }

            .sale {
                font-weight: bold;
                color: red;
            }

            .new-badge {
                background: red;
                color: white;
                padding: 2px 5px;
                font-size: 12px;
                border-radius: 4px;
            }

            /* Dropdown */
            .droppeddown-menu {
                display: none;
                padding-left: 15px;
            }

            .droppeddown-menu a {
                display: block;
                padding: 8px;
                text-decoration: none;
                color: #333;
                transition: 0.3s;
            }

            .droppeddown-menu a:hover {
                background: #f1f1f1;
            }

            /* Hiện dropdown khi có class 'active' */
            .droppeddown.active .droppeddown-menu {
                display: block;
            }
        </style>
    </head>

    <body>
        <!-- Sidebar -->
        <main style="margin: 0; font-family: Arial, sans-serif; height: auto;">
            <div class="sidebar" style="width: 100%; background-color: rgba(231, 220, 220, 0); height: 100%; padding: 20px; ">
                <div class="text-center">
                    <c:if test="${sessionScope.customer.getAvatar() != null}">
                        <img id="avatar" class="avatar-preview mb-3" src="assets/imgs/CustomerAvatar/${sessionScope.customer.getAvatar()}" alt="Avatar">
                    </c:if>
                    <c:if test="${sessionScope.customer.getAvatar() == null}">
                        <img id="avatar" class="avatar-preview mb-3" src="assets/imgs/icon/person.jpg" alt="Avatar">
                    </c:if>                      
                    <h4>${sessionScope.customer.getFullName()}</h4>
                    <a class="text-center" href="Logout">Logout</a>
                </div>

                <div class="sidebar">
                    <ul style="list-style-type: none; padding: 0; color: black; ">
                        <a href="#" class="menu-item">🔔 Notification</a>

                        <div class="droppeddown">
                            <a href="#" class="menu-item droppeddown-toggle">👤 My Information</a>
                            <div class="droppeddown-menu">
                                <a href="viewProfile">My profile</a>
                                <a href="address.jsp">Address</a>
                                <a href="#">Change password</a>
                            </div>
                        </div>

                        <a href="orders.jsp" class="menu-item">📦 Orders</a>
                    </ul>
                </div>
            </div>

        </main>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const dropdownToggle = document.querySelector(".droppeddown-toggle");
                const dropdown = document.querySelector(".droppeddown");

                dropdownToggle.addEventListener("click", function (event) {
                    event.preventDefault(); // Ngăn chặn reload trang
                    dropdown.classList.toggle("active"); // Thêm hoặc xóa class active
                });
            });
        </script>
    </body>

</html>
