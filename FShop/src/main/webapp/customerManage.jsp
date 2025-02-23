<%-- 
    Document   : viewCustomer
    Created on : 09-Feb-2025, 23:00:12
    Author     : kiuth
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container py-3" style="max-width: 800px;">
    <h3 class="text-center mb-3">Create Product</h3>
    <form id="product-form" class="card p-3 shadow-sm">
        <div class="row mb-2">
            <div class="col-md-6">
                <label class="form-label">Category:</label>
                <select id="category" class="form-select" required>
                    <option value="Phone">Phone</option>
                    <option value="Laptop">Laptop</option>
                    <option value="Accessory">Accessory</option>
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label">Brand:</label>
                <input type="text" id="brand" class="form-control" required>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-md-6">
                <label class="form-label">Name:</label>
                <input type="text" id="name" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label class="form-label">Quantity:</label>
                <input type="number" id="quantity" class="form-control" required>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-md-6">
                <label class="form-label">Price:</label>
                <input type="number" id="price" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label class="form-label">Pictures:</label>
                <input type="file" id="pictures" class="form-control" multiple accept="image/*">
            </div>
        </div>
        <div class="mb-2">
            <label class="form-label">Description:</label>
            <textarea id="description" class="form-control" rows="3" required></textarea>
        </div>
        <div id="image-preview" class="d-flex gap-2"></div>
        <button type="submit" class="btn btn-success mt-2">Submit</button>
    </form>
    
    <script>
        document.getElementById('pictures').addEventListener('change', function(event) {
            const preview = document.getElementById('image-preview');
            preview.innerHTML = '';
            Array.from(event.target.files).forEach(file => {
                const img = document.createElement('img');
                img.classList.add('rounded', 'border', 'p-1');
                img.style.width = '50px';
                img.style.height = '50px';
                img.src = URL.createObjectURL(file);
                preview.appendChild(img);
            });
        });

        document.getElementById('product-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const product = {
                category: document.getElementById('category').value,
                brand: document.getElementById('brand').value,
                name: document.getElementById('name').value,
                quantity: document.getElementById('quantity').value,
                price: document.getElementById('price').value,
                description: document.getElementById('description').value,
                pictures: Array.from(document.getElementById('pictures').files).map(file => file.name)
            };
            console.log('Product Data:', product);
            alert('Product submitted!');
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
