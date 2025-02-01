<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý Địa Chỉ</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid #ddd;
                padding: 15px 15px 15px 0px;
            }

            .address {
                border-bottom: 1px solid #ddd;
                padding: 10px 0;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .default {
                color: red;
                font-weight: bold;
            }

            .btn {
                padding: 5px 5px;
                cursor: pointer;
                border: none;
                margin-left: 5px;
            }

            .btn-default {
                background: #f5f5f5;
            }

            .btn-delete {
                color: red;
                background: none;
            }

            .btn-update {
                background: blue;
                color: white;
            }

            .btn-add {
                background: red;
                color: white;
            }

            .actions {
                display: flex;
                flex-direction: column;
            }

            .actions .btn {
                margin-bottom: 5px;
            }

            .btn1 {
                display: flex;
                flex-direction: row;
            }

            /* Popup Modal Styles */
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0.4);
                padding-top: 60px;
            }

            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }

            .close {
                color: #aaa;
                font-size: 28px;
                font-weight: bold;
                float: right;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="header">
                <h2>My addresses</h2>
                <button class="btn btn-add" onclick="openAddModal()">+ Add new address</button>
            </div>
            <div id="addressList">
                <br>
                <h4>Address</h4>
                <div class="address">
                    <div>
                        <strong>Bùi Minh Nhựt</strong> (+84) 349 311 805
                        <p>Nguyễn Văn Trường, Phường Long Tuyền, Quận Bình Thủy, Cần Thơ</p>
                        <span class="default">Default</span>
                    </div>
                    <div class="actions">
                        <div class="btn1">
                            <button class="btn btn-update" onclick="openUpdateModal()">Update</button>
                            <button class="btn btn-delete">Delete</button>
                        </div>
                        <button class="btn btn-default" onclick="setDefault(this)">Set as default</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Address Modal -->
        <div id="addModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeAddModal()">&times;</span>
                <h2>Add New Address</h2>
                <form>
                    <label for="name">Name:</label><br>
                    <input type="text" id="name" name="name"><br><br>
                    <label for="phone">Phone:</label><br>
                    <input type="text" id="phone" name="phone"><br><br>
                    <label for="address">Address:</label><br>
                    <input type="text" id="address" name="address"><br><br>
                    <button type="submit" class="btn btn-add">Add Address</button>
                </form>
            </div>
        </div>

        <!-- Update Address Modal -->
        <div id="updateModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeUpdateModal()">&times;</span>
                <h2>Update Address</h2>
                <form>
                    <label for="updateName">Name:</label><br>
                    <input type="text" id="updateName" name="updateName"><br><br>
                    <label for="updatePhone">Phone:</label><br>
                    <input type="text" id="updatePhone" name="updatePhone"><br><br>
                    <label for="updateAddress">Address:</label><br>
                    <input type="text" id="updateAddress" name="updateAddress"><br><br>
                    <button type="submit" class="btn btn-update">Update Address</button>
                </form>
            </div>
        </div>

        <script>
            // Open and close modal functions
            function openAddModal() {
                document.getElementById("addModal").style.display = "block";
            }

            function closeAddModal() {
                document.getElementById("addModal").style.display = "none";
            }

            function openUpdateModal() {
                document.getElementById("updateModal").style.display = "block";
            }

            function closeUpdateModal() {
                document.getElementById("updateModal").style.display = "none";
            }

            // Set Default Address
            function setDefault(button) {
                document.querySelectorAll('.default').forEach(el => el.remove());
                let span = document.createElement('span');
                span.classList.add('default');
                span.innerText = 'Mặc định';
                button.closest('.address').querySelector('div').appendChild(span);
            }
        </script>
    </body>

</html>
    