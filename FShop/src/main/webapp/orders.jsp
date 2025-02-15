<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Order Management</title>
    </head>
    <body style="font-family: Arial, sans-serif; margin: 20px;">
        <nav style="display: flex; border-bottom: 2px solid #ddd; padding-bottom: 10px;">
            <a href="orderHistory?status=waiting" class="tab-link active" data-tab="waiting" style="margin-right: 20px; text-decoration: none; color: black; font-weight: bold; padding: 10px; border-bottom: 2px solid red;">Waiting for acceptance</a>
            <a href="#" class="tab-link" data-tab="transport" style="margin-right: 20px; text-decoration: none; color: black; font-weight: bold; padding: 10px;">Transport</a>
            <a href="#" class="tab-link" data-tab="delivery" style="margin-right: 20px; text-decoration: none; color: black; font-weight: bold; padding: 10px;">Waiting for delivery</a>
            <a href="#" class="tab-link" data-tab="delivered" style="margin-right: 20px; text-decoration: none; color: black; font-weight: bold; padding: 10px;">Delivered</a>
            <a href="#" class="tab-link" data-tab="canceled" style="margin-right: 20px; text-decoration: none; color: black; font-weight: bold; padding: 10px;">Canceled</a>
        </nav>
        <main>
            <div id="waiting" class="order-list active">
                <div style="text-align: right; padding: 15px; border-bottom: 0.5px solid gray; color:rgb(238,84,61) ;">
                    <h5>Canceled</h5>
                </div>
                <br>
                <div class="container-fluid" style="border-bottom: 0.5px solid gray;">
                    <div class="row" style="display: flex; align-items: center;">
                        <div class="col-md-2">
                            <img style="border: 0.5px solid gray;" width="100px" height="auto"
                                 src="./assets/imgs/Laptop/0yp3jx9d-1090-lenovo-legion-pro-5-y9000p-2023-core-i9-13900hx-16gb-1tb-rtx-4050-6gb-16-wqxga-240hz-new.jpg"
                                 alt="">
                        </div>
                        <div class="col-md-8">
                            <div>
                                Laptop
                            </div>
                            <div>
                                Quantity: 1
                            </div>
                        </div>
                        <div class="col-md-2" style="color: rgb(238,84,61); text-align: right;">20.000.000?</div>
                    </div>
                    <br>
                </div>
                <div style="text-align: right; padding: 10px; margin-top: 10px;">Total: <h4 style="color: rgb(238,84,61);">20.000.000?</h4>
                </div>
            </div>
            <div id="transport" class="order-list" style="display: none; margin-top: 20px; border: 1px solid #ddd; padding: 15px; border-radius: 5px;">
                <p>Order #5678 - In transport</p>
            </div>
            <div id="delivery" class="order-list" style="display: none; margin-top: 20px; border: 1px solid #ddd; padding: 15px; border-radius: 5px;">
                <p>Order #91011 - Waiting for delivery</p>
            </div>
            <div id="delivered" class="order-list" style="display: none; margin-top: 20px; border: 1px solid #ddd; padding: 15px; border-radius: 5px;">
                <p>Order #1213 - Delivered</p>
            </div>
            <div id="canceled" class="order-list" style="display: none; margin-top: 20px; border: 1px solid #ddd; padding: 15px; border-radius: 5px;">
                <p>Order #1415 - Canceled</p>
            </div>
        </main>

        <script>
            document.querySelectorAll('.tab-link').forEach(link => {
                link.addEventListener('click', function (e) {
                    e.preventDefault();
                    document.querySelectorAll('.tab-link').forEach(tab => tab.style.borderBottom = 'none');
                    document.querySelectorAll('.order-list').forEach(order => order.style.display = 'none');

                    this.style.borderBottom = '2px solid red';
                    document.getElementById(this.dataset.tab).style.display = 'block';
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </body>
</html>
