<%-- 
    Document   : ShopManagerDashboard
    Created on : 02-Mar-2025, 00:52:25
    Author     : ThyLTKCE181577
--%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, java.util.Map"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background: #f4f7fc;
            }
            .sidebar {
                width: 250px;
                background: linear-gradient(white, #6a11cb, #2575fc);
                color: white;
                padding: 20px;
                min-height: 100vh;
                box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.1);
            }
            .sidebar a {
                color: white;
                text-decoration: none;
                display: block;
                padding: 10px;
                border-radius: 5px;
            }
            .sidebar a:hover {
                background: rgba(255, 255, 255, 0.2);
            }
            .content {
                padding: 20px;
                flex-grow: 1;
            }
            .card {
                background: linear-gradient(135deg, #ff9a9e, #fad0c4);
                color: white;
                text-align: center;
                border: none;
                transition: transform 0.3s;
            }
            .card:hover {
                transform: translateY(-5px);
            }
            .chart-container {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
                gap: 20px;
            }
            .chart-box {
                width: 45%;
                background: white;
                padding: 15px;
                border-radius: 10px;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <div class="d-flex">
            <div class="sidebar">
                <h3><img src="assets/imgs/Dashboard/Group 1521.svg" class="logo-side-bar"></h3>
                <a href="ShopDashboardServlet"><i class="fas fa-store"></i> Shop Management</a>
                <a href="CustomerListServlet"><i class="fas fa-users"></i> Customer Management</a>
                <a href="ProductListServlet"><i class="fas fa-box"></i> Product Management</a>
                <a href="ProductStatisticServlet"><i class="fas fa-chart-bar"></i> Product Statistic</a>
            </div>
            <div class="content">
                <div class="container text-center">
                    <div class="row g-4">
                        <div class="col-md-4" data-aos="fade-up">
                            <div class="card p-3">
                                <h5>Total Customers</h5>
                                <h3><%= stats.get("totalCustomers")%> Customers</h3>
                            </div>
                        </div>
                        <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                            <div class="card p-3">
                                <h5>Total Products</h5>
                                <h3><%= stats.get("totalProducts")%> Products</h3>
                            </div>
                        </div>
                        <div class="col-md-4" data-aos="fade-up" data-aos-delay="400">
                            <div class="card p-3">
                                <h5>Total Orders</h5>
                                <h3><%= stats.get("totalOrders")%> Orders</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="chart-container mt-4">
                    <div class="chart-box" data-aos="fade-up">
                        <canvas id="weeklySalesPhoneChart"></canvas>
                    </div>
                    <div class="chart-box" data-aos="fade-up" data-aos-delay="200">
                        <canvas id="weeklySalesLaptopChart"></canvas>
                    </div>
                </div>
                <div class="mt-4" data-aos="fade-up">
                    <h4>New Customers</h4>
                    <ul class="list-group">
                        <% for (Map<String, Object> customer : newCustomers) {%>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <%= customer.get("name")%> - <%= customer.get("email")%>
                        </li>
                        <% }%>
                    </ul>
                </div>
            </div>
        </div>
        <script>
            AOS.init();
            const weeklySalesPhone = JSON.parse('<%= new Gson().toJson(weeklySalesPhone)%>');
            const weeklySalesLaptop = JSON.parse('<%= new Gson().toJson(weeklySalesLaptop)%>');
            function renderChart(canvasId, label, labels, values) {
                new Chart(document.getElementById(canvasId), {
                    type: 'bar',
                    data: {labels: labels, datasets: [{label: label, data: values, backgroundColor: 'rgba(100, 100, 255, 0.6)'}]},
                    options: {responsive: true, maintainAspectRatio: false, animation: {duration: 2000}}
                });
            }
            renderChart('weeklySalesPhoneChart', 'Weekly Sales - Phones', weeklySalesPhone.map(d => d.productName), weeklySalesPhone.map(d => d.totalSold));
            renderChart('weeklySalesLaptopChart', 'Weekly Sales - Laptops', weeklySalesLaptop.map(d => d.productName), weeklySalesLaptop.map(d => d.totalSold));
        </script>
    </body>
</html>
