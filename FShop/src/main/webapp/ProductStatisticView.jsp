<%-- 
    Document   : ProductStatisticView
    Created on : 06-Mar-2025, 22:23:54
    Author     : ThyLTKCE181577
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Statistics</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
        <style>
            .container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 20px;
                padding: 20px;
                text-align: center;
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
            }
            .chart-box {
                background: white;
                padding: 15px;
                border-radius: 10px;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                width: 40%;
            }
            canvas {
                max-height: 300px;
            }
            h3 {
                margin-bottom: 10px;
            }
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
                margin-left: 250px;
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

            .table-container {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            }

            table {
                border-radius: 10px;
                overflow: hidden;
            }

            thead {
                background: #7D69FF;
                color: white;
            }

            tbody tr:hover {
                background: #f2f2f2;
                transition: 0.3s;
            }

            .table-navigate{
                display: flex;
                justify-content: space-between;
            }
            .btn-add {
                background-color: #003375;
                color: white;
                border: none;
                display: inline-block;
                padding: 5px 10px;
            }
            .btn-delete {
                border: none;
                display: inline-block;
                padding: 5px 10px;
                max-width: 80px;
                width: 80px;
                align-items: center;
            }
            .btn-edit {
                background-color: #007bff;
                color: white;
                border: none;
                display: inline-block;
                padding: 5px 10px;
            }
            .search-container {
                display: flex;
                align-items: center;
                width: 100%;
                max-width: 300px; /* Giảm kích thước tối đa */
                background: white;
                border-radius: 13px; /* Bo góc mềm hơn */
                overflow: hidden;
                border: 2px solid #7D69FF;
                margin-bottom: 15px;
            }

            .search-input {
                flex: 1;
                border: none;
                outline: none;
                padding: 8px 12px; /* Giảm padding để nhỏ hơn */
                font-size: 14px; /* Giảm kích thước chữ */
                color: #555;
            }

            .search-button {
                border: none;
                padding: 8px 12px; /* Giảm padding của nút */
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 14px;
            }

            .search-button:hover {
                background: #6454cc;
            }
            .btn-add {
                background-color: #003375;
                color: white;
                border: none;
                display: inline-block;
                padding: 5px 10px;
            }
            .btn-delete {
                border: none;
                display: inline-block;
                padding: 5px 10px;
                max-width: 80px;
                width: 80px;
                align-items: center;
            }
            .btn-edit {
                background-color: #007bff;
                color: white;
                border: none;
                display: inline-block;
                padding: 5px 10px;
            }

        </style>
    </head>
    <body>
        <jsp:include page="SidebarDashboard.jsp"></jsp:include>
            <div class="content">
            <jsp:include page="HeaderDashboard.jsp"></jsp:include>
            <div class ="container">
                <div class="chart-box">
                    <h3>Weekly Sales</h3>
                    <canvas id="salesChart"></canvas>
                </div>
                <div class="chart-box">
                    <h3>Top Selling Products</h3>
                    <canvas id="topProductsChart"></canvas>
                </div>
                <div class="chart-box">
                    <h3>Low Stock Products</h3>
                    <canvas id="lowStockChart"></canvas>
                </div>
                <div class="chart-box">
                    <h3>Sales by Category</h3>
                    <canvas id="categorySalesChart"></canvas>
                </div>
            </div>
        </div>

        <script>
            fetch('ProductStatisticServlet?action=data')
                    .then(response => response.json())
                    .then(data => {
                        renderChart('salesChart', 'bar', 'Weekly Sales', data.weeklySales.map(d => d.date), data.weeklySales.map(d => d.total));
                        renderChart('topProductsChart', 'bar', 'Top Selling Products', data.topProducts.map(d => d.FullName), data.topProducts.map(d => d.totalSold));
                        renderChart('lowStockChart', 'doughnut', 'Low Stock Products', data.lowStock.map(d => d.FullName), data.lowStock.map(d => d.Stock));
                        renderChart('categorySalesChart', 'pie', 'Sales by Category', data.categorySales.map(d => d.Name), data.categorySales.map(d => d.totalSold));
                    });

            function renderChart(canvasId, type, label, labels, values) {
                new Chart(document.getElementById(canvasId), {
                    type: type,
                    data: {labels: labels, datasets: [{label: label, data: values, backgroundColor: getRandomColors(values.length)}]},
                    options: {responsive: true, maintainAspectRatio: false, scales: type === 'bar' || type === 'line' ? {y: {beginAtZero: true}} : {}}
                });
            }

            function getRandomColors(count) {
                const colors = ['rgba(255, 99, 132, 0.6)', 'rgba(54, 162, 235, 0.6)', 'rgba(255, 206, 86, 0.6)', 'rgba(75, 192, 192, 0.6)', 'rgba(153, 102, 255, 0.6)', 'rgba(255, 159, 64, 0.6)'];
                return Array.from({length: count}, (_, i) => colors[i % colors.length]);
            }
        </script>
    </body>
</html>
