<%-- 
    Document   : payment
    Created on : Dec 14, 2024, 7:47:35 PM
    Author     : nhutb
--%>

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
        <link rel="stylesheet" href="./assets/css/popup.css"/>
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
                                    <td style="padding: 20px 20px 20px 0px;">${sessionScope.customer.getEmail()}</td>
                            </tr>
                            <tr style="padding: 20px 20px 20px 0px;">
                                <td style="padding: 20px 20px 20px 0px;"><b>Fullname</b></td>
                                <td style="padding: 20px 20px 20px 0px;">${sessionScope.order.getFullName()}</td>
                            </tr>
                            <tr style="padding: 20px 20px 20px 0px;">
                                <td style="padding: 20px 20px 20px 0px;"><b>Phone number</b></td>
                                <td style="padding: 20px 20px 20px 0px;">${sessionScope.order.getPhone()}</td>
                            </tr>
                            <tr style="padding: 20px 20px 20px 0px;">
                                <td style="padding: 20px 20px 20px 0px;"><b>Address</b></td>
                                <td style="padding: 20px 20px 20px 0px;">${sessionScope.order.getAddress()}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-4"
                         style="background-color: #f5f7ff; padding: 20px; margin-top: -10px; height: 80%;">
                        <h4>Order Summary</h4>
                        <svg width="100%" height="2" viewBox="0 0 100% 2" fill="none"
                             xmlns="http://www.w3.org/2000/svg">
                        <path d="M0 1L385 0.999966" stroke="#CACDD8" />
                        </svg>
                        <c:forEach items="${sessionScope.cartSelected}" var="p">
                            <div style="display: flex; column-gap: 20px;">
                                <div><img
                                        src="./assets/imgs/Products//${p.getImage()}"
                                        alt="" width="70px"></div>
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
                        </c:forEach>

                        <h4>Total:
                            <c:set var="total" value="${totalAmount}" />
                            <fmt:formatNumber value="${total}" type="currency" />
                        </h4>
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
            <div class="popup" id="orderPopup">
                <div class="popup-content">
                    <h3>Order Successful</h3>
                    <p>Your order is waiting for acceptance by the shop.</p>
                    <div style="display: flex; justify-content: center;">
                        <button><a style="text-decoration: none; color: white;" href="viewOrderHistory">OK</a></button>
                        <button><a style="text-decoration: none; color: white;" href="ProductListView">Back to home</a></button>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
        </body>

        <script>
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
</html>