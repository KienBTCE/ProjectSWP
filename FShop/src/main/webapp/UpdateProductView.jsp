<%-- 
    Document   : UpdateProductView
    Created on : 25-Feb-2025, 10:49:02
    Author     : kiuth
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Product</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container mt-4">
            <c:choose>
                <c:when test="${product != null}">
                    <form action="UpdateProductServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${product.productId}" />
                        <input type="hidden" name="currentImage" value="${product.image}" />

                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control" name="fullName" value="${product.fullName}" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea class="form-control" name="description" required>${product.description}</textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Price</label>
                            <input type="number" class="form-control" name="price" value="${product.price}" required>
                        </div>

                        <div class="mb-3">
                            <label for="txtPPic" class="form-label">Current image:</label>
                            <c:if test="${not empty product.image}">
                                <c:set var="imagePath" value="${product.image}" />
                                <img src="<c:out value='${pageContext.request.contextPath}'/>/assets/imgs/Products/<c:out value='${imagePath}'/>" 
                                     class="product-image" 
                                     alt="${product.fullName}" 
                                     width="150" height="150"/>
                                <br/>
                            </c:if>
                            <c:if test="${empty product.image}">
                                <p>No image uploaded.</p>
                            </c:if>
                            <input type="file" class="form-control" name="txtPPic" accept="image/*" onchange="previewImage(event)"/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Is Deleted</label>
                            <select class="form-control" name="isDeleted">
                                <option value="0" ${product.deleted == 0 ? 'selected' : ''}>No</option>
                                <option value="1" ${product.deleted == 1 ? 'selected' : ''}>Yes</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary">Update Product</button>
                        <a href="ProductListServlet" class="btn btn-secondary">Cancel</a>
                    </form>

                </c:when>
                <c:otherwise>
                    <p class="text-danger">Product not found.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
