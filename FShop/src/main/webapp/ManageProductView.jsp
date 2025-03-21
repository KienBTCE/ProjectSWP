<%-- 
    Document   : manageProduct
    Created on : 23-Feb-2025, 22:36:47
    Author     : kiuth
--%>

<%@page import="DAOs.ProductDAO"%>
<%@page import="Models.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F Shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                display: flex;
            }

            .sidebar {
                width: 250px;
                height: auto;
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
                background-color: lightblue !important;
                border: none;
                padding: 5px 10px;
                width: 140px;
                align-items: center;
                margin-bottom: 10px;
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
                background-color: blue !important;
                color: white !important;
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
                margin-top: 10px;
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
            .filter-row {
                display: flex;
                align-items: center;
                gap: 15px;
                margin-bottom: 5px;
            }

            .filter-container {
                margin-right: 10px;
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 15px;
                margin-top: 10px;
                margin-left: 250px;
                width: 200px;
            }

            .form-select {
                width: 220px;
                padding: 8px;
                border-radius: 10px;
                border: 2px solid #7D69FF;
            }

            .checkbox-container {
                display: flex;
                align-items: center;
                gap: 8px;
                font-size: 14px;
                width: 300px;
            }

            .checkbox-container input {
                width: 18px;
                height: 18px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <jsp:include page="SidebarDashboard.jsp"></jsp:include>
            <div class="content">
            <jsp:include page="HeaderDashboard.jsp"></jsp:include>
                <div class="filter-row">
                    <!-- FORM SEARCH -->
                    <form action="ProductListServlet" method="get" class="search-container">
                        <input type="text" name="txt" value="${param.txt}" placeholder="Search by name..." class="search-input">
                    <button type="submit" class="search-button">🔍</button>
                </form>

                <!-- Checkbox để lọc sản phẩm mới nhập -->
                <form action="ProductListServlet" method="get" class="checkbox-container">
                    <input type="hidden" name="filter" value="new_import"> 
                    <input type="checkbox" id="new_import" name="new_import" value="true" ${param.new_import == 'true' ? 'checked' : ''} onchange="this.form.submit()">
                    <label for="new_import">Newly imported products</label>
                </form>

                <!-- FORM FILTER MỚI NHẬP -->
                <form action="ProductListServlet" method="get" class="filter-container">
                    <select name="categoryId" class="form-select" onchange="this.form.submit()">
                        <option value="">All Categories</option>
                        <c:forEach var="cat" items="${categories}">
                            <option value="${cat.categoryId}" ${param.categoryId == cat.categoryId ? 'selected' : ''}>
                                ${cat.name}
                            </option>
                        </c:forEach>
                    </select>
                </form>

                <a href="CreateProductServlet" class="btn btn-add">Create Product</a>
            </div>
            <script>
                function debugForm() {
                    let category = document.querySelector("select[name='categoryId']").value;
                    console.log("Submitting categoryId: " + category);
                    return true;
                }
            </script>


            <c:if test="${not empty message}">
                <div class="alert alert-info" role="alert">
                    ${message}
                </div>
            </c:if>

            <div class="table-container">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Category</th>
                            <th>Brand</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Stock</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="productTable">
                        <c:forEach items="${products}" var="s">
                            <tr>
                                <td>${s.getProductId()}</td>
                                <td>${s.getCategoryName()}</td>
                                <td>${s.getBrandName()}</td>
                                <td>${s.getFullName()}</td>
                                <td>${s.getPrice()}</td>
                                <td>${s.getQuantity()}</td>
                                <td>
                                    <span class="badge ${s.getDeleted() == 1 ?  'bg-danger':'bg-success'}">
                                        ${s.getStatus()}
                                    </span>
                                </td>
                                <td>
                                    <a href="UpdateProductServlet?id=${s.getProductId()}" class="btn btn-edit" style="">Update</a>
                                    <a href="ProductListServlet?${s.getDeleted() == 1 ? 'restore' : 'delete'}=${s.getProductId()}" 
                                       class="btn btn-delete ${s.getDeleted() == 1 ? 'btn-success' : 'btn-danger'}" 
                                       onclick="return confirm('Are you sure?');">
                                        ${s.getDeleted() == 1 ? 'Activate' : 'Delete'}
                                    </a>
                                    <a href="ProductListServlet?id=${s.getProductId()}" class="btn btn-detail" style="background-color: #BDF3BD">Detail</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <script>
            function filterTable() {
                let input = document.getElementById("searchInput");
                let filter = input.value.toLowerCase();
                let table = document.getElementById("productTable");
                let rows = table.getElementsByTagName("tr");

                for (let i = 0; i < rows.length; i++) {
                    let nameCell = rows[i].getElementsByTagName("td")[1];
                    if (nameCell) {
                        let nameText = nameCell.textContent || nameCell.innerText;
                        rows[i].style.display = nameText.toLowerCase().includes(filter) ? "" : "none";
                    }
                }
            }
        </script>

    </div>
</body>

</html>