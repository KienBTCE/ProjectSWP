<%-- Document : Payment Created on : Dec 14, 2024, 7:47:35 PM Author : nhutb --%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Models.Cart" %>
<%@page import="Models.Customer" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" />

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/checkout.css">
        <link rel="stylesheet" href="./assets/css/popup.css" />
        <title>Checkout</title>
        <style>


        </style>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <main>
                <div class="container">
                    <p><a style=" text-decoration: none;
                          color: black;" href="HomeServlet">Home</a> ›
                        <a style=" text-decoration: none;
                           color: black;" href="shoppingCart.jsp">Shopping Cart</a> ›
                        Checkout Process
                    </p>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="title">
                                <div>
                                    <h1>Confirmation</h1>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-4" style="text-align: right;">
                            <img src="./assets/imgs/CheckoutImg/status2.jpg" alt="" width="350px">
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-md-12" style="text-align: left;">
                            <h5>Shipping Address</h5>
                            <svg width="66%" height="2" viewBox="0 0 66% 2" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                            <path d="M0 1L924 1.00008" stroke="#CACDD8" />
                            </svg>
                        </div>

                    </div>
                    <div class="row ">
                        <div class="col-md-8">
                            <table style="width: 100%;">
                                <tr style="padding: 20px 20px 20px 0px;">
                                    <th style="width: 30%;"></th>
                                    <th style="width: 70%;"></th>
                                </tr>
                                <tr style="padding: 20px 20px 20px 0px;">
                                    <td style="padding: 20px 20px 20px 0px;"><b>Email:</b></td>
                                    <td style="padding: 20px 20px 20px 0px;">
                                    ${sessionScope.customer.getEmail()}</td>
                            </tr>
                            <tr style="padding: 20px 20px 20px 0px;">
                                <td style="padding: 20px 20px 20px 0px;"><b>Fullname</b></td>
                                <td style="padding: 20px 20px 20px 0px;">
                                    ${sessionScope.order.getFullName()}</td>
                            </tr>
                            <tr style="padding: 20px 20px 20px 0px;">
                                <td style="padding: 20px 20px 20px 0px;"><b>Phone number</b>
                                </td>
                                <td style="padding: 20px 20px 20px 0px;">
                                    ${sessionScope.order.getPhone()}</td>
                            </tr>
                            <tr style="padding: 20px 20px 20px 0px;">
                                <td style="padding: 20px 20px 20px 0px;"><b>Address</b></td>
                                <td style="padding: 20px 20px 20px 0px;">
                                    ${sessionScope.order.getAddress()}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-4"
                         style="background-color: #f5f7ff; padding: 20px; margin-top: -10px; height: 80%;">
                        <div> 
                            <h4>Order Summary</h4>
                            <svg width="100%" height="2" viewBox="0 0 100% 2" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                            <path d="M0 1L924 1.00008" stroke="#CACDD8" />
                            <c:set var="subtotal" value="0"></c:set>
                            <c:forEach items="${sessionScope.cartSelected}" var="p">
                                <div style="display: flex; column-gap: 20px;">
                                    <div><img src="./assets/imgs/Products//${p.getImage()}" alt=""
                                              width="70px"></div>
                                    <div>
                                        <div>
                                            <p>${p.getFullName()}</p>
                                        </div>
                                        <div
                                            style="display: flex; column-gap: 10px; margin-top: -15px;">
                                            <div>Qty ${p.getQuantity()}</div>
                                            <div><b>
                                                    <fmt:formatNumber
                                                        value="${p.getPrice() * p.getQuantity()}"
                                                        type="currency" />
                                                </b></div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <c:set var="subtotal" value="${subtotal + (p.getPrice() * p.getQuantity())}"></c:set>
                            </c:forEach>
                        </div>
                        <svg width="100%" height="2" viewBox="0 0 100% 2" fill="none"
                             xmlns="http://www.w3.org/2000/svg">
                        <path d="M0 1L924 1.00008" stroke="#CACDD8" />
                        </svg>
                        <br>
                        <div
                            style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px">

                            <h6><img src="./assets/imgs/icon/coupon.png" alt="alt" width="20" height="20" style="margin-top: -5px"/> Apply Voucher(if have)</h6>

                            <a onclick="openVoucherPopup()"
                               style="color: blue; margin-top: -6px; cursor: pointer">
                                Select Voucher
                            </a>

                        </div>
                        <svg width="100%" height="2" viewBox="0 0 100% 2" fill="none"
                             xmlns="http://www.w3.org/2000/svg">
                        <path d="M0 1L924 1.00008" stroke="#CACDD8" />
                        </svg>
                        <div> <p id="selectedVoucher" style="margin-top: 10px;"></p>
                        </div>
                        <div style="display: flex; justify-content: space-between;">
                            <div style="text-align: left">
                                <h6 >Subtotal</h6>
                                <h6 >Discount</h6>
                                <h4 >Total</h4>
                            </div>
                            <div>
                                <h6 style="text-align: right;">
                                    <fmt:formatNumber value="${subtotal}" type="currency" />
                                </h6>
                                <h6 style="text-align: right;">
                                    <c:set var="total" value="${totalAmount}" />
                                    <fmt:formatNumber value="${total}" type="currency" />
                                </h6>
                                <h4 style="text-align: right;">
                                    <c:set var="total" value="${totalAmount}" />
                                    <fmt:formatNumber value="${total}" type="currency" />
                                </h4>
                            </div>

                        </div>

                    </div>

                </div>

            </div>
            <br>

            <div class="container">
                <form style="text-align: right" class="infor" action="order" method="POST">
                    <input type="number" name="totalAmount" value="${total}" hidden>
                    <button type="submit"
                            style="background-color: #0156ff; border: #0156ff solid 1px; color: white;">
                        Place order
                    </button>
                    <input name="buyProductAction" value="placeOrder" hidden="">
                </form>
            </div>
            <br>
            <div style="display: none;" class="popup" id="orderPopup">
                <div class="popup-content">
                    <h3>Order Successful</h3>
                    <p>Your order is waiting for acceptance by the shop.</p>
                    <div style="display: flex; justify-content: center;">
                        <button><a style="text-decoration: none; color: white;"
                                   href="ViewOrderHistory">OK</a></button>
                        <button><a style="text-decoration: none; color: white;"
                                   href="ProductListView">Back to home</a></button>
                    </div>
                </div>
            </div>
        </main>
        <div id="voucherPopup" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); justify-content: center; align-items: center;">
            <div style="background: white; padding: 20px; border-radius: 10px; width: 400px; text-align: left;">
                <h2>Choose your voucher</h2>

                <!--                 Nhập mã voucher 
                                <div style="display: flex; gap: 10px; margin-bottom: 15px;">
                                    <input type="text" id="voucherCode" placeholder="Shopee voucher code" style="flex: 1; padding: 8px; border: 1px solid #ccc;">
                                    <button id="applyVoucher" style="padding: 8px 12px; background-color: orange; color: white; border: none; cursor: pointer;">Áp dụng</button>
                                </div>-->

                <!-- Danh sách voucher -->
                <div style="border-top: 1px solid #ddd; padding-top: 10px;">
                    <div style="padding: 10px; border-bottom: 1px solid #eee;">
                        <input type="radio" name="voucher" value="FREESHIP_XTRA" data-valid="true">
                        <label>Freeship Xtra - Giảm ₫25k</label>
                        <p>HSD: 1 ngày nữa <a href="#">T&C</a></p>
                    </div>
                    <div style="padding: 10px; border-bottom: 1px solid #eee;">
                        <input type="radio" name="voucher" value="FREESHIP_XTRA" data-valid="true">
                        <label>Freeship Xtra - Giảm ₫25k</label>
                        <p>HSD: 1 ngày nữa <a href="#">T&C</a></p>
                    </div>

                </div>

                <!-- Nút xác nhận -->
                <div style="margin-top: 10px; display: flex; justify-content: right; column-gap: 10px">
                    <button id="closePopup" onclick="closeVoucherPopup()" class="btn btn-secondary">Cancel</button>
                    <button id="confirmVoucher" class="btn btn-primary" >OK</button>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
            <script>


                        function openVoucherPopup() {
                            document.getElementById("voucherPopup").style.display = "flex";
                        }
                        function closeVoucherPopup() {
                            document.getElementById("voucherPopup").style.display = "none";
                        }

                        function applyVoucher(voucher) {
                            document.getElementById("selectedVoucher").innerHTML = "Selected: " + voucher;
                            closeVoucherPopup();
                            // Redirect to servlet with the selected voucher
                            window.location.href = "applyVoucherServlet?voucher=" + voucher;
                        }
                        function showPopup() {
                            document.getElementById("orderPopup").style.display = "flex";
                        }

                        function closePopup() {
                            document.getElementById("orderPopup").style.display = "none";
                        }

// Show popup if login fails (you can trigger this with backend error)
// For example, if you're using a session attribute or response error:
            <%
                String message = (String) session.getAttribute("orderStatus");
                if (message != null && message.equals("success")) {
                    out.print("showPopup();");
                    session.removeAttribute("orderStatus"); // Xóa thông báo sau khi hiển thị
                }
            %>
        </script>
    </body>


</html>