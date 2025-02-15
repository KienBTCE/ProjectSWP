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

                <ul style="list-style-type: none; padding: 0; color: black; ">
                    <li style="margin: 15px 0;"><a  href="profile.jsp" class="sidebar-link" data-page="" style="color: black; text-decoration: none;">Profile</a></li>
                    <li style="margin: 15px 0;"><a  href="address.jsp" class="sidebar-link" data-page="" style="color: black; text-decoration: none; ">Address</a></li>
                    <li style="margin: 15px 0;"><a  href="orders.jsp" class="sidebar-link" data-page="" style="color: black; text-decoration: none; ">Orders</a></li>
                    <li style="margin: 15px 0;"><a href="#" class="sidebar-link" data-page="notifications.jsp" style="color: black; text-decoration: none; ;">Notifications</a></li>
                    <li style="margin: 15px 0;"><a href="#" class="sidebar-link" data-page="shopping.jsp" style="color: black; text-decoration: none; ">Shopping</a></li>
                    <li style="margin: 15px 0;"><a href="#" class="sidebar-link" data-page="change-password.jsp" style="color: black; text-decoration: none; ">Change Password</a></li>
                    <li style="margin: 15px 0;"><a href="#" class="sidebar-link" data-page="coins.jsp" style="color: black; text-decoration: none; ">Request to disable account</a></li>
                    
                </ul>
            </div>

        </main>
    </body>

</html>
