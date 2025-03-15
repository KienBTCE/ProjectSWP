<%-- 
    Document   : HeaderDashboard
    Created on : Feb 27, 2025, 12:38:21 PM
    Author     : KienBTCE180180
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                display: flex;             
            }

            .header {
                display: flex;
                justify-content: right;
                align-items: center;
                padding: 10px;
                background: #FFFFFF;
                box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);
                border-radius: 10px;
                height: 60px;
            }

            .icon {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                object-fit: cover;
            }
            .fullname{
                text-decoration: none;
                font-weight: bold;
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <a href="ViewEmployeeProfile">
                <div style="display: flex; align-items: center;">
                    <img src="assets/imgs/EmployeeAvatar/defauft_avatar.jpg" alt="User Icon" class="icon">
                    <p class="fullname" style="margin-top: 10px;">Hi, ${sessionScope.employee.getFullname()}</p>
                </div>
            </a>
        </div>
        <div class="table-navigate">
        </div>
    </body>
</html>
