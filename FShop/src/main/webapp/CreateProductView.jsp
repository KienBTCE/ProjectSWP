<%-- 
    Document   : CreateProductView
    Created on : 26-Feb-2025, 17:30:55
    Author     : kiuth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #f8f9fa;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            width: 50%;
        }
        .btn-submit {
            background-color: #7D69FF;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            width: 100%;
        }
        .btn-submit:hover {
            background-color: #5a4edc;
        }
    </style>
</head>
<body>

<div class="container">
    <h3 class="text-center">Create Product</h3>
    <form action="CreateProductServlet" method="POST">
        <div class="mb-3">
            <label class="form-label">Category ID</label>
            <input type="number" class="form-control" name="categoryId" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Brand ID</label>
            <input type="number" class="form-control" name="brandId" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Model</label>
            <input type="text" class="form-control" name="model" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Product Name</label>
            <input type="text" class="form-control" name="fullName" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea class="form-control" name="description" required></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Price</label>
            <input type="number" class="form-control" name="price" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Image URL</label>
            <input type="text" class="form-control" name="image">
        </div>
        <div class="mb-3">
            <label class="form-label">Quantity</label>
            <input type="number" class="form-control" name="quantity" required>
        </div>
        <button type="submit" class="btn-submit">Create Product</button>
    </form>
</div>

</body>
</html>

