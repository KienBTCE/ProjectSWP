<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Details</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f1f1f1;
                display: flex;
            }

            .sidebar {
                width: 250px;
                background: #343a40;
                color: white;
                padding: 20px;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .container {
                flex: 1;
                max-width: 900px;
                background: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                margin: 20px;
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            h2, h3 {
                color: #343a40;
                text-align: center;
            }

            .order-info, .customer-info {
                padding: 20px;
                background: #fafafa;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .order-info div, .customer-info div {
                display: flex;
                justify-content: space-between;
                padding: 10px 0;
            }

            .order-details {
                background: #f9f9f9;
                padding: 15px;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .order-details div {
                display: flex;
                justify-content: space-between;
                padding: 10px;
                background: white;
                margin-bottom: 10px;
                border-radius: 5px;
                border: 1px solid #ddd;
            }

            .status {
                font-weight: bold;
                color: #007bff;
            }

            .dropdown select {
                width: 100%;
                padding: 12px 15px;
                border-radius: 5px;
                border: 1px solid #ddd;
                font-size: 16px;
                transition: all 0.3s ease;
            }

            input[type="submit"] {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                transition: all 0.3s ease;
                margin-top: 10px;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            /* Popup modal */
            .modal {
                display: none;
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.4);
/*                display: flex;*/
                justify-content: center;
                align-items: center;
            }

            .modal-content {
                background-color: white;
                padding: 20px;
                border-radius: 5px;
                text-align: center;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .modal-buttons {
                display: flex;
                justify-content: space-around;
                margin-top: 15px;
            }

            .modal-btn {
                padding: 10px 15px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
            }

            .modal-btn:first-child {
                background-color: red;
                color: white;
            }

            .modal-btn:last-child {
                background-color: gray;
                color: white;
            }
        </style>
    </head>
    <body>

        <div class="sidebar">
            <jsp:include page="leftshopmanager.jsp" />
        </div>

        <div class="container">
            <h2>Order Details</h2>

            <div class="order-info">
                <div><strong>Order ID:</strong> <span>${data.orderID}</span></div>
                <div><strong>Order Date:</strong> <span>${data.orderDate}</span></div>
                <div><strong>Order Status:</strong> 
                    <span class="status">
                        <c:choose>
                            <c:when test="${data.status == 1}">Waiting For Acceptance</c:when>
                            <c:when test="${data.status == 2}">Packaging</c:when>
                            <c:when test="${data.status == 3}">Waiting For Delivery</c:when>
                            <c:when test="${data.status == 4}">Delivered</c:when>
                            <c:otherwise>Cancelled</c:otherwise>
                        </c:choose>
                    </span>
                </div>
                <div><strong>Total Amount:</strong> <span>${data.totalAmount}</span></div>
            </div>

            <h3>Order Items</h3>
            <div class="order-details">
                <div><strong>Product</strong> <strong>Quantity</strong> <strong>Price</strong></div>
                <c:forEach items="${dataDetail}" var="detail">
                    <div>
                        <span>${detail.productName}</span>
                        <span>${detail.quantity}</span>
                        <span>${detail.price}</span>
                    </div>
                </c:forEach>
            </div>

            <h3>Customer Information</h3>
            <div class="customer-info">
                <div><strong>Name:</strong> <span>${data.fullName}</span></div>
                <div><strong>Phone:</strong> <span>${data.phone}</span></div>
                <div><strong>Address:</strong> <span>${data.address}</span></div>
            </div>
             <form action="UpdateOrderServlet" method="POST">
                <input type="hidden" name="orderID" value="${data.orderID}" />
                <div class="dropdown">
                    <select name="update" size="1">
                        <option value="1" <c:if test="${data.status == 1}">selected</c:if>>Waiting For Acceptance</option>
                        <option value="2" <c:if test="${data.status == 2}">selected</c:if>>Packaging</option>
                        <option value="3" <c:if test="${data.status == 3}">selected</c:if>>Waiting For Delivery</option>
                        <option value="4" <c:if test="${data.status == 4}">selected</c:if>>Delivered</option>
                        </select>
                    </div>
                    <input type="submit" value="Update" />
                </form>
            <form id="deleteForm" action="DeleteOrderServlet" method="POST">
                <input type="hidden" name="orderID" value="${data.orderID}" />
                <input type="submit" value="Delete" onclick="return confirmDelete();" />
            </form>
        </div>

        <div id="confirmationModal" class="modal">
            <div class="modal-content">
                <h3>Are you sure you want to delete this order?</h3>
                <div class="modal-buttons">
                    <button id="confirmBtn" class="modal-btn">Yes, Delete</button>
                    <button id="cancelBtn" class="modal-btn">Cancel</button>
                </div>
            </div>
        </div>

        <script>
            function confirmDelete() {
                document.getElementById("confirmationModal").style.display = "flex";
                return false;
            }

            document.getElementById("confirmBtn").onclick = function () {
                document.getElementById("deleteForm").submit();
            };

            document.getElementById("cancelBtn").onclick = function () {
                document.getElementById("confirmationModal").style.display = "none";
            };
        </script>
    </body>
</html>
