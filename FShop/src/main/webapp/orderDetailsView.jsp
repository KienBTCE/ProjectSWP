
<%-- 
    Document   : orderDetails
    Created on : Feb 15, 2025, 8:29:20 PM
    Author     : nhutb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- >>>>>>> main -->
        <title>Order Details</title>
        <style>
            body {
                font-family: Arial, sans-serif;
//<<<<<<< tu
/*                 margin: 0;
                padding: 0;
                background-color: #f1f1f1;
                display: flex;
                justify-content: flex-start;
            }

            /* Sidebar */
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

            /* Main content container */
            .container {
                flex: 1;
                max-width: 900px;
                background: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                margin: 20px;
                overflow: hidden;
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            h2, h3 {
                color: #343a40;
                text-align: center;
                margin-bottom: 20px;
            }

            /* Order info section */
            .order-info, .customer-info {
                margin-bottom: 20px;
                padding: 20px;
                border-bottom: 1px solid #ddd;
                background: #fafafa;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .order-info div, .customer-info div {
                display: flex;
                justify-content: space-between;
                padding: 10px 0;
            }

            /* Order details */
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

            /* Status styling */
            .status {
                font-weight: bold;
                color: #007bff;
            }

            /* Custom dropdown */
            .dropdown {
                position: relative;
                width: 100%;
            }

            .dropdown select {
                width: 100%;
                padding: 12px 15px;
                background-color: #f8f9fa;
                border-radius: 5px;
                border: 1px solid #ddd;
                font-size: 16px;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .dropdown select:hover,
            .dropdown select:focus {
                border-color: #007bff;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            }

            /* Button */
            input[type="submit"] {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            /* Modal */
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
            }

            .modal-content {
                background-color: #fff;
                padding: 30px;
                border-radius: 10px;
                text-align: center;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                width: 400px;
                max-width: 90%;
            }

            .modal-content h3 {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .modal-buttons {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            .modal-btn {
                padding: 10px 20px;
                font-size: 16px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .modal-btn:hover {
                background-color: #0056b3;
            }

            /* Responsiveness */
            @media (max-width: 768px) {
                .container {
                    padding: 20px;
                }

                .order-details div {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .dropdown select {
                    font-size: 14px;
                }
            }
        </style>
    </head>
    <body>

        <!-- Sidebar -->
        <div class="sidebar">
            <jsp:include page="leftshopmanager.jsp" />
        </div>

        <!-- Main content container -->
        <div class="container">
            <h2>Order Details</h2>

            <!-- Order Information Section -->
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

            <!-- Order Items Section -->
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

            <!-- Customer Information Section -->
            <h3>Customer Information</h3>
            <div class="customer-info">
                <div><strong>Name:</strong> <span>${data.fullName}</span></div>
                <div><strong>Phone:</strong> <span>${data.phone}</span></div>
                <div><strong>Address:</strong> <span>${data.address}</span></div>
            </div>

            <!-- Update Status Form -->
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

                <!-- Delete Order Form -->
                <form  id="deleteForm" action="DeleteOrderServlet" method="POST" onsubmit="return confirmDelete();">
                    <input type="hidden" name="orderID" value="${data.orderID}" />
                <input type="submit" value="Delete" />
            </form>


        </div>

        <!-- Custom Confirmation Modal -->
        <div id="confirmationModal" class="modal">
            <div class="modal-content">
                <h3>Are you sure you want to delete this order?</h3>
                <div class="modal-buttons">
                    <button id="confirmBtn" class="modal-btn">Yes, Delete</button>
                    <button id="cancelBtn" class="modal-btn">Cancel</button>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function confirmDelete() {
                // Show custom modal
                document.getElementById("confirmationModal").style.display = "flex";
                // Prevent form submission until confirmation
                return false;
            }

            // If user clicks 'Yes', submit the form
            document.getElementById("confirmBtn").onclick = function () {
                document.querySelector("deleteForm").submit();
            };

            // If user clicks 'Cancel', hide the modal
            document.getElementById("cancelBtn").onclick = function () {
                document.getElementById("confirmationModal").style.display = "none";
            };
        </script>
    </body>
</html>  */
=======
                margin: 20px;
            }

            .progress-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                max-width: 800px;
                margin: auto;
                position: relative;
                padding-bottom: 20px;
            }

            .progress-bar {
                position: absolute;
                top: 25px;
                left: 0;
                width: 100%;
                height: 5px;
                background: gray;
                z-index: -1;
            }

            .progress-bar .progress {
                height: 100%;
                width: 100%;
                background: green;
                transition: width 0.3s ease;
            }

            .progress-step {
                display: flex;
                flex-direction: column;
                align-items: center;
                flex: 1;
            }

            .progress-step .circle {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 20px;
                font-weight: bold;
                color: white;
                background-color: gray;
                transition: background-color 0.3s ease;
            }

            .progress-step.active .circle {
                background-color: green;
            }

            .progress-step .label {
                margin-top: 10px;
                font-size: 10px;
            }
        </style>
    </head>

    <body>

        <div class="container" style="background: white; padding: 20px ">
            <div class="row">
                <div class="col-md-4">
                    <h2>Order Details</h2>
                </div>
                <div class="col-md-8">
                    <div class="progress-container">
                        <div class="progress-bar">
                            <div class="progress"></div>
                        </div>
                        <div class="progress-step active">
                            <div class="circle">1</div>
                            <div class="label">Waiting for acceptance</div>
                        </div>
                        <div class="progress-step">
                            <div class="circle">2</div>
                            <div class="label">Packaging</div>
                        </div>
                        <div class="progress-step">
                            <div class="circle">3</div>
                            <div class="label">Waiting for delivery</div>
                        </div>
                        <div class="progress-step">
                            <div class="circle">4</div>
                            <div class="label">Delivering</div>
                        </div>
                        <div class="progress-step">
                            <div class="circle">5</div>
                            <div class="label">Success</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <p><b>OrderID: 1234</b></p>
                </div>
                <div class="col-md-6">
                    <p class="success text-end" style="color: red;"><b>Success</b></p>
                </div>
            </div>
            <div class="row">
                <p><b>Order Item</b></p>
                <div class="col-md-8">
                    <table style="width: 100%; border-collapse: collapse; ">
                        <tr style="height: 60px;">
                            <th class="th" style="width: 17%;">Item</th>
                            <th class="th" style="width: 37%;"></th>
                            <th class="th" style="width: 13%;">Price</th>
                            <th class="th" style="width: 15%;">Qty</th>
                            <th class="th" style="width: 13%;">Subtotal</th>

                        </tr>
                        <tr>
                            <td class="td"><img src="./assets/imgs/Products/250-7038-macbook-pro-2021-apple-m1-1_1.jpg" alt="" width="105px"></td>
                            <td class="th" style="padding: 10px;">MSI MEG Trident X 10SD-1012AU Intel i7 10700K, 2070
                                SUPER, 32GB RAM,
                                1TB SSD, Windows 10
                                Home, Gaming Keyboard and Mouse 3 Years Warranty</td>
                            <td class="th">
                                <h6>$4,349.00</h6>
                            </td>
                            <td class="th">x1</td>
                            <td class="th">
                                <h6>$13,047.00</h6>
                            </td>

                        </tr>
                    </table>
                </div>
                <div class="col-md-4" style="border-radius: 5px; border: solid 1px black;">
                    <p><b>Shipping Address</b></p>
                </div>
            </div>
        </div>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>

        <script>
            let currentStep = 1; // Thay đổi bước hiện tại theo trạng thái đơn hàng
            const steps = document.querySelectorAll(".progress-step");
            const progress = document.querySelector(".progress");

            function updateProgress(step) {
                step = Math.max(0, Math.min(step, steps.length - 1));

                steps.forEach((stepElement, index) => {
                    stepElement.classList.toggle("active", index <= step);
                });

                // Chia đều khoảng cách giữa các bước (20%, 40%, 60%, 80%, 100%)
                const progressWidth = ((step + 1) / steps.length) * 100;
                progress.style.width = `${progressWidth}%`;
            }

            updateProgress(currentStep);

        </script>
    </body>

</html>

