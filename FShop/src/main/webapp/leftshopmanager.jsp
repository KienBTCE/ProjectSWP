<%-- 
    Document   : leftshopmanager
    Created on : 09-Feb-2025, 22:52:45
    Author     : kiuthi
--%>
<%-- leftshopmanager.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    #sidebarMenu {
        width: 250px; /* Giảm kích thước sidebar */
        position:absolute;
        top: 85px;
        left: 0;
        height: 100vh;
        overflow-y: auto;
        border-right: 1px solid #ccc;
        background-color: white;
    }

    /* Thêm padding cho nội dung chính để tránh bị che */
    .container {
        margin-left: 260px; /* Tạo khoảng trống ngang với sidebar */
    }


    .sidebar-logo {
        font-size: 24px;
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px;
    }

    .sidebar-item {
        display: flex;
        align-items: center;
        padding: 12px 20px;
        font-size: 16px;
        color: #333;
        text-decoration: none;
        transition: 0.3s;
    }

    .sidebar-item i {
        margin-right: 10px;
    }

    .sidebar-item:hover,
    .sidebar-item.active {
        background: #7D5FFF;
        color: white;
        border-radius: 5px;
    }
</style>
<%
    String currentPage = request.getRequestURI();
%>

<nav id="sidebarMenu">
    <a href="dashboard.jsp" class="sidebar-item <%= currentPage.endsWith("dashboard.jsp") ? "active" : ""%>">
        <i class="fas fa-tachometer-alt"></i> DashBoard
    </a>

    <a href="manageProductView.jsp" class="sidebar-item <%= currentPage.endsWith("manageProductView.jsp") ? "active" : ""%>">
        <i class="fas fa-boxes"></i> Product Management
    </a>

    <a href="productStatistics" class="sidebar-item <%= currentPage.contains("productStatistics") ? "active" : ""%>">
        <i class="fas fa-chart-bar"></i> Product Statistics
    </a>

    <a href="CustomerListView.jsp" class="sidebar-item <%= currentPage.endsWith("CustomerListView.jsp") ? "active" : ""%>">
        <i class="fas fa-user"></i> Customer Management
    </a>
</nav>
