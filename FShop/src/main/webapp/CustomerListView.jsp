<%-- 
    Document   : CustomerListView
    Created on : 22-Feb-2025, 15:25:44
    Author     : kiuthi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product List</title>
        <!-- Bootstrap CSS CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            /* Custom CSS for the navbar */
            .navbar {
                background-color: black;
                padding: 10px;
                display: flex;
                justify-content: flex-start;
                align-items: center;
            }

            /* Ensuring the items are next to each other in the navbar */
            .navbar-brand {
                color: white;
                font-size: 1.2rem;
                margin-right: 15px; /* Adding space between PRJ301 and Products */
            }

            /* Custom CSS for table and title */
            h2 {
                font-size: 2.5rem;
                margin-bottom: 20px;
            }

            .logout-section {
                text-align: left;
                margin-bottom: 20px;
            }
            .logout-section h4 {
                display: inline;
                margin-right: 15px;
            }

            .btn-add {
                margin-bottom: 20px;
                background-color: #003375;
                color: white;
                border: none;
                padding: 10px 20px;
                display: inline-block;
            }


            /* Custom buttons for edit and delete */
            .btn-edit {
                background-color: #28a745;
                color: white;
                border: none;
                padding: 5px 10px;
                margin-right: 5px;
            }

            .btn-delete {
                background-color: #dc3545;
                color: white;
                border: none;
                padding: 5px 10px;
            }

            .btn-edit:hover, .btn-delete:hover {
                opacity: 0.8;
            }

            .btn-rounded {
                border-radius: 5px;
            }

            /* Ensuring proper table display */
            /* Mở rộng bảng cho phù hợp trang */
            .table-container {
                width: 100%; /* Chiếm toàn bộ chiều rộng */
                max-width: 100%; /* Giới hạn tối đa */
                margin: 0 auto; /* Căn giữa */
            }

            /* Căn chỉnh bảng để không bị dính vào lề */
            .table {
                width: 82%;
                table-layout: fixed; /* Giúp căn chỉnh tự động */
            }

            /* Căn chỉnh lại các cột */
            .table th, .table td {
                padding: 10px;
                font-size: 14px;
                text-align: left;

                word-wrap: break-word; /* Đảm bảo chữ không bị tràn */
            }

            h1 {
                font-size: 24px;
            }

            .table th:nth-child(1), /* ID */
            .table td:nth-child(1),
            .table th:nth-child(5), /* Status */
            .table td:nth-child(5),
            .table th:nth-child(6), /* Actions */
            .table td:nth-child(6) {
                width: 1%; /* Giới hạn kích thước cột */
                white-space: nowrap; /* Tránh xuống dòng */
            }

            .table th:nth-child(2), /* ID */
            .table td:nth-child(2),
            .table th:nth-child(3), /* Status */
            .table td:nth-child(3),
            .table th:nth-child(4), /* Actions */
            .table td:nth-child(4) {
                width: 3%; /* Giới hạn kích thước cột */
                white-space: nowrap; /* Tránh xuống dòng */
            }
        </style>
    </head>

    <body>
        <jsp:include page="leftshopmanager.jsp" />
        <jsp:include page="managerHeader.jsp" />
        <!-- Main container -->
        <div class="container mt-4 table-container">

            <!-- Product Table -->
            <table class="table table-bordered table-hover align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Customer Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Step 1: Initialize DAO to interact with the database
                        CustomerDAO dao = new CustomerDAO();

                        // Step 2: Call method to get the list of products
                        ResultSet rs = dao.getCustomerList();

                        // Step 3: Loop through the list of products
                        while (rs.next()) {
                    %>

                    <tr>
                        <td><%= rs.getInt("CustomerID")%></td>
                        <td><%= rs.getString("FullName")%></td>
                        <td><%= rs.getString("Email")%></td>
                        <td><%= rs.getString("PhoneNumber")%></td>
                        <td>
                            <button class="btn btn-sm <%= rs.getInt("isBlock") == 0 ? "btn-success" : "btn-danger"%>"
                                    onclick="confirmToggle(<%= rs.getInt("CustomerID")%>, <%= rs.getInt("isBlock")%>);">
                                <%= rs.getInt("isBlock") == 0 ? "Activate" : "Block"%>
                            </button>
                        </td>
                <script>
                    function confirmToggle(customerID, currentStatus) {
                        let action = currentStatus === 0 ? "Activate" : "Block";
                        if (confirm("Are you sure you want to " + action + " this customer?")) {
                            window.location.href = "CustomerList?action=toggleStatus&id=" + customerID;
                        }
                    }
                </script>
                <td>
                    <button class="btn btn-edit" onclick="showCustomerDetail(<%= rs.getInt("CustomerID")%>)">Detail</button>
                </td>

                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
        <!-- Customer Detail Modal -->
        <div class="modal fade" id="customerDetailModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Customer Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <p><strong>ID:</strong> <span id="CustomerID"></span></p>
                        <p><strong>Name:</strong> <span id="FullName"></span></p>
                        <p><strong>Email:</strong> <span id="Email"></span></p>
                        <p><strong>Phone:</strong> <span id="PhoneNumber"></span></p>
                        <p><strong>Status:</strong> <span id="isBlock"></span></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function showCustomerDetail(customerID) {
                fetch("CustomerListServlet?id=" + customerID)
                        .then(response => response.json())
                        .then(data => {
                            document.getElementById("CustomerID").textContent = data.customerID; // Kiểm tra key thực tế
                            document.getElementById("FullName").textContent = data.fullName;  // Key chữ thường
                            document.getElementById("Email").textContent = data.email;
                            document.getElementById("PhoneNumber").textContent = data.phoneNumber;
                            document.getElementById("isBlock").textContent = data.isBlock == 0 ? "Active" : "Blocked";


                            // Hiển thị popup
                            var customerModal = new bootstrap.Modal(document.getElementById("customerDetailModal"));
                            customerModal.show();
                        })
                        .catch(error => console.error('Error:', error));
            }
        </script>

        <!-- Bootstrap JS CDN -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>