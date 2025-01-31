<%-- 
    Document   : address
    Created on : Jan 31, 2025, 3:01:51 PM
    Author     : nhutb
--%>

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
            .btn1{
                display: flex;
                flex-direction: row;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="header">
                <h2>My addresses</h2>
                <button style="background: #D10000;
                        color: white;" class="btn btn-add">+ Add new address</button>
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
                            <button style="color: blue" class="btn btn-update">Update</button>
                            <button style="color: red" class="btn btn-delete">Delete</button>
                        </div>
                        <button style="background: whitesmoke; border: 1px solid black; position: relative; right: 0" class="btn btn-default" onclick="setDefault(this)">Set as default</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
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
