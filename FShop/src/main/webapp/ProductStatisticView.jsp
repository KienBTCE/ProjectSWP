<%-- 
    Document   : ProductStatisticView
    Created on : 06-Mar-2025, 22:23:54
    Author     : ThyLTKCE181577
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Statistics</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                background-color: #f8f9fa;
            }
            .container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 20px;
                padding: 20px;
            }
            .chart-box {
                background: white;
                padding: 15px;
                border-radius: 10px;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                width: 35%;
            }
            canvas {
                max-height: 300px;
            }
            h3 {
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
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
