<%-- 
    Document   : ShopManagerDashboard
    Created on : 02-Mar-2025, 00:52:25
    Author     : ThyLTKCE181577
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, java.util.Map"%>

<%
    Map<String, Object> stats = (Map<String, Object>) request.getAttribute("stats");
    List<Map<String, Object>> weeklySalesPhone = (List<Map<String, Object>>) request.getAttribute("weeklySalesPhone");
    List<Map<String, Object>> weeklySalesLaptop = (List<Map<String, Object>>) request.getAttribute("weeklySalesLaptop");
    List<Map<String, Object>> topProducts = (List<Map<String, Object>>) request.getAttribute("topProducts");
    List<Map<String, Object>> newCustomers = (List<Map<String, Object>>) request.getAttribute("newCustomers");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f9;
                text-align: center;
                padding: 20px;
            }
            .container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 20px;
            }
            .box {
                background: linear-gradient(135deg, #667eea, #764ba2);
                color: white;
                padding: 20px;
                border-radius: 15px;
                box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
                width: 250px;
                transition: transform 0.3s;
            }
            .box:hover {
                transform: scale(1.05);
            }
            .chart-box {
                width: 45%;
                background: white;
                padding: 15px;
                border-radius: 10px;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            }
            ul {
                list-style: none;
                padding: 0;
            }
            li {
                background: #fff;
                padding: 10px;
                margin: 5px 0;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <h2>Dashboard</h2>
        <div class="container">
            <div class="box">
                <h3><i class="fas fa-users"></i> <%= stats.get("totalCustomers")%> Customers</h3>
            </div>
            <div class="box">
                <h3><i class="fas fa-box"></i> <%= stats.get("totalProducts")%> Products</h3>
            </div>
            <div class="box">
                <h3><i class="fas fa-shopping-cart"></i> <%= stats.get("totalOrders")%> Orders</h3>
            </div>
        </div>
        <div class="container">
            <div class="chart-box">
                <canvas id="weeklySalesPhoneChart"></canvas>
            </div>
            <div class="chart-box">
                <canvas id="weeklySalesLaptopChart"></canvas>
            </div>
        </div>

        <h3>New Customers</h3>
        <ul>
            <% for (Map<String, Object> customer : newCustomers) {%>
            <li><i class="fas fa-user"></i> <%= customer.get("name")%> - <%= customer.get("email")%></li>
                <% }%>
        </ul>
        <script>
            const weeklySalesPhone = <%= new org.json.JSONArray(weeklySalesPhone)%>;
            const weeklySalesLaptop = <%= new org.json.JSONArray(weeklySalesLaptop)%>;
            renderChart('weeklySalesPhoneChart', 'bar', 'Weekly Sales - Phones',
                    weeklySalesPhone.map(d => d.productName), weeklySalesPhone.map(d => d.totalSold));
            renderChart('weeklySalesLaptopChart', 'bar', 'Weekly Sales - Laptops',
                    weeklySalesLaptop.map(d => d.productName), weeklySalesLaptop.map(d => d.totalSold));
            function renderChart(canvasId, type, label, labels, values) {
                new Chart(document.getElementById(canvasId), {
                    type: type,
                    data: {labels: labels, datasets: [{label: label, data: values, backgroundColor: 'rgba(54, 162, 235, 0.6)'}]},
                    options: {responsive: true, maintainAspectRatio: false, scales: {y: {beginAtZero: true}}}
                });
            }
        </script>
    </body>
</html>
