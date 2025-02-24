<%-- 
    Document   : manageProduct
    Created on : 23-Feb-2025, 22:36:47
    Author     : kiuth
--%>

<%@page import="DAOs.ProductDAO"%>
<%@page import="java.sql.ResultSet"%>
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
                background-color: #003375;
                color: white;
                border: none;
                display: inline-block;
                padding: 5px 10px;
            }

            /* Reset table alignment */
            .table th {
                vertical-align: middle;
                text-align: center;
            }

            .table td {
                vertical-align: middle;
                text-align: left;
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

            .container {
                margin-left: 270px; /* Dịch sang phải để tránh sidebar */
                max-width: 80%; /* Giới hạn chiều rộng */
            }

            .table-container {
                margin: 20px auto;
                width: 100%;
            }



        </style>
    </head>

    <body>
        <jsp:include page="leftshopmanager.jsp" />
        <jsp:include page="managerHeader.jsp" />
        <!-- Main container -->
        <div class="container mt-4">

            <!-- Product Table -->
            <table class="table table-bordered table-hover align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Category</th>
                        <th>Brand</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Status</th>
                        <th>Actions</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Step 1: Initialize DAO to interact with the database
                        ProductDAO dao = new ProductDAO();

                        // Step 2: Call method to get the list of products
                        ResultSet rs = dao.getProductList();

                        // Step 3: Loop through the list of products
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("ProductID")%></td>
                        <td><%= rs.getString("CategoryName")%></td>
                        <td><%= rs.getString("BrandName")%></td>
                        <td><%= rs.getString("FullName")%></td>
                        <td><%= rs.getLong("Price")%></td>
                        <td><%= rs.getInt("Quantity")%></td>
                        <td><%= rs.getInt("isDeleted")%></td>
                        <td>
                            <button class="btn btn-sm <%= rs.getInt("isDeleted") == 0 ? "btn-success" : "btn-danger"%>"
                                    onclick="confirmToggle(<%= rs.getInt("ProductID")%>, <%= rs.getInt("isDeleted")%>);">
                                <%= rs.getInt("isDeleted") == 0 ? "Activate" : "Block"%>
                            </button>
                        </td>
                <script>
                    function confirmToggle(productID, currentStatus) {
                        let action = currentStatus === 0 ? "Activate" : "Block";
                        if (confirm("Are you sure you want to " + action + " this product?")) {
                            window.location.href = "ProductListServlet?action=toggleStatus&id=" + productID;
                        }
                    }
                </script>
                <td>
                    <button class="btn btn-add" onclick="">Update</button>
                    <button class="btn btn-delete" onclick="">Delete</button>
                    <button class="btn btn-edit" onclick="showProductDetail(<%= rs.getInt("ProductID")%>)">Detail</button>
                </td>

                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
        <div class="modal fade" id="productDetailModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Product Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <p><strong>ID:</strong> <span id="ProductID"></span></p>
                        <p><strong>Category:</strong> <span id="CategoryName"></span></p>
                        <p><strong>Brand:</strong> <span id="BrandName"></span></p>
                        <p><strong>Name:</strong> <span id="FullName"></span></p>
                        <p><strong>Price:</strong> <span id="Price"></span></p>
                        <p><strong>Quantity:</strong> <span id="Quantity"></span></p>
                        <p><strong>Status:</strong> <span id="isDeleted"></span></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function showProductDetail(productID) {
                fetch("ProductListServlet?id=" + productID)
                        .then(response => response.json())
                        .then(data => {
                            console.log(data); // Kiểm tra dữ liệu

                            if (data.error) {
                                alert(data.error);
                                return;
                            }

                            document.getElementById("ProductID").textContent = data.productID;
                            document.getElementById("CategoryName").textContent = data.categoryName;
                            document.getElementById("BrandName").textContent = data.brandName;
                            document.getElementById("FullName").textContent = data.fullName;
                            document.getElementById("Price").textContent = data.price;
                            document.getElementById("Quantity").textContent = data.quantity;
                            document.getElementById("isDeleted").textContent = data.isDeleted == 0 ? "Active" : "Blocked";

                            var productModal = new bootstrap.Modal(document.getElementById("productDetailModal"));
                            productModal.show();
                        })
                        .catch(error => console.error('Error:', error));
            }

            }
        </script>

        <!-- Bootstrap JS CDN -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>