<%-- 
    Document   : sidebarOrderManager
    Created on : Mar 2, 2025, 8:00:00 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F Shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                display: flex;
            }

            .sidebar {
                width: 250px;
                height: 97vh;
                background: #FFFFFF;
                color: black;
                padding-top: 20px;
                box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);
                transform: translateZ(0);
                position: relative;
                z-index: 10;
                border-radius: 10px;
                margin-top: 10px;
                position: fixed;
            }

            .sidebar a {
                color: #7A7D90;
                text-decoration: none;
                padding: 10px;
                display: block;
            }

            .sidebar a:hover {
                background: #7D69FF;
                color: white;
                width: 90%;
                font-weight: bold;

                border-top-right-radius: 10px;
                border-bottom-right-radius: 10px;
                border-top-left-radius: 0;
                border-bottom-left-radius: 0;

            }

            .header {
                display: flex;
                justify-content: right;
                align-items: center;
                padding: 10px;
                background: #FFFFFF;
                box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);
                border-radius: 10px;
                height: 85px;
            }

            .logo-side-bar {
                margin-left: 5%;
                margin-bottom: 3%;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <img src="assets/imgs/Dashboard/Group 1521.svg" class="logo-side-bar">
            <h6><a href="ViewOrderListServlet">Order Management</a></h6>
            <a href="ViewListNewFeedbackServlet">Feedback</a>
            <a href="DeleteOrder.jsp">Delete</a>
            <a style="margin-top: auto; color: red;" href="" onclick="confirmLogout()"><i class="bi bi-box-arrow-right"></i> Logout</a>
        </div>
          <script>
            function confirmLogout() {
                if (confirm("Are you sure you want to log out?")) {
                    fetch('<%= request.getContextPath()%>/Logout', {
                        method: 'GET'
                    }).then(response => {
                        if (response.redirected) {
                            window.location.href = response.url;
                        }
                    }).catch(error => console.error('Logout failed:', error));
                }
            }
        </script>
    </body>
</html>
