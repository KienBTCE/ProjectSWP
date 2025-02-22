<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                        onclick="openPopup(false)">+ Add address</button>
            </div>

            <h4 style="padding: 15px 0 0 0">Address</h4>

            <div id="addressList">
                <br>
                <div class="address"
                     style="border-bottom: 1px solid #ddd; display: flex; justify-content: space-between; align-items: center;  padding-bottom: 10px">
                    <div>
                        <p>Nguyen Van Truong street, Long Tuyen ward, Binh Thuy district, Can Tho province</p>
                        <span class="default" style="color: red; font-weight: bold;">Default</span>
                    </div>
                    <div class="actions" style="display: flex; flex-direction: column;">
                        <div class="btn1" style="display: flex; flex-direction: row;">
                            <button class="btn btn-update"
                                    style="color: blue; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;"
                                    data-bs-toggle="modal" data-bs-target="#updateModal"
                                    onclick="openPopup(true)">Update</button>
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
                        <p>Nguyen Van Linh street, Long Tuyen ward, Binh Thuy district, Can Tho province</p>
                    </div>
                    <div class="actions" style="display: flex; flex-direction: column;">
                        <div class="btn1" style="display: flex; flex-direction: row;">
                            <button class="btn btn-update"
                                    style="color: blue; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;"
                                    data-bs-toggle="modal" data-bs-target="#updateModal"
                                    onclick="openPopup(true, {province: 'Soc Trang Province', district: 'My Tu District', commune: 'My Tu Commune', address: '123 Street'});">Update</button>
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
                <div class="" style="display: flex; ">
                    <h4 class="title" id="popupLabel">Add Address</h4>
                </div>
                <form method="POST" action="addAddress">
                    <div class="mb-3">
                        <label for="city" class="form-label">Province</label>
                        <select class="form-select form-select-sm mb-3" id="city" aria-label=".form-select-sm">
                            <option value="" selected>Select Province</option>           
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="district" class="form-label">District</label>
                        <select class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm">
                            <option value="" selected>Select District</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="ward" class="form-label">Ward</label>
                        <select class="form-select form-select-sm" id="ward" aria-label=".form-select-sm">
                            <option value="" selected>Select Ward</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Detailed Address:</label>
                        <input type="text" id="addressInput" name="address" class="form-control" required
                               value="Nguyễn Văn Trường">
                    </div>
                    <div class="mb-3 form-check form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                        <label class="form-check-label" for="flexSwitchCheckDefault">Set as default</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="closeAddPopup()"
                                data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-danger">Save</button>
                    </div>
                </form>
            </div>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
            <script>

                            var allData = []; // Lưu trữ toàn bộ dữ liệu tỉnh/thành
                            var citis = document.getElementById("city");
                            var districts = document.getElementById("district");
                            var wards = document.getElementById("ward");

                            var Parameter = {
                                url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                                method: "GET",
                                responseType: "application/json",
                            };
                            axios(Parameter).then(function (result) {
                                allData = result.data;
                                renderCity(allData);
                            });

                            citis.onchange = function () {
                                loadDistricts(this.value);
                            };
                            districts.onchange = function () {
                                loadWards(this.value);
                            };

                            function renderCity(data) {
                                for (const x of data) {
                                    let translatedName = translateLocation(x.Name);
                                    citis.options[citis.options.length] = new Option(translatedName, x.Id);
                                }
                            }

                            function loadDistricts(cityId) {
                                districts.length = 1;
                                wards.length = 1;
                                if (cityId !== "") {
                                    let result = allData.find(n => n.Id === cityId);
                                    for (const k of result.Districts) {
                                        let translatedName = translateLocation(k.Name);
                                        districts.options[districts.options.length] = new Option(translatedName, k.Id);
                                    }
                                }
                            }

                            function loadWards(districtId) {
                                wards.length = 1;
                                let cityData = allData.find(n => n.Id === citis.value);
                                if (cityData && districtId !== "") {
                                    let districtData = cityData.Districts.find(n => n.Id === districtId);
                                    for (const w of districtData.Wards) {
                                        let translatedName = translateLocation(w.Name);
                                        wards.options[wards.options.length] = new Option(translatedName, w.Id);
                                    }
                                }
                            }
                            function translateLocation(name) {
                                let temp = name;

                                if (temp.includes("Thành phố "))
                                    temp = temp.replace("Thành phố ", "") + " City";
                                if (temp.includes("Tỉnh "))
                                    temp = temp.replace("Tỉnh ", "") + " Province";
                                if (temp.includes("Huyện "))
                                    temp = temp.replace("Huyện ", "") + " District";
                                if (temp.includes("Quận "))
                                    temp = temp.replace("Quận ", "") + " District";
                                if (temp.includes("Thị xã "))
                                    temp = temp.replace("Thị xã ", "") + " Town";
                                if (temp.includes("Thị trấn "))
                                    temp = temp.replace("Thị trấn ", "") + " Town";
                                if (temp.includes("Phường "))
                                    temp = temp.replace("Phường ", "") + " Ward";
                                if (temp.includes("Xã "))
                                    temp = temp.replace("Xã ", "") + " Commune";

                                return removeDiacritics(temp); // Xóa dấu tiếng Việt
                            }

                            function removeDiacritics(str) {
                                return str.normalize("NFD").replace(/[\u0300-\u036f]/g, ""); // Loại bỏ dấu tiếng Việt
                            }
                            function openPopup(isUpdate, data = null) {
                                document.getElementById("addPopup").style.display = "block";
                                document.getElementById("overlay").style.display = "block";

                                if (isUpdate && data) {
                                    document.getElementById("popupLabel").innerHTML = "Update Address";
                                    document.getElementById("addressInput").value = data.address || "";

                                    // Chọn tỉnh/thành phố trước, rồi kích hoạt sự kiện change
                                    setSelectValue("city", data.province, function () {
                                        document.getElementById("city").dispatchEvent(new Event("change"));

                                        // Chờ quận/huyện load xong rồi chọn
                                        setTimeout(() => {
                                            setSelectValue("district", data.district, function () {
                                                document.getElementById("district").dispatchEvent(new Event("change"));

                                                // Chờ xã/phường load xong rồi chọn
                                                setTimeout(() => {
                                                    setSelectValue("ward", data.commune);
                                                }, 200);
                                            });
                                        }, 200);
                                    });
                                } else {
                                    document.getElementById("popupLabel").innerHTML = "Add Address";
                                    document.getElementById("addressInput").value = "";
                                    document.getElementById("city").selectedIndex = 0;
                                    document.getElementById("district").length = 1;
                                    document.getElementById("ward").length = 1;
                            }
                            }

                            function setSelectValue(selectId, value, callback = null) {
                                let select = document.getElementById(selectId);
                                let found = false;

                                for (let i = 0; i < select.options.length; i++) {
                                    if (select.options[i].text === value) {
                                        select.selectedIndex = i;
                                        found = true;
                                        break;
                                    }
                                }

                                if (!found) {
                                    select.selectedIndex = 0;
                                }

                                if (callback) {
                                    callback();
                            }
                            }


                            function closeAddPopup() {
                                document.getElementById("addPopup").style.display = "none";
                                document.getElementById("overlay").style.display = "none";
                                let selects = document.querySelectorAll("#addPopup select");
                                selects.forEach(select => {
                                    select.selectedIndex = 0;
                                });
                            }

            </script>
    </body>

</html>