<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <div id="waiting" class="order-list active" style="display: block; margin-top: 20px; border: 1px solid #ddd; padding: 15px; border-radius: 5px;">
                <p>Order #1234 - Waiting for acceptance</p>
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
    </body>
</html>
