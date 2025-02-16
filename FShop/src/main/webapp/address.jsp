<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Shipping Address</title>
        <style>
            .popup {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                z-index: 1000;
                width: 40%;
            }
            .overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                z-index: 999;
            }
        </style>
    </head>

    <body style="font-family: Arial, sans-serif; ">
        <div style="background-color: white; padding: 20px">
            <div class="header"
                 style=" display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #ddd; padding-bottom: 20px">
                <h2>My addresses</h2>
                <button class="btn btn-add"
                        style="background: red; color: white; padding: 5px 5px; cursor: pointer; border: none;"
                        onclick="openAddPopup()">+ Add new address</button>
            </div>

            <h4 style="padding: 15px 0 0 0">Address</h4>

            <div id="addressList">
                <br>
                <div class="address"
                     style="border-bottom: 1px solid #ddd; display: flex; justify-content: space-between; align-items: center;  padding-bottom: 10px">
                    <div>
                        <p>Nguyễn Văn Trường, Phường Long Tuyền, Quận Bình Thủy, Cần Thơ</p>
                        <span class="default" style="color: red; font-weight: bold;">Default</span>
                    </div>
                    <div class="actions" style="display: flex; flex-direction: column;">
                        <div class="btn1" style="display: flex; flex-direction: row;">
                            <button class="btn btn-update"
                                    style="color: blue; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;"
                                    data-bs-toggle="modal" data-bs-target="#updateModal" onclick="openUpdatePopup()">Update</button>
                            <button class="btn btn-delete"
                                    style="color: red; background: none; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;">Delete</button>
                        </div>
                        <button class="btn btn-default"
                                style="background: #f5f5f5; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;"
                                onclick="setDefault(this)">Set as default</button>
                    </div>
                </div>

            </div>
            <div id="addressList">
                <br>
                <div class="address"
                     style="border-bottom: 1px solid #ddd; display: flex; justify-content: space-between; align-items: center; padding-bottom: 10px">
                    <div>
                        <p>Nguyễn Van Linh, Phường Long Tuyền, Quận Bình Thủy, Cần Thơ</p>
                    </div>
                    <div class="actions" style="display: flex; flex-direction: column;">
                        <div class="btn1" style="display: flex; flex-direction: row;">
                            <button class="btn btn-update"
                                    style="color: blue; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;"
                                    data-bs-toggle="modal" data-bs-target="#updateModal"  onclick="openUpdatePopup()">Update</button>
                            <button class="btn btn-delete"
                                    style="color: red; background: none; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;">Delete</button>
                        </div>
                        <button class="btn btn-default"
                                style="background: #f5f5f5; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;"
                                onclick="setDefault(this)">Set as default</button>
                    </div>
                </div>
                <br>
            </div>

            <div class="overlay" id="overlay" onclick=""></div>

            <div class="popup" id="addPopup">
                <div class="">
                    <div class="">
                        <div class="" style="display: flex; ">
                            <h4 class="title" id="popupLabel">Add New Address</h4>
                        </div>
                        <div class="body">
                            <form method="POST" action="addAddress">
                                <div class="mb-3">
                                    <label for="province" class="form-label">Province/City:</label>
                                    <select id="province" name="province" class="form-select" required>
                                        <option value="">Select Province</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="district" class="form-label">District:</label>
                                    <select id="district" name="district" class="form-select" required>
                                        <option value="">Select District</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="ward" class="form-label">Ward/Commune:</label>
                                    <select id="ward" name="ward" class="form-select" required>
                                        <option value="">Select Ward</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Detailed Address:</label>
                                    <input type="text" id="address" name="address" class="form-control" required>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" onclick="closeAddPopup()" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-danger">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>            
            <div class="overlay" id="overlay" onclick=""></div>
            <div class="popup" id="updatePopup">
                <div class="">
                    <div class="">
                        <div class="" style="display: flex; ">
                            <h4 class="title" id="popupLabel">Update Address</h4>
                        </div>
                        <div class="body">
                            <form method="POST" action="addAddress">
                                <div class="mb-3">
                                    <label for="province" class="form-label">Province/City:</label>
                                    <select id="province" name="province" class="form-select" required>
                                        <option value="">Cần Thơ</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="district" class="form-label">District:</label>
                                    <select id="district" name="district" class="form-select" required>
                                        <option value="">Quận Bình Thủy</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="ward" class="form-label">Ward/Commune:</label>
                                    <select id="ward" name="ward" class="form-select" required>
                                        <option value="">Phường Long Tuyền</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Detailed Address:</label>
                                    <input type="text" id="address" name="address" class="form-control" required value="Nguyễn Văn Trường">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" onclick="closeUpdatePopup()" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-danger">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                                        function openAddPopup() {
                                            document.getElementById("addPopup").style.display = "block";
                                            document.getElementById("overlay").style.display = "block";
                                        }

                                        function closeAddPopup() {
                                            document.getElementById("addPopup").style.display = "none";
                                            document.getElementById("overlay").style.display = "none";
                                        }
                                        function openUpdatePopup() {
                                            document.getElementById("updatePopup").style.display = "block";
                                            document.getElementById("overlay").style.display = "block";
                                        }

                                        function closeUpdatePopup() {
                                            document.getElementById("updatePopup").style.display = "none";
                                            document.getElementById("overlay").style.display = "none";
                                        }
            </script>
    </body>

</html>