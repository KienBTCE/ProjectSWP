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
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-zoom@1.0.1/dist/chartjs-plugin-zoom.min.js"></script>
        <style>
            .content {
                flex-grow: 1;
                padding: 10px 15px;
                margin-left: 240px;
            }

            .fixed-header {
                position: fixed;
                width: 82%;
                margin-bottom: 500px;
            }

            .stat-card {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding: 15px;
                border-radius: 12px;
                box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
                text-align: center;
                font-size: 16px;
                font-weight: bold;
                width: 200px;
                transition: transform 0.3s;
                text-decoration: none;
                color: white;
                height: 110px;
            }
            .stat-card:hover {
                transform: scale(1.08);
            }
            .inventory-card {
                background-color: #60CDB6;
            }
            .revenue-card {
                background-color: #7455B2;
            }

            .chart-container {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 15px;
                background-color: #fff;
                box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
                margin: 10px auto;
                width: 80%; /* Điều chỉnh kích thước biểu đồ nhỏ hơn */


            }

            canvas {
                max-width: 100%;
                height: 100%;  /* Đảm bảo biểu đồ chiếm chiều cao toàn bộ container */
            }


            /* Nút */

            .nav-buttons {
                display: flex;
                justify-content: center;
                gap: 15px;
                margin-top: 10px;
            }
            .nav-buttons button {
                border: none;
                background: transparent;
                font-size: 24px;
                cursor: pointer;
                color: #4F8CF7;
            }
            .nav-buttons button:hover {
                color: #8C52FF;
            }

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

                <div class="fixed-header">
                <jsp:include page="HeaderDashboard.jsp"></jsp:include>
                </div>
            </div>
            <div class="container mt-4">
                <!-- Stat Cards -->
                <div class="row mt-4 g-4 justify-content-center">
                    <div class="row justify-content-center text-center" style="margin-top: 55px;">
                        <div class="col-md-3">
                            <a href="InventoryStatisticServlet" class="stat-card inventory-card">
                                <i class='bx bx-box bx-lg'></i>
                                <span>Inventory</span>
                            </a>
                        </div>
                        <div class="col-md-3">
                            <a href="RevenueStatisticServlet" class="stat-card revenue-card">
                                <i class='bx bx-dollar-circle bx-lg'></i>
                                <span>Revenue</span>
                            </a>
                        </div>
                    </div>

                    <!-- Charts Section -->
                    <div class="row mt-2 g-3">
                        <!-- Inventory Laptop Chart -->
                        <div class="col-md-5 chart-container">
                            <h5>Inventory - Laptops</h5>
                            <canvas id="inventoryLaptopChart" class="inventory-laptop-chart"></canvas>
                            <div class="nav-buttons">
                                <button id="prevPageLaptop"><i class='bx bx-chevron-left'></i></button>
                                <button id="nextPageLaptop"><i class='bx bx-chevron-right'></i></button>
                            </div>
                        </div>
                        <div class="col-md-5 chart-container">
                            <h5>Inventory - Phones</h5>
                            <canvas id="inventoryPhoneChart"></canvas>
                            <div class="nav-buttons">
                                <button id="prevPagePhone"><i class='bx bx-chevron-left'></i></button>
                                <button id="nextPagePhone"><i class='bx bx-chevron-right'></i></button>
                            </div>
                        </div>
                    </div>

                    <!-- Inventory Phone Chart -->


                    <div class="row mt-2 g-4">
                        <!-- Laptop Revenue Chart -->
                        <div class="col-md-5 chart-container">
                            <h5>Revenue - Laptops (Monthly)</h5>
                            <canvas id="laptopRevenueChart"></canvas>
                            <div class="nav-buttons">
                                <button id="prevPageLaptop1"><i class='bx bx-chevron-left'></i></button>
                                <button id="nextPageLaptop1"><i class='bx bx-chevron-right'></i></button>
                            </div>
                        </div>
                        <div class="col-md-5 chart-container">
                            <h5>Revenue - Phones (Monthly)</h5>
                            <canvas id="phoneRevenueChart"></canvas>
                            <div class="nav-buttons">
                                <button id="prevPagePhone1"><i class='bx bx-chevron-left'></i></button>
                                <button id="nextPagePhone1"><i class='bx bx-chevron-right'></i></button>
                            </div>
                        </div>
                    </div>

                    <!-- Top Products & Top Customers -->
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <h4>Top Products</h4>
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
                                    <c:if test="${not empty listP}">
                                        <c:forEach items="${listP}" var="p">
                                            <tr>
                                                <td>${p.productName}</td>
                                                <td>${p.soldQuantity}</td>
                                                <td>${p.soldPercentage}%</td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
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
                                        <th>Order</th>
                                    </tr>
                                </thead>
                                <tbody>                         
                                    <c:if test="${not empty listC}">
                                        <c:forEach items="${listC}" var="c">
                                            <tr>
                                                <td>${c.customerName}</td>
                                                <td>${c.customerEmail}</td>
                                                <td>${c.successfulOrders}</td>
                                            </tr>
                                        </c:forEach> 
                                    </c:if>                             
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>

            //Laptop
            var productNamesLaptop = [];
            var stockQuantitiesLaptop = [];
            <c:forEach items="${listInventoryLaptop}" var="item">
            productNamesLaptop.push('${item.modelName}');
            stockQuantitiesLaptop.push('${item.stockQuantity}');
            </c:forEach>

            var currentPage = 0;
            var itemsPerPage = 3;

            function updateChart() {
                var start = currentPage * itemsPerPage;
                var end = start + itemsPerPage;
                var pagedLabels = productNamesLaptop.slice(start, end);
                var pagedData = stockQuantitiesLaptop.slice(start, end);

                while (pagedLabels.length < itemsPerPage) {
                    pagedLabels.push(" ");
                    pagedData.push(0);
                }

                inventoryLaptopChart.data.labels = pagedLabels;
                inventoryLaptopChart.data.datasets[0].data = pagedData;
                inventoryLaptopChart.update();
            }

            var ctx = document.getElementById("inventoryLaptopChart").getContext("2d");
            var inventoryLaptopChart = new Chart(ctx, {
                type: "bar",
                data: {
                    labels: [],
                    datasets: [{
                            label: "Inventory Laptop",
                            data: [],
                            backgroundColor: '#75A05C'
                        }]
                }
            });

            updateChart();

            document.getElementById("prevPageLaptop").addEventListener("click", function () {
                if (currentPage > 0) {
                    currentPage--;
                    updateChart();
                }
            });

            document.getElementById("nextPageLaptop").addEventListener("click", function () {
                if ((currentPage + 1) * itemsPerPage < productNamesLaptop.length) {
                    currentPage++;
                    updateChart();
                }
            });


            // Phone
            var productNamesPhone = [];
            var stockQuantitiesPhone = [];
            <c:forEach items="${listInventoryPhone}" var="item">
            productNamesPhone.push('${item.modelName}');
            stockQuantitiesPhone.push('${item.stockQuantity}');
            </c:forEach>
            var currentPagePhone = 0;
            var itemsPerPagePhone = 3;
            function updatePhoneChart() {
                var start = currentPagePhone * itemsPerPagePhone;
                var end = start + itemsPerPagePhone;
                var pagedLabelsPhone = productNamesPhone.slice(start, end);
                var pagedDataPhone = stockQuantitiesPhone.slice(start, end);
                while (pagedLabelsPhone.length < itemsPerPagePhone) {
                    pagedLabelsPhone.push(" ");
                    pagedDataPhone.push(0);
                }
                inventoryPhoneChart.data.labels = pagedLabelsPhone;
                inventoryPhoneChart.data.datasets[0].data = pagedDataPhone;
                inventoryPhoneChart.update();
            }

            var ctxPhone = document.getElementById("inventoryPhoneChart").getContext("2d");
            var inventoryPhoneChart = new Chart(ctxPhone, {
                type: "bar",
                data: {
                    labels: [],
                    datasets: [{
                            label: "Inventory Phone",
                            data: [],
                            backgroundColor: '#2596be'

                        }]
                }
            });

            updatePhoneChart();

            document.getElementById("prevPagePhone").addEventListener("click", function () {
                if (currentPagePhone > 0) {
                    currentPagePhone--;
                    updatePhoneChart();
                }
            });

            document.getElementById("nextPagePhone").addEventListener("click", function () {
                if ((currentPagePhone + 1) * itemsPerPagePhone < productNamesPhone.length) {
                    currentPagePhone++;
                    updatePhoneChart();
                }
            });

            // Laptop Revenue
            var monthLaptop = [];
            var revenueLaptop = [];
            <c:forEach items="${listRevenueLaptop}" var="item">
            monthLaptop.push('${item.month}');  // Giả sử giá trị là số (1, 2, 3, ...)
            revenueLaptop.push('${item.revenue}');
            </c:forEach>
            var monthNames = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"];
            var itemsPerPageLaptop = 6;
            var currentPageLaptop = 0;
            var revenueMapping = {};
            for (var i = 0; i < monthLaptop.length; i++) {
                var m = parseInt(monthLaptop[i]);
                revenueMapping[m] = revenueLaptop[i];
            }

            function updateLaptopChart() {
                var startMonth = currentPageLaptop * itemsPerPageLaptop + 1; // ví dụ trang 0: 1; trang 1: 7
                var endMonth = startMonth + itemsPerPageLaptop; // không bao gồm endMonth
                var pagedLabelsLaptop = [];
                var pagedDataLaptop = [];

                for (var m = startMonth; m < endMonth; m++) {
                    pagedLabelsLaptop.push(monthNames[m - 1]);
                    pagedDataLaptop.push(revenueMapping[m] ? revenueMapping[m] : 0);
                }
                laptopRevenueChart.data.labels = pagedLabelsLaptop;
                laptopRevenueChart.data.datasets[0].data = pagedDataLaptop;
                laptopRevenueChart.update();
            }

            var ctxLaptop = document.getElementById("laptopRevenueChart").getContext("2d");
            var laptopRevenueChart = new Chart(ctxLaptop, {
                type: "bar",
                data: {
                    labels: [],
                    datasets: [{
                            label: "Laptop Revenue (VND)",
                            data: [],
                            backgroundColor: "#A25665"
                        }]
                }
            });

            updateLaptopChart();

            document.getElementById("prevPageLaptop1").addEventListener("click", function () {
                if (currentPageLaptop > 0) {
                    currentPageLaptop--;
                    updateLaptopChart();
                }
            });

            document.getElementById("nextPageLaptop1").addEventListener("click", function () {
                if ((currentPageLaptop + 1) * itemsPerPageLaptop < monthLaptop.length) {
                    currentPageLaptop++;
                    updateLaptopChart();
                }
            });


            // Phone Revenue
            var monthPhone = [];
            var revenuePhone = [];
            <c:forEach items="${listRevenuePhone}" var="item">
            monthPhone.push('${item.month}');  // Giả sử giá trị là số (1, 2, 3, ...)
            revenuePhone.push('${item.revenue}');
            </c:forEach>
            var monthNames = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"];
            var itemsPerPagePhone1 = 6;
            var currentPagePhone1 = 0;
            var revenueMappingPhone = {};
            for (var i = 0; i < monthPhone.length; i++) {
                // Chuyển giá trị tháng sang số nguyên
                var m = parseInt(monthPhone[i]);
                revenueMappingPhone[m] = revenuePhone[i];
            }
            function updatePhoneChart1() {
                var startMonth = currentPagePhone1 * itemsPerPagePhone1 + 1;
                var endMonth = startMonth + itemsPerPagePhone1;
                var pagedLabelsPhone = [];
                var pagedDataPhone = [];

                // Duyệt qua 6 tháng của trang hiện tại
                for (var m = startMonth; m < endMonth; m++) {
                    pagedLabelsPhone.push(monthNames[m - 1]);  // Vì mảng monthNames bắt đầu từ 0
                    // Nếu có dữ liệu doanh thu của tháng m, dùng giá trị đó; nếu không thì là 0
                    pagedDataPhone.push(revenueMappingPhone[m] ? revenueMappingPhone[m] : 0);
                }

                // Cập nhật dữ liệu cho biểu đồ
                phoneRevenueChart.data.labels = pagedLabelsPhone;
                phoneRevenueChart.data.datasets[0].data = pagedDataPhone;
                phoneRevenueChart.update();
            }

            var ctxPhone = document.getElementById("phoneRevenueChart").getContext("2d");
            var phoneRevenueChart = new Chart(ctxPhone, {
                type: "bar",
                data: {
                    labels: [],
                    datasets: [{
                            label: "Phone Revenue (VND)",
                            data: [],
                            backgroundColor: "#A29256"
                        }]
                }
            });

            updatePhoneChart1();

            document.getElementById("prevPagePhone1").addEventListener("click", function () {
                if (currentPagePhone1 > 0) {
                    currentPagePhone1--;
                    updatePhoneChart1();
                }
            });

            document.getElementById("nextPagePhone1").addEventListener("click", function () {
                if (currentPagePhone1 < 1) {
                    currentPagePhone1++;
                    updatePhoneChart1();
                }
            });
        </script>
    </body>
</html>
