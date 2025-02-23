/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */





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

    // C?p nh?t s? ?i?n tho?i vào giao di?n
    document.getElementById("phoneDisplay").innerText = newPhone.slice(-2);
    document.getElementById("phoneInput").value = newPhone;

    // ?óng modal
    closeModal();
}
