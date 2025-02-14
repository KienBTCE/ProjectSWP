<%-- 
    Document   : profile
    Created on : Jan 30, 2025, 9:12:30 PM
    Author     : TuongMPCE180644
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>My Profile</title>
        <style>
            .profile-content {
                flex: 1;
                padding: 30px;
                background: white;
                margin: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }
            .avatar-preview {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
            }

            .profile {
                display: flex;
                flex-wrap: wrap;
                align-items: center;
                justify-content: space-between;
            }

            .info {
                width: 50%;
                min-width: 400px;
            }

            .avatar {
                width: 50%;
                min-width: 400px;
                text-align: center;
                padding: 20px;
            }

            /* CSS cho Modal */
            .phone {
                display: none;
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.4);
            }
            .phone-content {
                background-color: white;
                margin: 10% auto;
                padding: 20px;
                width: 300px;
                border-radius: 5px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.3);
                text-align: center;
            }
            .close-phone {
                float: right;
                font-size: 24px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>

        <form action="updateProfile" method="post" enctype="multipart/form-data">
            <div class="profile">
                <div class="info">
                    <h3>My Profile</h3>
                    <p class="text-muted">Manage your profile information to secure your account</p>

                    <div class="mb-3">
                        <label class="form-label">Email:</label>
                        <p>${sessionScope.customer.getEmail()}</p>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Name:</label>
                        <input type="text" class="form-control" name="fullname" value="${sessionScope.customer.getFullName()}" >
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phone Number:</label>
                        <p>
                            ********<span id="phoneDisplay">${sessionScope.customer.getPhoneNumber().substring(sessionScope.customer.getPhoneNumber().length()-2)}</span> 
                            <input id="phoneInput" name="phoneNumber" type="tel" value="${sessionScope.customer.getPhoneNumber()}" hidden>
                            <button type="button" onclick="openModal()">Change</button>
                        </p>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Gender:</label>
                        <div>
                            <input type="radio" name="gender" value="Male" ${sessionScope.customer.getGender().trim().equalsIgnoreCase("Male") ? 'checked' : ''}> Male
                            <input type="radio" name="gender" value="Female" ${sessionScope.customer.getGender().trim().equalsIgnoreCase("Female") ? 'checked' : ''}> Female
                            <input type="radio" name="gender" value="Other" ${sessionScope.customer.getGender().trim().equalsIgnoreCase("Other") ? 'checked' : ''}> Other
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Date of Birth:</label>
                        <div class="row">
                            <div class="col">
                                <select class="form-select" name="day">
                                    <option>Day</option>
                                    <c:forEach var="i" begin="1" end="31">
                                        <option ${sessionScope.customer.getBirthday() != null && sessionScope.customer.getBirthday().split("-")[2].equals(String.format("%02d", i)) ? 'selected' : ''}>${i}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col">
                                <select class="form-select" name="month">
                                    <option>Month</option>
                                    <c:forEach var="i" begin="1" end="12">
                                        <option ${sessionScope.customer.getBirthday() != null && sessionScope.customer.getBirthday().split("-")[1].equals(String.format("%02d", i)) ? 'selected' : ''}>${i}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col">
                                <select class="form-select" name="year">
                                    <option>Year</option>
                                    <c:forEach var="i" begin="1900" end="2024">
                                        <option ${sessionScope.customer.getBirthday() != null && sessionScope.customer.getBirthday().split("-")[0].equals(String.valueOf(i)) ? 'selected' : ''}>${i}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mb-3 avatar">
                    <label class="form-label">Avatar:</label>
                    <div class="d-block align-items-center">
                        <c:if test="${sessionScope.customer.getAvatar() != null}">
                            <img id="avatarPreview" class="avatar-preview mb-3" src="assets/imgs/icon/${sessionScope.customer.getAvatar()}" alt="Avatar">
                        </c:if>
                        <c:if test="${sessionScope.customer == null || sessionScope.customer.getAvatar() == null}">
                            <img id="avatarPreview" class="avatar-preview mb-3" src="assets/imgs/icon/person.jpg" alt="Avatar">
                        </c:if>  
                        <input type="file" class="form-control" name="avatar" onchange="previewImage(event)" >
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-danger">Save</button>
        </form>

        <!-- Popup nh?p s? ?i?n tho?i -->
        <div id="phoneModal" class="phone">
            <div class="phone-content">
                <span class="close-phone" onclick="closeModal()">&times;</span>
                <h3>Update Phone Number</h3>
                <input type="tel" id="newPhoneNumber" name="phoneNumber" class="form-control" placeholder="Enter new phone number">
                <button onclick="updatePhone()" class="mt-2 btn btn-primary">Save</button>
            </div>
        </div>

    </body>
    <script>
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('avatarPreview');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }

        function openModal() {
            document.getElementById("phoneModal").style.display = "block";
        }

        function closeModal() {
            document.getElementById("phoneModal").style.display = "none";
        }

        function updatePhone() {
            let newPhone = document.getElementById("newPhoneNumber").value;

            if (!newPhone.match(/^\d{10}$/)) {
                alert("Invalid phone number. Please enter a 10-digit number.");
                return;
            }

            // C?p nh?t s? ?i?n tho?i v�o giao di?n
            document.getElementById("phoneDisplay").innerText = newPhone.slice(-2);
            document.getElementById("phoneInput").value = newPhone;

            // ?�ng modal
            closeModal();
        }
    </script>   
</html>