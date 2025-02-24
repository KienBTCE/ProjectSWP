<%-- 
    Document   : managerHeader
    Created on : 24-Feb-2025, 01:01:16
    Author     : kiuth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 20px;
        background: #fff;
        border-bottom: 1px solid #ddd;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }

    .header-left {
        display: flex;
        align-items: center;
    }

    .logo {
        font-size: 22px;
        font-weight: bold;
        color: #7D5FFF;
        display: flex;
        align-items: center;
    }

    .search-bar {
        margin-left: 20px;
        border: 1px solid #ddd;
        padding: 5px 10px;
        border-radius: 20px;
        display: flex;
        align-items: center;
        background: #f5f5f5;
    }

    .search-bar input {
        border: none;
        outline: none;
        background: transparent;
        padding: 5px;
    }

    .header-right {
        display: flex;
        align-items: center;
    }

    .user-profile {
        display: flex;
        align-items: center;
        font-size: 14px;
        font-weight: bold;
        color: #333;
    }

    .user-profile img {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        margin-right: 10px;
    }
</style>

<div class="header">
    <div class="header-left">
        <div class="logo">FShop</div>
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="Search...">
            <i class="fas fa-search"></i>
        </div>
    </div>
    <script>
        document.getElementById("searchInput").addEventListener("keyup", function () {
            let value = this.value.toLowerCase();
            document.querySelectorAll("tbody tr").forEach(row => {
                row.style.display = row.textContent.toLowerCase().includes(value) ? "" : "none";
            });
        });

    </script>
    <div class="header-right">
        <div class="user-profile">
            <img src="user-avatar.jpg" alt="User">
            <span>Hi, KiUThi</span>
        </div>
    </div>
</div>
