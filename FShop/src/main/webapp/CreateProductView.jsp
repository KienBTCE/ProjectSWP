<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Product</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-4">
            <h3>Create New Product</h3>

            <form action="CreateProductServlet" method="post">

                <!-- Category Selection -->
                <div class="mb-3">
                    <label class="form-label">Category</label>
                    <select class="form-select" name="categoryName" id="categoryName" required>
                        <c:forEach var="category" items="${categories}">
                            <option value="CreateProductServlet?name=${category}" ${category == categoryName ? 'selected' : ''}>${category}</option>
                        </c:forEach>
                    </select>
                </div>
                <!-- Brand -->
                <div class="mb-3">
                    <label class="form-label">Brand</label>
                    <select class="form-select" name="brandName" required>
                        <c:forEach var="brand" items="${brands}">
                            <option value="${brand}">${brand}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Model</label>
                    <input type="text" class="form-control" name="model" required />
                </div>

                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text" class="form-control" name="fullName" required />
                </div>

                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <textarea class="form-control" name="description" rows="3" required></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">Price</label>
                    <input type="number" class="form-control" name="price" required />
                </div>

                <div class="mb-3">
                    <label class="form-label">Attributes</label>
                    <c:if test="${not empty attributes}">
                        <div class="border p-3 rounded">
                            <c:forEach var="attr" items="${attributes}">
                                <div class="mb-2 row align-items-center">
                                    <div class="col-sm-4">
                                        <label class="form-label fw-bold">${attr.attributeName}</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="attributeInfor_${attr.attributeId}" 
                                               placeholder="Enter ${attr.attributeName}" required />
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                    <c:if test="${empty attributes}">
                        <p class="text-danger">No attributes available for the selected category.</p>
                    </c:if>
                </div>

                <!-- Image Uploads -->
                <div class="mb-3">
                    <label class="form-label">Upload Images</label>
                    <div class="row">
                        <!-- Image 1 -->
                        <div class="mb-3">
                            <label class="form-label">Image 1</label>
                            <input type="file" class="form-control" name="txtP1" accept="image/*" required />
                        </div>

                        <!-- Image 2 -->
                        <div class="mb-3">
                            <label class="form-label">Image 2</label>
                            <input type="file" class="form-control" name="txtP2" accept="image/*" />
                        </div>

                        <!-- Image 3 -->
                        <div class="mb-3">
                            <label class="form-label">Image 3</label>
                            <input type="file" class="form-control" name="txtP3" accept="image/*" />
                        </div>

                        <!-- Image 4 -->
                        <div class="mb-3">
                            <label class="form-label">Image 4</label>
                            <input type="file" class="form-control" name="txtP4" accept="image/*" />
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Is Deleted</label>
                        <select class="form-select" name="isDeleted">
                            <option value="0">No</option>
                            <option value="1">Yes</option>
                        </select>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Create Product</button>
            </form>
        </div>   
    </body>
    <script>
        document.getElementById("categoryName").addEventListener("change", function () {
            let url = this.value;
            if (url) {
                window.location.href = url; 
            }
        });
    </script>
</html>
