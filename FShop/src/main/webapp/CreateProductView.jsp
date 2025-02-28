<%-- 
    Document   : CreateProductView
    Created on : 26-Feb-2025, 17:30:55
    Author     : kiuth
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Create Product</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 400px;
            }
            h2 {
                text-align: center;
                color: #333;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            label {
                font-weight: bold;
                margin-top: 10px;
            }
            input, textarea {
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            input[type="submit"] {
                background: #28a745;
                color: white;
                font-size: 16px;
                cursor: pointer;
                margin-top: 15px;
            }
            input[type="submit"]:hover {
                background: #218838;
            }
            .error {
                color: red;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Create New Product</h2>

            <% String error = (String) session.getAttribute("error");
            if (error != null) {%>
            <p class="error"><%= error%></p>
            <% session.removeAttribute("error"); %>
            <% }%>

            <form action="CreateProductServlet" method="post">

                <label>Full Name:</label>
                <input type="text" name="fullName" required>

                <label>Model:</label>
                <input type="text" name="model" required>

                <label>Description:</label>
                <textarea name="description" required></textarea>

                <label>Image URL:</label>
                <input type="text" name="image" required>

                <label>Price:</label>
                <input type="number" name="price" required>

                <label>Stock:</label>
                <input type="number" name="stock" required>

                <input type="submit" value="Create Product">
            </form>
        </div>
    </body>
</html>