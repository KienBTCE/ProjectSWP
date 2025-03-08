<%-- 
    Document   : ShopManagerDashboard
    Created on : 02-Mar-2025, 00:52:25
    Author     : ThyLTKCE181577
--%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, java.util.Map"%>

<%
    Map<String, Object> stats = (Map<String, Object>) request.getAttribute("stats");
    List<Map<String, Object>> weeklySalesPhone = (List<Map<String, Object>>) request.getAttribute("weeklySalesPhone");
    List<Map<String, Object>> weeklySalesLaptop = (List<Map<String, Object>>) request.getAttribute("weeklySalesLaptop");
    List<Map<String, Object>> newCustomers = (List<Map<String, Object>>) request.getAttribute("newCustomers");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #ffffff;
                text-align: center;
                padding: 20px;
                color: #333;
            }
            .container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 20px;
                max-width: 1200px;
                margin: auto;
                margin-bottom: 50px;
            }
            .box {
                background: #f8f8f8;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
                width: 250px;
            }
            .chart-container {
                margin-top: 100px;
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 20px;
                max-width: 1200px;
                height: 500px;
                margin: auto;
            }
            .chart-box {
                width: 45%;
                background: #f8f8f8;
                padding: 15px;
                border-radius: 10px;
                box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            }
            ul {
                list-style: none;
                padding: 0;
                max-width: 500px;
                margin: auto;
            }
            li {
                background: #f8f8f8;
                padding: 10px;
                margin: 5px 0;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <h2>Dashboard</h2>
        <div class="container">
            <div class="box">
                <h3><%= stats.get("totalCustomers")%> Customers</h3>
            </div>
            <div class="box">
                <h3><%= stats.get("totalProducts")%> Products</h3>
            </div>
            <div class="box">
                <h3><%= stats.get("totalOrders")%> Orders</h3>
            </div>
        </div>
        <div class="chart-container">
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
            <li><%= customer.get("name")%> - <%= customer.get("email")%></li>
                <% }%>
        </ul>
        <script>
            const weeklySalesPhone = JSON.parse('<%= new Gson().toJson(weeklySalesPhone)%>');
            const weeklySalesLaptop = JSON.parse('<%= new Gson().toJson(weeklySalesLaptop)%>');
            renderChart('weeklySalesPhoneChart', 'bar', 'Weekly Sales - Phones',
                    weeklySalesPhone.map(d => d.productName), weeklySalesPhone.map(d => d.totalSold));
            renderChart('weeklySalesLaptopChart', 'bar', 'Weekly Sales - Laptops',
                    weeklySalesLaptop.map(d => d.productName), weeklySalesLaptop.map(d => d.totalSold));
            function renderChart(canvasId, type, label, labels, values) {
                new Chart(document.getElementById(canvasId), {
                    type: type,
                    data: {labels: labels, datasets: [{label: label, data: values, backgroundColor: 'rgba(100, 100, 255, 0.6)'}]},
                    options: {responsive: true, maintainAspectRatio: false, scales: {y: {beginAtZero: true}}}
                });
            }
        </script>
    </body>
</html>
