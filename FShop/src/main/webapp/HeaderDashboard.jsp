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
                height: 85px;
            }

            .icon {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div style="margin-right: 30px">
                <img style="float: left; margin-right: 15px;"
                     src="assets/imgs/Dashboard/FF8D5F6D-1708-4455-81D8-5F4456F83F52_LE_auto_x2-min.png" alt="User Icon" class="icon">
                <p style="display: flex; margin: 12px 0 0 0;">Hi, Kien</p>
            </div>
        </div>
        <div class="table-navigate">
        </div>
    </body>
</html>
