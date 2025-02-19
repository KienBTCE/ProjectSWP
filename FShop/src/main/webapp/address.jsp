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
                        onclick="openAddPopup()">+ Add address</button>
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
                                    onclick="openUpdatePopup()">Update</button>
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
                                    onclick="openUpdatePopup()">Update</button>
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
                        <select id="city" class="form-select">
                            <option value="" selected>Select Province</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="district" class="form-label">District</label>
                        <select id="district" class="form-select">
                            <option value="" selected>Select District</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="ward" class="form-label">Ward</label>
                        <select id="ward" class="form-select">
                            <option value="" selected>Select Ward</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Detailed Address:</label>
                        <input type="text" id="address" name="address" class="form-control" required
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
            <div class="overlay" id="overlay" onclick=""></div>
            <div class="popup" id="updatePopup">
                <div class="" style="display: flex; ">
                    <h4 class="title" id="popupLabel">Update Address</h4>
                </div>
                <form method="POST" action="updateAddress">
                    <div class="mb-3">
                        <label for="city" class="form-label">Province</label>
                        <select id="city" class="form-select">
                            <option value="" selected>Select Province</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="district" class="form-label">District</label>
                        <select id="district" class="form-select">
                            <option value="" selected>Select District</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="ward" class="form-label">Ward</label>
                        <select id="ward" class="form-select">
                            <option value="" selected>Select Ward</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Detailed Address:</label>
                        <input type="text" id="address" name="address" class="form-control" required
                               value="Nguyễn Văn Trường">
                    </div>
                    <div class="mb-3 form-check form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                        <label class="form-check-label" for="flexSwitchCheckDefault">Set as default</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="closeUpdatePopup()"
                                data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-danger">Save</button>
                    </div>
                </form>
            </div>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
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
                            const host = "https://provinces.open-api.vn/api/";
                            let selectedProvince = "${requestScope.province}";
                            let selectedDistrict = "${requestScope.district}";
                            let selectedWard = "${requestScope.ward}";

                            function removeDiacritics(str) {
                                return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
                            }

                            function convertLocationName(vietnameseName, type) {
                                let name = vietnameseName.replace(/^(Tỉnh |Thành phố |Quận |Huyện |Phường |Xã )/, "");
                                let suffix = type === "province" ? " Province" : type === "district" ? " District" : " Ward";
                                return removeDiacritics(name) + suffix;
                            }

                            function callAPI(api, select, type, selectedValue = "") {
                                return axios.get(api)
                                        .then((response) => {
                                            let data = type === "province" ? response.data : response.data[type + "s"];
                                            renderData(data, select, type, selectedValue);
                                        });
                            }

                            function renderData(array, select, type, selectedValue) {
                                let row = `<option value="">Select ${select.charAt(0).toUpperCase() + select.slice(1)}</option>`;
                                array.forEach(element => {
                                    let displayName = convertLocationName(element.name, type);
                                    let isSelected = element.name === selectedValue ? "selected" : "";
                                    row += `<option data-id="${element.code}" value="${element.name}" ${isSelected}>${displayName}</option>`;
                                });
                                document.querySelector("#" + select).innerHTML = row;
                                if (select === "city" && selectedValue) {
                                    loadDistricts();
                                }
                            }

                            function loadDistricts() {
                                let cityId = document.querySelector("#city").selectedOptions[0].dataset.id;
                                callAPI(host + `p/${cityId}?depth=2`, "district", "district", selectedDistrict)
                                        .then(() => loadWards());
                            }

                            function loadWards() {
                                let districtId = document.querySelector("#district").selectedOptions[0].dataset.id;
                                callAPI(host + `d/${districtId}?depth=2`, "ward", "ward", selectedWard);
                            }

                            document.querySelector("#city").addEventListener("change", loadDistricts);
                            document.querySelector("#district").addEventListener("change", loadWards);
                            document.querySelector("#ward").addEventListener("change", printResult);

                            function printResult() {
                                let city = document.querySelector("#city").selectedOptions[0].text;
                                let district = document.querySelector("#district").selectedOptions[0].text;
                                let ward = document.querySelector("#ward").selectedOptions[0].text;
                                document.querySelector("#result").textContent = `${city} | ${district} | ${ward}`;
                                    }
                                    document.addEventListener("DOMContentLoaded", () => {
                                        callAPI(host + '?depth=1', "city", "province", selectedProvince);
                                    });

            </script>
    </body>

</html>