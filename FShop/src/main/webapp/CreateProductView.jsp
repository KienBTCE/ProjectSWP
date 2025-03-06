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
    </head>
    <body>
        <div class="container mt-5">
            <h3 class="text-center">Create Product</h3>

            <c:if test="${param.success == 'true'}">
                <div class="alert alert-success">Product created successfully!</div>
            </c:if>

            <form action="CreateProductServlet" method="POST">
                <div class="mb-3">
                    <label class="form-label">Category</label>
                    <select class="form-control" name="categoryName" required>
                        <c:forEach var="category" items="${categories}">
                            <option value="${category}">${category}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Brand</label>
                    <select class="form-control" name="brandName" required>
                        <c:forEach var="brand" items="${brands}">
                            <option value="${brand}">${brand}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Product Name</label>
                    <input type="text" class="form-control" name="fullName" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Model</label>
                    <input type="text" class="form-control" name="model" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Price</label>
                    <input type="number" class="form-control" name="price" required>
                </div>

                <button type="submit" class="btn btn-primary w-100">Create Product</button>
            </form>
        </div>

    </body>
</html>
