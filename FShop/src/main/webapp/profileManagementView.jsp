<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
            .content{
                margin-top: 30px;
            }

            #confirmDeleteAccount .modal-content {
                border-radius: 12px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            }

            #confirmDeleteAccount .modal-header {
                background: #f8d7da;
                color: #721c24;
            }

            #confirmDeleteAccount .btn-danger {
                background-color: #dc3545;
                border-color: #dc3545;
            }

            #confirmDeleteAccount .btn-danger:hover {
                background-color: #c82333;
                border-color: #bd2130;
            }
            /* Popup styles */
            .popup {
                display: block;
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
                margin: 150px auto;
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <main style=" background: rgb(245,245,245);">
                <!-- Sidebar -->
                <div class="container" style="font-family: Arial, sans-serif; height: auto; ">
                    <div class="row">
                        <div class="sidebar col-md-3" style=" height: auto; padding: 20px;">
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
                                    <a href="#" class="menu-item droppeddown-toggle" data-url="customerProfileView.jsp">👤 My Information</a>
                                    <div class="droppeddown-menu">
                                        <a href="#" class="menu-item load-content" data-url="customerProfileView.jsp">My profile</a>
                                        <a href="#" class="menu-item load-content" data-url="addressView.jsp">Address</a>
                                        <a href="#" class="menu-item load-content" data-url="changeCustomerPasswordView.jsp">Change password</a>
                                        <a href="#" class="menu-item text-danger" data-bs-toggle="modal" data-bs-target="#confirmDeleteAccount">Request To Delete Account</a>

                                    </div>
                                </div>
                                <a href="viewOrderHistory?profilePage=ordersHistoryView.jsp" class="menu-item">📦 Orders</a>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-9 content" id="content" style="padding: 15px; border-radius: 5px; ">
                        <jsp:include page="addressView.jsp"></jsp:include>
                    </div>
                </div>
            </div>
        </main>

        <div class="modal fade" id="confirmDeleteAccount" tabindex="-1" aria-labelledby="confirmDeleteAccountLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmDeleteAccountLabel">Confirm Account Deletion</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete your account? This action cannot be undone.</p>
                        <form id="deleteAccountForm" method="POST" action="requestToDeleteAccount">
                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label">Enter your password to confirm:</label>
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-danger">Delete Account</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%
            String message = (String) session.getAttribute("message");
            System.out.println("Session message: " + message + request.getRequestURI());
        %>
        <%
            if (message != null) {
        %>
        <!-- Popup -->
        <div class="popup" id="Popup">
            <div class="popup-content">
                <h3>${sessionScope.message}</h3>
                <button onclick="closePopup()">Close</button>
            </div>
        </div>
        <%
            }
        %>
        <script>
                    function closePopup() {
                        document.getElementById("Popup").style.display = "none";
                    }

                    document.getElementById('deleteAccountForm').addEventListener('submit', function (event) {
                        const password = document.getElementById('confirmPassword').value;
                        if (!password) {
                            event.preventDefault();
                            alert('Please enter your password to confirm account deletion.');
                        }
                    });

                    document.addEventListener("DOMContentLoaded", function () {
                        const dropdownToggle = document.querySelector(".droppeddown-toggle");
                        const dropdown = document.querySelector(".droppeddown");

                        dropdownToggle.addEventListener("click", function (event) {
                            event.preventDefault(); // Ngăn chặn reload trang
                            dropdown.classList.toggle("active"); // Thêm hoặc xóa class active
                        });
                    });

                    document.addEventListener("DOMContentLoaded", function () {
                        let contentDiv = document.getElementById("content");

                        // Mặc định load profile.jsp khi trang mở
            <%
                String requestPage;
                if (request.getParameter("profilePage") != null) {
            %>
                        fetch("<%= request.getParameter("profilePage")%>")
                                .then(response => response.text())
                                .then(data => {
                                    contentDiv.innerHTML = data;
                                    executeScripts(contentDiv);
                                })
                                .catch(error => console.error("Error loading profile:", error));
            <%
            } else {
            %>
                        fetch("${requestScope.profilePage}")
                                .then(response => response.text())
                                .then(data => {
                                    contentDiv.innerHTML = data;
                                    executeScripts(contentDiv);
                                });
            <%
                }
            %>


                        // Xử lý khi click vào menu
                        document.querySelectorAll(".load-content").forEach(item => {
                            item.addEventListener("click", function (event) {
                                event.preventDefault(); // Ngăn không cho chuyển trang

                                let page = this.getAttribute("data-url"); // Lấy URL từ data-url
                                fetch(page)
                                        .then(response => response.text())
                                        .then(data => {
                                            contentDiv.innerHTML = data;
                                            executeScripts(contentDiv); // Chạy lại script

                                        })
                                        .catch(error => console.error("Error loading page:", error));
                            });
                        });

                        // Hàm chạy lại script trong nội dung được load
                        function executeScripts(element) {
                            let scripts = element.getElementsByTagName("script");
                            for (let script of scripts) {
                                if (script.src) { // Nếu là script có src
                                    let newScript = document.createElement("script");
                                    newScript.src = script.src;
                                    newScript.async = true;
                                    document.body.appendChild(newScript);
                                } else { // Nếu là script inline
                                    eval(script.innerText);
                                }
                            }
                        }
                    });

        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <jsp:include page="footer.jsp"></jsp:include>

    </body>

</html>
