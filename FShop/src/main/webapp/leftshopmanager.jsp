<%-- 
    Document   : leftshopmanager
    Created on : 09-Feb-2025, 22:52:45
    Author     : kiuth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Sidebar -->
<style>
    #sidebarMenu {
        width: 300px; 
        position: fixed; 
        top: 85px; 
        height: 100vh; 
        overflow-y: auto; 
        border-right: 1px solid #ccc; 
    }

    .list-group-item {
        display: flex;
        align-items: center; 
        justify-content: flex-start; 
        height: 50px; 
        padding: 0 15px; 
        margin-bottom: 5px; 
        overflow: hidden; 
        white-space: nowrap; 
        text-overflow: ellipsis; 
        background-color: transparent;
        transition: none; 
    }

    .list-group-item i {
        width: 20px; 
        height: 20px; 
        margin-right: 10px; 
    }

    .list-group-item:active,
    .list-group-item:focus {
        outline: none; 
        background-color: transparent; 
        color: inherit; 
        box-shadow: none; 
    }

    .list-group-item:hover {
        background-color: transparent;
        color: inherit;
    }
</style>

<nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white" style="padding: 0px; margin-top: 85px;">
    <div class="position-sticky">
        <div class="list-group list-group-flush mx-3 mt-4">
            <c:if test="${sessionScope.acc.isSell == 1}">
                <a href="manager" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="fas fa-shoe-prints fa-fw me-3"></i><span>Product Management</span>
                </a>
            </c:if> 
            <c:if test="${sessionScope.acc.isAdmin == 1}">
                <a href="managerAccount" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="fas fa-user-circle fa-fw me-3"></i><span>Account Management</span>
                </a>
                <a href="doanhthutheothang" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="fas fa-chart-bar fa-fw me-3"></i><span>Monthly Revenue</span>
                </a>
                <a href="doanhThuTheoThu" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="fas fa-chart-pie fa-fw me-3"></i><span>Weekly Revenue</span>
                </a>
            </c:if> 
        </div>
    </div>
</nav>


