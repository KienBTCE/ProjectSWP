<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý Địa Chỉ</title>
    </head>

    <body style="font-family: Arial, sans-serif;">

        <div class="container">
            <div class="header" style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #ddd; padding: 15px 15px 15px 0px;">
                <h2>My addresses</h2>
                <button class="btn btn-add" style="background: red; color: white; padding: 5px 5px; cursor: pointer; border: none;" onclick="openAddModal()">+ Add new address</button>
            </div>

            <h4 style="padding: 15px 0 0 0">Address</h4>

            <div id="addressList">
                <br>
                <div class="address" style="border-bottom: 1px solid #ddd; display: flex; justify-content: space-between; align-items: center;">
                    <div>
                        <strong>Bùi Minh Nhựt</strong> (+84) 349 311 805
                        <p>Nguyễn Văn Trường, Phường Long Tuyền, Quận Bình Thủy, Cần Thơ</p>
                        <span class="default" style="color: red; font-weight: bold;">Default</span>
                    </div>
                    <div class="actions" style="display: flex; flex-direction: column;">
                        <div class="btn1" style="display: flex; flex-direction: row;">
                            <button class="btn btn-update" style="color: blue; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;" onclick="openUpdateModal()">Update</button>
                            <button class="btn btn-delete" style="color: red; background: none; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;">Delete</button>
                        </div>
                        <button class="btn btn-default" style="background: #f5f5f5; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;" onclick="setDefault(this)">Set as default</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Address Modal -->
        <div id="addModal" class="modal" style="display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: hidden; background-color: rgba(0, 0, 0, 0.4); padding-top: 60px;">
            <div class="modal-content" style="background-color: #fff; margin: 5% auto; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); width: 60%; max-width: 600px; height: auto; margin-top: 10px;">
                <span class="close" style="color: #aaa; font-size: 28px; font-weight: bold; float: right; cursor: pointer;" onclick="closeAddModal()">&times;</span>
                <h2 style="text-align: center; font-size: 24px; color: #333;">Add New Address</h2>
                <form style="display: flex; flex-direction: column; gap: 20px; background-color: #f9f9f9; padding: 20px; border-radius: 8px; box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);">
                    <div style="display: flex; flex-wrap: wrap; align-items: center;">
                        <label for="name" style="font-weight: bold; margin-right: 10px; color: #333; width: 120px;">Name:</label>
                        <input type="text" id="name" name="name" style="padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; font-size: 16px; flex: 1;">
                    </div>

                    <div style="display: flex; flex-wrap: wrap; align-items: center;">
                        <label for="phone" style="font-weight: bold; margin-right: 10px; color: #333; width: 120px;">Phone:</label>
                        <input type="text" id="phone" name="phone" style="padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; font-size: 16px; flex: 1;">
                    </div>

                    <div style="display: flex; flex-wrap: wrap; align-items: center;">
                        <label for="street" style="font-weight: bold; margin-right: 10px; color: #333; width: 120px;">Street:</label>
                        <input type="text" id="street" name="street" style="padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; font-size: 16px; flex: 1;">
                    </div>

                    <div style="display: flex; flex-wrap: wrap; align-items: center;">
                        <label for="province" style="font-weight: bold; margin-right: 10px; color: #333; width: 120px;">Province:</label>
                        <select id="province" style="padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; font-size: 16px; flex: 1;">
                            <option value="">Select Province</option>
                        </select>
                    </div>

                    <div style="display: flex; flex-wrap: wrap; align-items: center;">
                        <label for="district" style="font-weight: bold; margin-right: 10px; color: #333; width: 120px;">District:</label>
                        <select id="district" style="padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; font-size: 16px; flex: 1;">
                            <option value="">Select District</option>
                        </select>
                    </div>

                    <div style="display: flex; flex-wrap: wrap; align-items: center;">
                        <label for="ward" style="font-weight: bold; margin-right: 10px; color: #333; width: 120px;">Ward:</label>
                        <select id="ward" style="padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; font-size: 16px; flex: 1;">
                            <option value="">Select Ward</option>
                        </select>
                    </div>

                    <div style="display: flex; justify-content: center;">
                        <button type="submit" style="padding: 12px 20px; background-color: #ff4d4d; border: none; color: white; font-size: 16px; cursor: pointer; border-radius: 4px; width: 100%; max-width: 300px;">Add Address</button>
                    </div>
                </form>
            </div>
        </div>




        <!-- Update Address Modal -->
        <div id="updateModal" class="modal" style="display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: hidden; background-color: rgba(0, 0, 0, 0.4); padding-top: 60px;">
            <div class="modal-content" style="background-color: #fff; margin: 5% auto; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); width: 60%; max-width: 600px; height: auto; margin-top: 10px;">
                <span class="close" style="color: #aaa; font-size: 28px; font-weight: bold; float: right; cursor: pointer;" onclick="closeUpdateModal()">&times;</span>
                <h2 style="text-align: center; font-size: 24px; color: #333;">Add New Address</h2>
                <form style="display: flex; flex-direction: column; gap: 20px; background-color: #f9f9f9; padding: 20px; border-radius: 8px; box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);">
                    <div style="display: flex; flex-wrap: wrap; align-items: center;">
                        <label for="name" style="font-weight: bold; margin-right: 10px; color: #333; width: 120px;">Name:</label>
                        <input type="text" id="name" name="name" style="padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; font-size: 16px; flex: 1;">
                    </div>

                    <div style="display: flex; flex-wrap: wrap; align-items: center;">
                        <label for="phone" style="font-weight: bold; margin-right: 10px; color: #333; width: 120px;">Phone:</label>
                        <input type="text" id="phone" name="phone" style="padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; font-size: 16px; flex: 1;">
                    </div>

                    <div style="display: flex; flex-wrap: wrap; align-items: center;">
                        <label for="street" style="font-weight: bold; margin-right: 10px; color: #333; width: 120px;">Street:</label>
                        <input type="text" id="street" name="street" style="padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; font-size: 16px; flex: 1;">
                    </div>

                    <div style="display: flex; flex-wrap: wrap; align-items: center;">
                        <label for="province" style="font-weight: bold; margin-right: 10px; color: #333; width: 120px;">Province:</label>
                        <select id="province" style="padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; font-size: 16px; flex: 1;">
                            <option value="">Select Province</option>
                        </select>
                    </div>

                    <div style="display: flex; flex-wrap: wrap; align-items: center;">
                        <label for="district" style="font-weight: bold; margin-right: 10px; color: #333; width: 120px;">District:</label>
                        <select id="district" style="padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; font-size: 16px; flex: 1;">
                            <option value="">Select District</option>
                        </select>
                    </div>

                    <div style="display: flex; flex-wrap: wrap; align-items: center;">
                        <label for="ward" style="font-weight: bold; margin-right: 10px; color: #333; width: 120px;">Ward:</label>
                        <select id="ward" style="padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; font-size: 16px; flex: 1;">
                            <option value="">Select Ward</option>
                        </select>
                    </div>

                    <div style="display: flex; justify-content: center;">
                        <button type="submit" style="padding: 12px 20px; background-color: #ff4d4d; border: none; color: white; font-size: 16px; cursor: pointer; border-radius: 4px; width: 100%; max-width: 300px;">Add Address</button>
                    </div>
                </form>
            </div>
        </div>


        <script>

            $(document).ready(function () {
                $('#searchable-combo').select2({
                    placeholder: "Choose products",
                    allowClear: true
                });
            }
            );

            const locationData = {
                "Hà Nội": {
                    "Ba Đình": ["Điện Biên", "Đội Cấn", "Kim Mã"],
                    "Hoàn Kiếm": ["Hàng Bạc", "Hàng Đào", "Hàng Trống"]
                },
                "Hồ Chí Minh": {
                    "Quận 1": ["Bến Nghé", "Bến Thành", "Phạm Ngũ Lão"],
                    "Quận 3": ["Võ Thị Sáu", "Phường 7", "Phường 8"]
                }
            };

            $(document).ready(function () {
                // Kích hoạt Select2
                $('#province, #district, #ward').select2({placeholder: "Chọn một mục", allowClear: true});

                // Nạp danh sách tỉnh
                Object.keys(locationData).forEach(province => {
                    $('#province').append(new Option(province, province));
                });

                // Khi chọn tỉnh
                $('#province').on('change', function () {
                    let selectedProvince = $(this).val();
                    $('#district').empty().append(new Option("Chọn huyện", ""));
                    $('#ward').empty().append(new Option("Chọn xã", ""));

                    if (selectedProvince) {
                        Object.keys(locationData[selectedProvince]).forEach(district => {
                            $('#district').append(new Option(district, district));
                        });
                    }
                });

                // Khi chọn huyện
                $('#district').on('change', function () {
                    let selectedProvince = $('#province').val();
                    let selectedDistrict = $(this).val();
                    $('#ward').empty().append(new Option("Chọn xã", ""));

                    if (selectedProvince && selectedDistrict) {
                        locationData[selectedProvince][selectedDistrict].forEach(ward => {
                            $('#ward').append(new Option(ward, ward));
                        });
                    }
                });
            });
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

            function setDefault(button) {
                document.querySelectorAll('.default').forEach(el => el.remove());
                let span = document.createElement('span');
                span.classList.add('default');
                span.innerText = 'Mặc định';
                span.style.color = 'red';
                span.style.fontWeight = 'bold';
                button.closest('.address').querySelector('div').appendChild(span);
            }
        </script>

    </body>
</html>
