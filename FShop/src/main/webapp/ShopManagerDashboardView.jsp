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
    List<Map<String, Object>> weeklySalesMouse = (List<Map<String, Object>>) request.getAttribute("weeklySalesMouse");

    List<Map<String, Object>> weeklySalesHeadphone = (List<Map<String, Object>>) request.getAttribute("weeklySalesHeadphone");
    List<Map<String, Object>> weeklySalesCharger = (List<Map<String, Object>>) request.getAttribute("weeklySalesCharger");
    List<Map<String, Object>> weeklySalesChargingCable = (List<Map<String, Object>>) request.getAttribute("weeklySalesChargingCable");
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
                display: flex;
            }

            .sidebar {
                width: 250px;
                height: 700px;
                background: #FFFFFF;
                color: black;
                padding-top: 20px;
                box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);
                transform: translateZ(0);
                position: relative;
                z-index: 10;
                border-radius: 10px;
                margin-top: 10px;
            }

            .sidebar a {
                color: #7A7D90;
                text-decoration: none;
                padding: 10px;
                display: block;
            }

            .sidebar a:hover {
                background: #7D69FF;
                color: white;
                width: 90%;
                font-weight: bold;

                border-top-right-radius: 10px;
                border-bottom-right-radius: 10px;
                border-top-left-radius: 0;
                border-bottom-left-radius: 0;

            }

            .content {
                flex-grow: 1;
                padding: 12px;
                margin-left: 125px;
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

            .logo-side-bar {
                margin-left: 5%;
                margin-bottom: 3%;
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
                width: 32%;
                background: white;
                padding: 15px;
                border-radius: 10px;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <jsp:include page="SidebarDashboard.jsp"></jsp:include>
            <div class="content">
            <jsp:include page="HeaderDashboard.jsp"></jsp:include>
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
                    <div class="chart-box" data-aos="fade-up" data-aos-delay="400">
                        <canvas id="weeklySalesMouseChart"></canvas>
                    </div>

                    <div class="chart-box" data-aos="fade-up">
                        <canvas id="weeklySalesHeadphoneChart"></canvas>
                    </div>
                    <div class="chart-box" data-aos="fade-up" data-aos-delay="200">
                        <canvas id="weeklySalesChargerChart"></canvas>
                    </div>
                    <div class="chart-box" data-aos="fade-up" data-aos-delay="400">
                        <canvas id="weeklySalesChargingCableChart"></canvas>
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
            const weeklySalesMouse = JSON.parse('<%= new Gson().toJson(weeklySalesMouse)%>');

            const weeklySalesHeadphone = JSON.parse('<%= new Gson().toJson(weeklySalesHeadphone)%>');
            const weeklySalesCharger = JSON.parse('<%= new Gson().toJson(weeklySalesCharger)%>');
            const weeklySalesChargingCable = JSON.parse('<%= new Gson().toJson(weeklySalesChargingCable)%>');
            function renderChart(canvasId, label, labels, values) {
                new Chart(document.getElementById(canvasId), {
                    type: 'bar',
                    data: {labels: labels, datasets: [{label: label, data: values, backgroundColor: 'rgba(100, 100, 255, 0.6)'}]},
                    options: {responsive: true, maintainAspectRatio: false, animation: {duration: 2000}}
                });
            }
            renderChart('weeklySalesPhoneChart', 'Weekly Sales - Phones', weeklySalesPhone.map(d => d.productName), weeklySalesPhone.map(d => d.totalSold));
            renderChart('weeklySalesLaptopChart', 'Weekly Sales - Laptops', weeklySalesLaptop.map(d => d.productName), weeklySalesLaptop.map(d => d.totalSold));
            renderChart('weeklySalesMouseChart', 'Weekly Sales - Mouses', weeklySalesMouse.map(d => d.productName), weeklySalesMouse.map(d => d.totalSold));
            renderChart('weeklySalesHeadphoneChart', 'Weekly Sales - Headphones', weeklySalesHeadphoneChart.map(d => d.productName), weeklySalesHeadphoneChart.map(d => d.totalSold));
            renderChart('weeklySalesChargerChart', 'Weekly Sales - Laptops', weeklySalesChargerChart.map(d => d.productName), weeklySalesChargerChart.map(d => d.totalSold));
            renderChart('weeklySalesChargingCableChart', 'Weekly Sales - Mouses', weeklySalesChargingCableChart.map(d => d.productName), weeklySalesChargingCableChart.map(d => d.totalSold));
        </script>
    </body>
</html>
