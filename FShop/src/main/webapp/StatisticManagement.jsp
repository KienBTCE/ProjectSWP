<%-- 
    Document   : StatisticManagement
    Created on : Mar 6, 2025, 12:38:42 AM
    Author     : NguyenPVT-CE181835
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F Shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>    
        <style>
             .content {
                flex-grow: 1;
                padding: 12px;
                margin-left: 250px;
            }
        </style>
    </head>
    <body>
         <jsp:include page="SidebarDashboard.jsp"></jsp:include>
         <div class="content">
              <jsp:include page="HeaderDashboard.jsp"></jsp:include>
         </div>
    </body>
</html>
