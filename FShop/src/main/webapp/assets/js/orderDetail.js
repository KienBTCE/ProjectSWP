/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


function confirmDelete() {
    document.getElementById("confirmationModal").style.display = "flex";
    return false;
}
document.getElementById("confirmBtn").onclick = function () {
    document.getElementById("deleteForm").submit();
};
document.getElementById("cancelBtn").onclick = function () {
    document.getElementById("confirmationModal").style.display = "none";
};