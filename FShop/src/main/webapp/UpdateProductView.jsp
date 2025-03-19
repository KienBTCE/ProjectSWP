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
        <style>
            .product-image {
                max-width: 80px;
            }
            .content {
                flex-grow: 1;
                padding: 12px;
                display: flex;
                flex-direction: column;
                gap: 20px;
                margin-left: 130px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="SidebarDashboard.jsp"></jsp:include>
            <div class="content">
            <jsp:include page="HeaderDashboard.jsp"></jsp:include>
            <c:choose>
                <c:when test="${product != null}">
                    <div class="content">
                        <h3 class="mb-4">Update Product</h3>
                        <form action="UpdateProductServlet" method="post" enctype="multipart/form-data">
                            <!-- Hidden Fields -->
                            <input type="hidden" name="id" value="${product.productId}" />
                            <input type="hidden" name="currentImage" value="${product.image}" />

                            <!-- Category (Read-only) -->
                            <div class="mb-3">
                                <label class="form-label">Category</label>
                                <select class="form-select" disabled>
                                    <c:forEach var="cat" items="${categories}">
                                        <option value="${cat}" ${cat == product.categoryName ? 'selected' : ''}>${cat}</option>
                                    </c:forEach>
                                </select>
                                <!-- Hidden input ?? g?i giá tr? category -->
                                <input type="hidden" name="categoryName" value="${product.categoryName}" />
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Brand</label>
                                <select class="form-select" name="brandName">
                                    <c:forEach var="brand" items="${brands}">
                                        <option value="${brand}" ${brand == product.brandName ? 'selected' : ''}>${brand}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <!-- Full Name -->
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" class="form-control" name="fullName" value="${product.fullName}" required />
                            </div>

                            <!-- Description -->
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <textarea class="form-control" name="description" rows="3" required>${product.description}</textarea>
                            </div>

                            <!-- Price -->
                            <div class="mb-3">
                                <label class="form-label">Price</label>
                                <input type="number" class="form-control" name="price" value="${product.price}" required />
                            </div>

                            <!-- Attributes -->
                            <div class="mb-3">
                                <label class="form-label">Attributes</label>
                                <c:if test="${not empty product.attributeDetails}">
                                    <div class="border p-3 rounded">
                                        <c:forEach var="attr" items="${product.attributeDetails}">
                                            <div class="mb-2 row align-items-center">
                                                <div class="col-sm-4">
                                                    <label class="form-label fw-bold">${attr.attributeName}</label>
                                                    <!-- Hidden field cho attributeId -->
                                                    <input type="hidden" name="attributeId" value="${attr.attributeId}" />
                                                </div>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" name="attributeInfor_${attr.attributeId}" 
                                                           value="${attr.attributeInfor}" placeholder="Enter ${attr.attributeName}" />
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:if>
                                <c:if test="${empty product.attributeDetails}">
                                    <p class="text-danger">No attributes available for selected category.</p>
                                </c:if>
                            </div>

                            <!-- Images Upload (Hi?n th? 4 ?nh) -->
                            <div class="mb-3">
                                <label class="form-label">Current Images</label>
                                <div class="row">
                                    <!-- anh 1 -->
                                    <div class="mb-3">
                                        <label class="form-label">Current Image</label>
                                        <c:if test="${not empty product.image}">
                                            <div class="mb-2">
                                                <img src="${pageContext.request.contextPath}/assets/imgs/Products/${product.image}" 
                                                     class="product-image img-thumbnail" alt="${product.fullName}">
                                            </div>
                                        </c:if>
                                        <c:if test="${empty product.image}">
                                            <p>No image uploaded.</p>
                                        </c:if>
                                        <input type="file" class="form-control" name="txtPPic" accept="image/*"/>
                                    </div>
                                    <!--anh 2-->
                                    <div class="mb-3">
                                        <label class="form-label">Current Image</label>
                                        <c:if test="${not empty product.image1}">
                                            <div class="mb-2">
                                                <img src="${pageContext.request.contextPath}/assets/imgs/Products/${product.image1}" 
                                                     class="product-image img-thumbnail" alt="${product.fullName}">
                                            </div>
                                        </c:if>
                                        <c:if test="${empty product.image1}">
                                            <p>No image uploaded.</p>
                                        </c:if>
                                        <input type="file" class="form-control" name="txtPPic1" accept="image/*"/>
                                    </div>
                                    <!--anh 3-->
                                    <div class="mb-3">
                                        <label class="form-label">Current Image</label>
                                        <c:if test="${not empty product.image2}">
                                            <div class="mb-2">
                                                <img src="${pageContext.request.contextPath}/assets/imgs/Products/${product.image2}" 
                                                     class="product-image img-thumbnail" alt="${product.fullName}">
                                            </div>
                                        </c:if>
                                        <c:if test="${empty product.image2}">
                                            <p>No image uploaded.</p>
                                        </c:if>
                                        <input type="file" class="form-control" name="txtPPic2" accept="image/*"/>
                                    </div>
                                    <!-- anh 4 -->
                                    <div class="mb-3">
                                        <label class="form-label">Current Image</label>
                                        <c:if test="${not empty product.image3}">
                                            <div class="mb-2">
                                                <img src="${pageContext.request.contextPath}/assets/imgs/Products/${product.image3}" 
                                                     class="product-image img-thumbnail" alt="${product.fullName}">
                                            </div>
                                        </c:if>
                                        <c:if test="${empty product.image3}">
                                            <p>No image uploaded.</p>
                                        </c:if>
                                        <input type="file" class="form-control" name="txtPPic3" accept="image/*"/>
                                    </div>
                                </div>
                            </div>

                            <!-- Is Deleted -->
                            <div class="mb-3">
                                <label class="form-label">Is Deleted</label>
                                <select class="form-select" name="isDeleted">
                                    <option value="0" ${product.deleted == 0 ? 'selected' : ''}>No</option>
                                    <option value="1" ${product.deleted == 1 ? 'selected' : ''}>Yes</option>
                                </select>
                            </div>

                            <!-- Submit Buttons -->
                            <div class="d-flex gap-3">
                                <button type="submit" class="btn btn-primary">Update Product</button>
                                <a href="ProductListServlet" class="btn btn-secondary">Cancel</a>
                            </div>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <p class="text-danger">Product not found.</p>
                    </c:otherwise>
                </c:choose>
            </div>
    </body>
</html>
