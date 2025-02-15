<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Order History</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }

            .nav nav a:hover{
                text-decoration: none;
            }
            .nav nav{
                border-radius: 5px;
                display: flex;
                padding: 30px;
            }

            .nav a {
                text-decoration: none;
                color: black;
                font-weight: bold;
                padding-right: 20px;
                padding-left: 20px;
            }

            .nav nav a.active {
                color: red;
                border-bottom: 2px solid red;
            }

            .order-list {
                display: none;
            }

            .order-list.active {
                display: block;
            }
        </style>
    </head>
    <body>
        <div class="nav">
            <nav class="nav" style="background: white">
                <a href="#" class="tab-link" onclick="showTab('waiting', this)">Waiting for confirmation</a>
                <a href="#" class="tab-link" onclick="showTab('transport', this)">Transport</a>
                <a href="#" class="tab-link" onclick="showTab('delivery', this)">Waiting for delivery</a>
                <a href="#" class="tab-link" onclick="showTab('delivered', this)">Delivered</a>
                <a href="#" class="tab-link" onclick="showTab('canceled', this)">Canceled</a>
            </nav>
        </div>
        <div style="width: 100%; background: rgba(231, 220, 220, 0);"></div>
        <div id="waiting" class="order-list active"></div>
        <div id="transport" class="order-list">
            <p>Order #5678 - In transport</p>
        </div>
        <div id="delivery" class="order-list">
            <p>Order #91011 - Waiting for delivery</p>
        </div>
        <div id="delivered" class="order-list">
            <p>Order #1213 - Delivered</p>
        </div>
        <div id="canceled" class="order-list">
            <div style="background-color: white; width: 100%; border-radius: 10px;">
                <div style="text-align: right; padding: 15px; border-bottom: 0.5px solid rgb(226, 214, 214); color:rgb(238,84,61); width: 95%; margin: 0 auto">
                    <h5>Canceled</h5>
                </div>
                <br>
                <div class="container-fluid" style="border-bottom: 0.1px rgb(226, 214, 214) solid; width: 95%; margin: 0 auto">
                    <div class="row" style="display: flex; align-items: center;">
                        <div class="col-md-2">
                            <img style="border: 0.5px solid gray;" width="100px" height="auto"
                                 src="./assets/imgs/Laptop/0yp3jx9d-1090-lenovo-legion-pro-5-y9000p-2023-core-i9-13900hx-16gb-1tb-rtx-4050-6gb-16-wqxga-240hz-new.jpg"
                                 alt="">
                        </div>
                        <div class="col-md-8">
                            <div>
                                <a href="orderDetails.jsp" style="text-decoration: none; color: black;"> Laptop</a>
                            </div>
                            <div>
                                Quantity: 1
                            </div>
                        </div>
                        <div class="col-md-2" style="color: rgb(238,84,61); text-align: right;">20.000.000VND</div>
                    </div>
                    <br>
                </div>
                <div style="text-align: right; padding: 10px; margin-top: 10px; width: 95%; margin: 0 auto">Total: <h4 style="color: rgb(238,84,61);">20.000.000VND</h4>
                </div>
            </div>
            <div style="width: 100%; background: rgba(231, 220, 220, 0);">
                <br>
            </div>
        </div>

        <script>
            function showTab(tabId, element) {
                document.querySelectorAll('.tab-link').forEach(tab => tab.classList.remove('active'));
                document.querySelectorAll('.order-list').forEach(order => order.classList.remove('active'));

                element.classList.add('active');
                document.getElementById(tabId).classList.add('active');
            }
        </script>
    </body>
</html>
