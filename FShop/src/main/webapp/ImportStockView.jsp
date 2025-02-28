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
                            <button class="btn btn-warning" id="editSupplier">Edit Supplier</button>
                        </div>
                        <div class="card-body">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="supplier" class="form-label">Supplier</label>
                                    <input type="text" class="form-control" id="supplier" list="supplierList" required>
                                    <datalist id="supplierList">
                                        <option value="Supplier A">
                                        <option value="Supplier B">
                                        <option value="Supplier C">
                                    </datalist>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Address</label>
                                    <input type="text" class="form-control" id="supplierAddress" readonly>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Email</label>
                                    <input type="text" class="form-control" id="supplierEmail" readonly>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Phone</label>
                                    <input type="text" class="form-control" id="supplierPhone" readonly>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Status</label>
                                    <input type="text" class="form-control" id="supplierStatus" readonly>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product List Table -->
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4 class="mb-0">Product Entry</h4>
                            <button class="btn btn-success" id="addProduct">Submit</button>
                        </div>

                        <table class="table mt-3">
                            <thead>
                                <tr>
                                    <th>Product Name</th>
                                    <th>Product ID</th>
                                    <th>Model</th>
                                    <th>Quantity</th>
                                    <th>Status</th>
                                    <th>Actions</th> <!-- New column for actions -->
                                </tr>
                            </thead>
                            <tbody id="productList">
                                <tr>
                                    <td>name</td>
                                    <td>name</td>
                                    <td>name</td>
                                    <td>(input)</td>
                                    <td>name</td>
                                    <td>+</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- Product Entry Section -->
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4 class="mb-0">Product List</h4>
                            <input type="search" class="form-control" id="addProduct" placeholder="Search..." aria-label="Search" style="width: 20%">
                        </div>

                        <table class="table mt-3">
                            <thead>
                                <tr>
                                    <th>Product Name</th>
                                    <th>Product ID</th>
                                    <th>Model</th>
                                    <th>Stock</th>
                                    <th>Status</th>
                                    <th>Actions</th> <!-- New column for actions -->
                                </tr>
                            </thead>
                            <tbody id="productList">
                            <c:forEach items="${products}" var="p">
                                <tr>
                                    <td>${p.getFullName()}</td>
                                    <td>${p.getProductId()}</td>
                                    <td>name</td>
                                    <td>(input)</td>
                                    <td>name</td>
                                    <td>-</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>


        <script>
            let products = [
            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products != null) {
                    for (int i = 0; i < products.size(); i++) {
                        Product p = products.get(i);
                        out.print("{ id: " + p.getProductId() + ", name: \"" + p.getFullName() + "\" }");
                        if (i < products.size() - 1) {
                            out.print(",");
                        }
                    }
                }
            %>
            ];

            const supplierData = {
                "Supplier A": {address: "123 Street A", email: "a@example.com", phone: "1234567890", status: "Active"},
                "Supplier B": {address: "456 Street B", email: "b@example.com", phone: "789-012", status: "Inactive"},
                "Supplier C": {address: "789 Street C", email: "c@example.com", phone: "345-678", status: "Active"}
            };

            document.getElementById("supplier").addEventListener("input", function () {
                let supplierValue = this.value;
                let data = supplierData[supplierValue] || {address: "", email: "", phone: "", status: ""};
                document.getElementById("supplierAddress").value = data.address;
                document.getElementById("supplierEmail").value = data.email;
                document.getElementById("supplierPhone").value = data.phone;
                document.getElementById("supplierStatus").value = data.status;
            });

            const modelToNameMap = {
                "Model A": "Product Alpha",
                "Model B": "Product Beta",
                "Model C": "Product Gamma"
            };

            document.getElementById("model").addEventListener("input", function () {
                let modelValue = this.value;
                document.getElementById("productName").value = modelToNameMap[modelValue] || "";
            });

            document.getElementById("importOrderForm").addEventListener("submit", function (event) {
                event.preventDefault();
                let supplier = document.getElementById("supplier").value;
                let model = document.getElementById("model").value;
                let productName = document.getElementById("productName").value;
                let quantity = document.getElementById("quantity").value;
                let price = parseFloat(document.getElementById("price").value).toLocaleString("vi-VN");

                let table = document.getElementById("productList");
                let row = table.insertRow();
                row.innerHTML = `
                    <td>${supplier}</td>
                    <td>${model}</td>
                    <td>${productName}</td>
                    <td>${quantity}</td>
                    <td>${price} VND</td>
                    <td>
                        <button class="btn btn-warning btn-sm editBtn"><i class="fas fa-edit"></i> Edit</button>
                        <button class="btn btn-danger btn-sm deleteBtn"><i class="fas fa-trash-alt"></i> Delete</button>
                    </td>
                `;

                this.reset();
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

