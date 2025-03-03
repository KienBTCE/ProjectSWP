<%-- 
    Document   : SidebarDashboardAdmin
    Created on : Feb 28, 2025, 11:14:49 PM
    Author     : NguyenPVT-CE181835
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Sidebar</title>
    </head>
    <body>
        <div class="sidebar">
            <a href="#" class="logo">
                <i class='bx bx-code-alt'></i>
                <div class="logo-name"><span>F</span>Shop</div>
            </a>
            <ul class="side-menu">
                <li><a href="#"><i class='bx bxs-dashboard'></i>Dashboard</a></li>
                <li><a href="EmployeeList"><i class='bx bx-store-alt'></i>Shop</a></li>
                <li><a href="EmployeeList"><i class='bx bx-analyse'></i>Statistic</a></li>
                <li><a href="EmployeeList"><i class='bx bx-group'></i>Employee</a></li>
            </ul>
            <ul class="side-menu">
                <li>
                    <a href="#" class="logout">
                        <i class='bx bx-log-out-circle'></i>
                        Logout
                    </a>
                </li>
            </ul>
        </div>
        <script>
            document.querySelectorAll('.side-menu li a').forEach(link => {
                link.addEventListener('click', function () {
                    document.querySelectorAll('.side-menu li a').forEach(item => {
                        item.classList.remove('active');
                    });
                    this.classList.add('active');
                });
            });
        </script>
    </body>
</html>
