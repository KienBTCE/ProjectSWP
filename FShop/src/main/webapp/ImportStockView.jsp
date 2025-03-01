<%-- 
    Document   : ImportStockView
    Created on : Feb 27, 2025, 3:57:03 PM
    Author     : KienBTCE180180
--%>

<%@page import="java.util.List"%>
<%@page import="Models.Product"%>
<%@page import="Models.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome for icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <style>
            body {
                display: flex;
            }

            .sidebar {
                width: 250px;
                height: 97vh;
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
            /* ========================================================= */

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

            .search-box {
                max-width: 300px;
                margin-bottom: 10px;
            }

            .table-navigate{
                display: flex;
                justify-content: space-between;
            }

            /* Hiệu ứng hover khi di chuột */
            .clickable-row {
                cursor: pointer;
                /*transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;*/
            }

            /* Hiệu ứng hover khi di chuột vào cả hàng */
            .clickable-row:hover td {
                background-color: #f8f9fa; /* Màu nền xám nhạt khi hover */
                color: red;
            }

            .clickable-product-row {
                cursor: pointer;
            }

            .clickable-product-row:hover td {
                background-color: #f8f9fa;
                color: red;
            }

        </style>
    </head>
    <body>
        <jsp:include page="SidebarDashboard.jsp"></jsp:include>
            <div class="content">
            <jsp:include page="HeaderDashboard.jsp"></jsp:include>
                <div class="container mt-4">
                    <h2 class="text-center mb-4">Import Order</h2>

                    <!-- Supplier Section -->
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4 class="mb-0">Supplier Information</h4>
                        </div>

                        <table class="table mt-3">
                            <thead>
                                <tr>
                                    <th>Supplier</th>
                                    <th>Address</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Status</th>
                                    <th>Tax ID</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="selectedName">N/A</td>
                                    <td id="selectedAddress">N/A</td>
                                    <td id="selectedEmail">N/A</td>
                                    <td id="selectedPhone">N/A</td>
                                    <td id="selectedStatus">N/A</td>
                                    <td id="selectedTaxId">N/A</td>
                                </tr>
                            </tbody>
                        </table>

                    </div>

                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4 class="mb-0">Supplier List</h4>
                            <input type="text" id="searchSupplierInput" class="form-control search-box" placeholder="Find by name ..." onkeyup="searchSupplier()">
                        </div>

                        <table class="table mt-3">
                            <thead>
                                <tr>
                                    <th>Supplier</th>
                                    <th>Address</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Status</th>
                                    <th>Tax ID</th>
                                </tr>
                            </thead>
                            <tbody id="supplierListTable">
                            <c:forEach items="${suppliers}" var="s">
                                <tr class="clickable-row" data-name="${s.getName()}" 
                                    data-address="${s.getAddress()}" 
                                    data-email="${s.getEmail()}" 
                                    data-phone="${s.getPhoneNumber()}" 
                                    data-status="${s.getStatus()}" 
                                    data-taxid="${s.getTaxId()}">
                                    <td>${s.getName()}</td>
                                    <td>${s.getAddress()}</td>
                                    <td>${s.getEmail()}</td>
                                    <td>${s.getPhoneNumber()}</td>
                                    <td>${s.getStatus()}</td>
                                    <td>${s.getTaxId()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>

                <!-- =============================================== PRODUCT =============================================== -->

                <!-- Product List Table -->
                <!-- Product Information Section -->
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h4 class="mb-0">Selected Product</h4>
                    </div>
                    <table class="table mt-3">
                        <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Product ID</th>
                                <th>Model</th>
                                <th>Stock</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody id="selectedProductTable">
                            <tr>
                                <td id="selectedProductName"></td>
                                <td id="selectedProductId"></td>
                                <td id="selectedProductModel"></td>
                                <td id="selectedProductStock"></td>
                                <td id="selectedProductStatus"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Product Entry Section -->
                <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h4 class="mb-0">Product List</h4>
                        <input type="text" id="searchProductInput" class="form-control search-box" placeholder="Find by name ..." onkeyup="searchProduct()">
                    </div>

                    <table class="table mt-3">
                        <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Product ID</th>
                                <th>Model</th>
                                <th>Stock</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody id="productList">
                            <c:forEach items="${products}" var="p">
                                <tr class="clickable-product-row"
                                    data-product-name="${p.getFullName()}"
                                    data-productid="${p.getProductId()}"
                                    data-model="${p.getModel()}"
                                    data-stock="${p.getStock()}"
                                    data-product-status="${p.getDeleted()}">
                                    <td>${p.getFullName()}</td>
                                    <td>${p.getProductId()}</td>
                                    <td>${p.getModel()}</td>
                                    <td>${p.getStock()}</td>
                                    <td>${p.getDeleted()}</td>
                                </tr>
                            </c:forEach>

                        </tbody>

                    </table>
                </div>

            </div>
        </div>

        <script>
            function searchSupplier() {
                let input = document.getElementById("searchSupplierInput");
                let filter = input.value.toLowerCase();
                let table = document.getElementById("supplierListTable");
                let rows = table.getElementsByTagName("tr");

                for (let i = 1; i < rows.length; i++) {
                    let nameCell = rows[i].getElementsByTagName("td")[1];
                    if (nameCell) {
                        let nameText = nameCell.textContent || nameCell.innerText;
                        rows[i].style.display = nameText.toLowerCase().includes(filter) ? "" : "none";
                    }
                }
            }
        </script>

        <script>
            function searchProduct() {
                let input = document.getElementById("searchProductInput").value.toLowerCase();
                let table = document.getElementById("productList");
                let rows = table.getElementsByTagName("tr");

                for (let i = 0; i < rows.length; i++) { // Lặp qua tất cả hàng
                    let nameCell = rows[i].getElementsByTagName("td")[0]; // Giả sử cột "Product Name" là cột đầu tiên (td[0])
                    if (nameCell) {
                        let nameText = nameCell.textContent || nameCell.innerText;
                        rows[i].style.display = nameText.toLowerCase().includes(input) ? "" : "none";
                    }
                }
            }
        </script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                let selectedProducts = []; // Danh sách chứa các sản phẩm đã chọn

                document.querySelectorAll(".clickable-product-row").forEach(row => {
                    row.addEventListener("click", function () {
                        // Lấy dữ liệu từ thuộc tính data-*
                        let product = {
                            name: this.getAttribute("data-product-name"),
                            id: this.getAttribute("data-productid"),
                            model: this.getAttribute("data-model"),
                            stock: this.getAttribute("data-stock"),
                            status: this.getAttribute("data-product-status")
                        };

                        // Kiểm tra sản phẩm đã có trong danh sách chưa
                        let exists = selectedProducts.some(p => p.id === product.id);
                        if (exists) {
                            alert("Sản phẩm này đã được chọn!");
                            return;
                        }

                        // Thêm sản phẩm vào danh sách
                        selectedProducts.push(product);
                        updateSelectedProductTable();
                    });
                });

                // Hàm cập nhật bảng Selected Product
                function updateSelectedProductTable() {
                    let tableBody = document.getElementById("selectedProductTable");
                    tableBody.innerHTML = ""; // Xóa nội dung cũ

                    for (let i = 0; i < selectedProducts.length; i++) {
                        let product = selectedProducts[i];
                        let row = document.createElement("tr");
                        row.innerHTML = `
        <td id="productName${i}"></td>
        <td id="productId${i}"></td>
        <td id="productModel${i}"></td>
        <td id="productStock${i}"></td>
        <td id="productStatus${i}"></td>`;

                        tableBody.appendChild(row);

                        // Cập nhật nội dung bằng ID duy nhất
                        document.getElementById(`productName${i}`).innerText = product.name;
                        document.getElementById(`productId${i}`).innerText = product.id;
                        document.getElementById(`productModel${i}`).innerText = product.model;
                        document.getElementById(`productStock${i}`).innerText = product.stock;
                        document.getElementById(`productStatus${i}`).innerText = product.status;
                        
                        console.log("");
                    }



                    // Gán sự kiện xóa sản phẩm
                    document.querySelectorAll(".removeProduct").forEach(btn => {
                        btn.addEventListener("click", function () {
                            let index = this.getAttribute("data-index");
                            selectedProducts.splice(index, 1); // Xóa sản phẩm khỏi danh sách
                            updateSelectedProductTable(); // Cập nhật lại bảng
                        });
                    });
                }
            });

        </script>

        <script>
            document.querySelectorAll(".clickable-row").forEach(row => {
                row.addEventListener("click", function () {
                    // Lấy dữ liệu từ thuộc tính data-*
                    let name = this.getAttribute("data-name");
                    let address = this.getAttribute("data-address");
                    let email = this.getAttribute("data-email");
                    let phone = this.getAttribute("data-phone");
                    let status = this.getAttribute("data-status");
                    let taxid = this.getAttribute("data-taxid");

                    // Cập nhật bảng dưới
                    document.getElementById("selectedName").textContent = name;
                    document.getElementById("selectedAddress").textContent = address;
                    document.getElementById("selectedEmail").textContent = email;
                    document.getElementById("selectedPhone").textContent = phone;
                    document.getElementById("selectedStatus").textContent = status;
                    document.getElementById("selectedTaxId").textContent = taxid;
                });
            });


            // Edit product functionality
            document.getElementById("productList").addEventListener("click", function (event) {
                if (event.target.classList.contains("editBtn")) {
                    const row = event.target.closest("tr");
                    const supplier = row.cells[0].innerText;
                    const model = row.cells[1].innerText;
                    const productName = row.cells[2].innerText;
                    const quantity = row.cells[3].innerText;
                    const price = row.cells[4].innerText.replace(" VND", "").replace(",", "");
                    document.getElementById("supplier").value = supplier;
                    document.getElementById("model").value = model;
                    document.getElementById("productName").value = productName;
                    document.getElementById("quantity").value = quantity;
                    document.getElementById("price").value = price;
                    // Delete the row to replace it after editing
                    row.remove();
                }
            });
            // Delete product functionality
            document.getElementById("productList").addEventListener("click", function (event) {
                if (event.target.classList.contains("deleteBtn")) {
                    event.target.closest("tr").remove();
                }
            });
            document.getElementById("editSupplier").addEventListener("click", function () {
                document.getElementById("supplier").removeAttribute("readonly");
            });
            document.getElementById("addProduct").addEventListener("click", function () {
                document.getElementById("model").focus();
            });
        </script>
    </body>
</html>

