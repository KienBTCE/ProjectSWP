<%-- 
    Document   : header
    Created on : Dec 8, 2024, 11:37:14 AM
    Author     : KienBTCE180180
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Header</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <!-- Themify Icons -->
        <link rel="stylesheet" href="assets/fonts/themify-icons/themify-icons.css">
        <style>
            /* --- Top Header --- */
            header.top-header {
                background-color: #D10000;
                color: white;
                padding: 5px 0;
                font-size: 14px;
            }
            header.top-header .container {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            header.top-header .contact-info span {
                margin-right: 15px;
            }
            /* --- Navigation Bar --- */
            nav.navbar-custom {
                background-color: white;
                border-bottom: 1px solid #ddd;
                padding: 10px 0;
            }
            nav.navbar-custom .nav-logo img {
                width: 50px;
                height: 50px;
            }
            nav.navbar-custom .nav-categories ul {
                list-style: none;
                padding-left: 0;
                margin-bottom: 0;
                display: flex;
                justify-content: center;
            }
            nav.navbar-custom .nav-categories ul li {
                margin: 0 15px;
            }
            nav.navbar-custom .nav-categories ul li a {
                text-decoration: none;
                color: #333;
                font-weight: bold;
            }
            /* --- Icon Section --- */
            nav.navbar-custom .nav-icons {
                display: flex;
                align-items: center;
                gap: 15px;
            }
            nav.navbar-custom .nav-icons i {
                font-size: 1.5rem;
                color: #333;
                cursor: pointer;
            }
            nav.navbar-custom .nav-icons .btn-notif {
                background: none;
                border: none;
                padding: 0;
                cursor: pointer;
            }
            nav.navbar-custom .nav-icons .profile-img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
            }
            nav.navbar-custom .nav-icons a {
                text-decoration: none;
                color: #333;
            }
        </style>
    </head>
    <body>
        <!-- Top Header -->
        <header class="top-header">
            <div class="container">
                <div class="contact-info">
                    <span>Mon-Thu 9:00AM - 5:30PM</span>
                    <span>Nguyen Van Cu, Ninh Kieu, Can Tho</span>
                    <span>Call Us: (+84) 12 345 6789</span>
                </div>
                <div class="social-icons">
                    <a href="#"><img src="assets/imgs/HeaderImgs/Vector-Header-FB.svg" alt="Facebook" style="width:23px; height:23px;"></a>
                    <a href="#"><img src="assets/imgs/HeaderImgs/Vector-Header-IG.svg" alt="Instagram" style="width:23px; height:23px;"></a>
                </div>
            </div>
        </header>

        <!-- Navigation Bar -->
        <nav class="navbar-custom">
            <div class="container">
                <div class="row align-items-center">
                    <!-- Logo -->
                    <div class="col-md-3 nav-logo">
                        <a href="${pageContext.request.contextPath}/"><img src="assets/imgs/HeaderImgs/Vector-Header-Logo.svg" alt="Logo"></a>
                    </div>
                    <!-- Categories -->
                    <div class="col-md-6 nav-categories">
                        <ul>
                            <li><a href="Laptop">Laptop</a></li>
                            <li><a href="Smartphone">Smartphone</a></li>
                            <li><a href="#">Accessories</a></li>
                        </ul>
                    </div>
                    <!-- Icons -->
                    <div class="col-md-3 nav-icons text-end">
                        <div class="d-flex align-items-center justify-content-end gap-3">
                            <!-- Search Icon -->
                            <i class="ti-search" style="font-size: 150%; color: black;"></i>
                            <!-- Notification Button -->
                            <button type="button" class="btn-notif" data-bs-toggle="modal" data-bs-target="#notificationModal">
                                <i class="ti-bell"></i>
                            </button>
                            <!-- Cart & Profile -->
                            <div class="d-flex align-items-center">
                                <c:if test="${sessionScope.customer == null}">
                                    <a href="cart"><i class="ti-shopping-cart" style="font-size: 150%; color: black;"></i></a>
                                    </c:if>
                                    <c:if test="${sessionScope.customer != null}">
                                    <a href="cart"><i class="ti-shopping-cart" style="font-size: 150%; color: black;"></i></a>
                                    <p class="mb-0">${sessionScope.numOfProCartOfCus}</p>
                                </c:if>
                            </div>
                            <c:if test="${sessionScope.customer != null}">
                                <a href="viewCustomerProfile">
                                    <c:choose>
                                        <c:when test="${empty sessionScope.customer.avatar}">
                                            <img src="assets/imgs/icon/user (3).png" alt="User" class="profile-img">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="assets/imgs/CustomerAvatar/${sessionScope.customer.avatar}" alt="User" class="profile-img">
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                            </c:if>
                            <c:if test="${sessionScope.customer == null}">
                                <a class="btn btn-primary" href="customerLogin">Login</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Notification Modal -->
        <div class="modal fade" id="notificationModal" tabindex="-1" aria-labelledby="notificationModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="notificationModalLabel">New Reply From FShop</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="list-group" id="notificationList">
                            <p class="text-muted">Loading...</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS Bundle -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const notifBtn = document.querySelector('.btn-notif');
                notifBtn.addEventListener('click', function () {
                    fetch('notificationServlet?ajax=true')
                            .then(response => response.json())
                            .then(data => {
                                console.log("Received data:", data); // Kiểm tra JSON trong console
                                const notificationList = document.getElementById("notificationList");
                                notificationList.innerHTML = "";

                                if (data.replies && Array.isArray(data.replies) && data.replies.length > 0) {
                                    data.replies.forEach((reply, index) => {
                                        let productId = data.productId[index] || ""; // Lấy productId tương ứng

                                        // Tạo thẻ <a> để hiển thị thông báo
                                        const aElem = document.createElement('a');
                                        aElem.href = "ProductDetailServlet?id=" + productId;
                                        aElem.classList.add('list-group-item', 'list-group-item-action');
                                        aElem.innerHTML = `
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Reply #${reply.replyID}</h6>
                                <small class="${reply.isRead ? 'text-muted' : 'text-danger'}">
            ${reply.isRead ? "Viewed" : "Not viewed yet"}
                                </small>
                            </div>
                            <p class="mb-1">${reply.answer}</p>
                        `;

                                        // Gửi repliesID về server khi click vào thông báo
                                        aElem.addEventListener('click', function (event) {
                                            event.preventDefault(); // Ngăn chặn mở trang ngay lập tức

                                            fetch("notificationServlet", {
                                                method: "POST",
                                                headers: {"Content-Type": "application/x-www-form-urlencoded"},
                                                body: "repliesID=" + reply.replyID
                                            }).then(response => response.text())
                                                    .then(() => {
                                                        window.location.href = "ProductDetailServlet?id=" + productId;
                                                    })
                                                    .catch(error => console.error("Error updating reply status:", error));
                                        });

                                        notificationList.appendChild(aElem);
                                    });
                                } else {
                                    notificationList.innerHTML = '<p class="text-muted">No new comments.</p>';
                                }
                            })
                            .catch(error => {
                                console.error('Error fetching unread replies:', error);
                                document.getElementById("notificationList").innerHTML = '<p class="text-muted">Error loading data</p>';
                            });
                });
            });

        </script>
    </body>
</html>

