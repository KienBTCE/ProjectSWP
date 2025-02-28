<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Details</title>
        <link rel="stylesheet" href="assets/css/orderDetail.css">
    </head>
    <body>
        <jsp:include page="leftshopmanager.jsp" />

        <div class="container">
            <h2>Order Details</h2>
            <div class="flex-container">
                <div class="order-info">
                    <div><strong>Order ID:</strong> <span>${data.orderID}</span></div>
                    <div><strong>Order Date:</strong> <span>${data.orderDate}</span></div>
                    <div><strong>Order Status:</strong> <span>${data.status}</span></div>
                    <div><strong>Total Amount:</strong> <span>${data.totalAmount}</span></div>
                </div>


            </div>

            <h3>Order Items</h3>
            <div class="order-details">
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
        </div>
            
        <div class="actions">
            <h3>Manage Order</h3>
            <form action="UpdateOrderServlet" method="POST">
                <input type="hidden" name="orderID" value="${data.orderID}" />
                <div class="dropdown">
                    <select name="update">
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
                <button id="confirmBtn" class="confirm-btn">Yes, Delete</button>
                <button id="cancelBtn" class="cancel-btn">Cancel</button>
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