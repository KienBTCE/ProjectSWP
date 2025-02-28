<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Product Detail</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6">
                    <img src="${product.getImage}" class="img-fluid" alt="Product Image">
                </div>
                <div class="col-md-6">
                    <h2>${product.fullName}</h2>
                    <p><strong>Brand:</strong> ${product.getBrandName} (${product.getbrandId})</p>
                    <p><strong>Category:</strong> ${product.getcategoryName} (${product.getcategoryId})</p>
                    <p><strong>Model:</strong> ${product.getmodel}</p>
                    <p><strong>Price:</strong> $${String.format("%.02f", product.getprice)}</p>
                    <p><strong>Stock:</strong> ${product.getstock} available</p>
                    <p><strong>Description:</strong> ${product.getdescription}</p>
                    <form action="addCart?pid=${product.getproductId}" method="post">
                        <label for="quantity">Quantity:</label>
                        <input type="number" name="quantity" value="1" min="1" class="form-control w-25">
                        <button type="submit" class="btn btn-primary mt-2">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>