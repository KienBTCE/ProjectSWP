<%-- 
    Document   : DeleteOrder
    Created on : Mar 5, 2025, 10:26:30 PM
    Author     : HP
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Order Page</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="assets/css/orderDetail.css">

        <style>
            /* Định dạng modal */
            .modal {
                display: none;
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
            }
            .modal-content {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                text-align: center;
                width: 400px;
                max-height: 80vh;
                overflow-y: auto;
            }
            .btn-danger, .btn-secondary {
                margin: 10px;
                padding: 10px 20px;
                font-size: 16px;
            }

            /* Định dạng form */
            .form-container {
                max-width: 600px;
                margin: 80px auto 50px auto; /* Tạo khoảng cách để tránh header */
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 8px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            }
            .dropdown select {
                padding: 10px;
                font-size: 16px;
                width: 100%;
                border-radius: 5px;
                border: 1px solid #ccc;
            }
            .btn-success {
                width: 100%;
                padding: 12px;
                font-size: 18px;
                border-radius: 5px;
            }
            .btn-success:hover {
                background-color: #28a745;
                border-color: #218838;
            }

            /* Tiêu đề cảnh báo */
            h2 {
                color: #e74c3c;
                text-align: center;
                font-size: 1.5rem;
                font-weight: bold;
                margin-top: 30px;
            }
            .alert-warning {
                text-align: center;
                font-size: 1.1rem;
                background-color: #f8d7da;
                color: #721c24;
                padding: 15px;
                border-radius: 5px;
                margin-top: 20px;
            }

            /* Định dạng header sang góc phải */
            .header-container {
                position: fixed;
                top: 0;
                right: 0;
                z-index: 1000;
                width: auto;
            }

            /* Định dạng sidebar cố định bên trái */
            .sidebar-container {
                position: fixed;
                top: 0;
                left: 0;
                z-index: 2000;
                height: 100%;
            }

            /* Responsive cho màn hình nhỏ */
            @media (max-width: 768px) {
                .form-container {
                    margin-top: 100px; /* Điều chỉnh khoảng cách nếu cần */
                }
            }
        </style>
    </head>
    <body>
        <!-- Sidebar cố định bên trái -->
        <div class="sidebar-container">
            <jsp:include page="sidebarOrderManager.jsp" />  
        </div>

        <!-- Header cố định bên phải -->
        <div class="header-container">
            <jsp:include page="HeaderDashboard.jsp"></jsp:include>
        </div>

        <!-- Form container -->
        <div class="form-container">
            <h2>Warning: This action will permanently delete orders</h2>
            <h3 class="alert-warning">
                Please select the timeframe for which orders should be deleted (1, 3, 6, or 12 months ago).
            </h3>
            <form id="previewForm">
                <div class="dropdown mb-3">
                    <label for="delete" class="form-label">Select Timeframe for Deletion:</label>
                    <select name="delete" id="delete">
                        <option value="1">1 Month Ago</option>
                        <option value="3">3 Months Ago</option>
                        <option value="6">6 Months Ago</option>
                        <option value="12">12 Months Ago</option>
                    </select>
                </div>
                <button type="button" class="btn btn-success" onclick="previewOrders()">
                    <i class="fa-solid fa-eye"></i> Preview Orders to be Deleted
                </button>
            </form>
        </div>

        <!-- Preview Modal -->
        <div id="previewModal" class="modal">
            <div class="modal-content">
                <h3>Orders to be Deleted</h3>
                <div id="orderList">
                    <!-- Danh sách đơn hàng sẽ được load tại đây -->
                </div>
                <button id="confirmDeleteBtn" class="btn btn-danger">Yes, Delete</button>
                <button id="cancelPreviewBtn" class="btn btn-secondary">Cancel</button>
            </div>
        </div>

        <!-- Success Modal -->
        <div id="successModal" class="modal">
            <div class="modal-content">
                <h3>Deletion Successful!</h3>
                <p>You will be redirected to the main page shortly.</p>
            </div>
        </div>

        <script>
            function previewOrders() {
                const timeframe = document.getElementById("delete").value;
                fetch("DeleteOrderServlet?delete=" + timeframe)
                        .then(response => response.text())
                        .then(data => {
                            document.getElementById("orderList").innerHTML = data;
                            document.getElementById("previewModal").style.display = "flex";
                        })
                        .catch(error => console.error("Error fetching preview orders:", error));
            }

            document.getElementById("confirmDeleteBtn").onclick = function () {
                const timeframe = document.getElementById("delete").value;
                fetch("DeleteOrderServlet", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: "delete=" + encodeURIComponent(timeframe)
                })
                        .then(response => response.text())
                        .then(data => {
                            document.getElementById("previewModal").style.display = "none";
                            document.getElementById("successModal").style.display = "flex";
                            setTimeout(() => {
                                window.location.href = "ViewOrderListServlet";
                            }, 2000);
                        })
                        .catch(error => console.error("Error deleting orders:", error));
            };

            document.getElementById("cancelPreviewBtn").onclick = function () {
                document.getElementById("previewModal").style.display = "none";
            };
        </script>

    </body>
</html>
