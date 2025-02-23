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
        <title>Order Details</title>
        <style>
            body {
                font-family: Arial, sans-serif;
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