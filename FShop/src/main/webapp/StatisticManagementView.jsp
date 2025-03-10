<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F Shop - Statistics</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>    
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            .content {
                flex-grow: 1;
                padding: 12px;
                margin-left: 250px;
            }
            
            /* Nút Statistic dạng thẻ <a> */
            .stat-card {
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 10px;
                border-radius: 8px;
                box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
                text-align: center;
                font-size: 14px;
                font-weight: bold;
                width: 150px;
                transition: transform 0.2s;
                text-decoration: none;
                color: white;
            }
            .stat-card:hover {
                transform: scale(1.05);
            }
            .inventory-card { background-color: #4F8CF7; }
            .revenue-card { background-color: #8C52FF; }

            /* Bảng có viền và header cố định khi cuộn */
            .rounded-table {
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            }
            .table-container {
                max-height: 250px;
                overflow-y: auto;
                border-radius: 10px;
                border: 1px solid #ddd;
            }
            .table-container thead {
                position: sticky;
                top: 0;
                background-color: #f8f9fa;
                z-index: 10;
            }
        </style>
    </head>
    <body>
        <jsp:include page="SidebarDashboard.jsp"></jsp:include>
        <div class="content">
            <jsp:include page="HeaderDashboard.jsp"></jsp:include>
            
            <div class="container mt-4">
                <!-- Stat Cards -->
                <div class="row justify-content-center text-center">
                    <div class="col-md-3">
                        <a href="#" class="stat-card inventory-card">
                            <i class='bx bx-box bx-sm'></i>
                            <span>Inventory</span>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="stat-card revenue-card">
                            <i class='bx bx-dollar-circle bx-sm'></i>
                            <span>Revenue</span>
                        </a>
                    </div>
                </div>
                
                <!-- Inventory Charts -->
                <div class="row mt-4">
                    <div class="col-md-6">
                        <h5>Inventory - Laptops</h5>
                        <canvas id="laptopChart"></canvas>
                    </div>
                    <div class="col-md-6">
                        <h5>Inventory - Phones</h5>
                        <canvas id="phoneChart"></canvas>
                    </div>
                </div>
                
                <!-- Revenue Charts (Monthly) -->
                <div class="row mt-4">
                    <div class="col-md-6">
                        <h5>Revenue - Laptops (Monthly)</h5>
                        <canvas id="laptopRevenueChart"></canvas>
                    </div>
                    <div class="col-md-6">
                        <h5>Revenue - Phones (Monthly)</h5>
                        <canvas id="phoneRevenueChart"></canvas>
                    </div>
                </div>
                
                <!-- Top Products & Top Customers -->
                <div class="row mt-4">
                    <div class="col-md-6">
                        <h4>Top 6 Products</h4>
                        <div class="table-container rounded-table">
                            <table class="table table-striped">
                                <thead class="table-primary">
                                    <tr>
                                        <th>Product</th>
                                        <th>Sales</th>
                                        <th>Percentage</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="listStatistic" var="c">
                                    <tr><td>${c.productName}</td><td>${c.soldQuantity}</td><td>${c.soldPercentage}%</td></tr>
                                </c:forEach> 
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <h4>Top Customers</h4>
                        <div class="table-container rounded-table">
                            <table class="table table-striped">
                                <thead class="table-success">
                                    <tr>
                                        <th>Customer</th>
                                        <th>Email</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>Bui Trung Kien</td><td>kientbe0108@fpt.edu.vn</td></tr>
                                    <tr><td>Bui Minh Nhut</td><td>rhutmine180569@fpt.edu.vn</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
            function showInventoryStatistic() {
                alert("Hiển thị Inventory Statistic");
            }
            function showRevenueStatistic() {
                alert("Hiển thị Revenue Statistic");
            }
            
            // Inventory Charts
            new Chart(document.getElementById("laptopChart"), {
                type: "bar",
                data: {
                    labels: ["Dell", "Asus", "MacBook", "Acer", "Lenovo"],
                    datasets: [{
                        label: "Laptops",
                        data: [50, 70, 90, 40, 60],
                        backgroundColor: "#FF5733"
                    }]
                }
            });
            new Chart(document.getElementById("phoneChart"), {
                type: "bar",
                data: {
                    labels: ["iPhone", "Samsung", "Xiaomi", "Redmi"],
                    datasets: [{
                        label: "Phones",
                        data: [30, 50, 80, 20],
                        backgroundColor: "#007bff"
                    }]
                }
            });
            
            // Monthly Revenue Charts
            const months = ["January", "February", "March", "April", "May", "June"];
            new Chart(document.getElementById("laptopRevenueChart"), {
                type: "bar",
                data: {
                    labels: months,
                    datasets: [{
                        label: "Laptop Revenue (VND)",
                        data: [12000000, 15000000, 13000000, 17000000, 16000000, 18000000],
                        backgroundColor: "rgba(255, 87, 51, 0.6)",
                        borderColor: "rgba(255, 87, 51, 1)",
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: { y: { beginAtZero: true } }
                }
            });
            new Chart(document.getElementById("phoneRevenueChart"), {
                type: "bar",
                data: {
                    labels: months,
                    datasets: [{
                        label: "Phone Revenue (VND)",
                        data: [8000000, 9000000, 8500000, 9500000, 9200000, 9800000],
                        backgroundColor: "rgba(0, 123, 255, 0.6)",
                        borderColor: "rgba(0, 123, 255, 1)",
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: { y: { beginAtZero: true } }
                }
            });
        </script>
    </body>
</html>
