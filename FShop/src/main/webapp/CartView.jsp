<%-- Document : shoppingCart Created on : Dec 10, 2024, 10:00:59 PM Author : nhutb --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" />
<%@page import="DAOs.CartDAO" %>
<%@page import="Models.Cart"%>
<!DOCTYPE html>
<html lang="en">

    
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/cart.css">
        <link rel="stylesheet" href="./assets/css/popup.css">
        <title>Shopping Cart</title>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <main>
                <div class="container">
                    <div class="row">
                        <p><a style=" text-decoration: none;
                              color: black;" href="HomeServlet">Home</a> › Login</p>
                        <h2>Shopping Cart</h2>
                    <c:set var="total" value="0" />
                    <div class="col-md-8">
                        <c:if test="${sessionScope.customer == null}">
                            <h2>This feature is being developed by Bui Trung Kien (Guest Cart)</h2>
                        </c:if>
                        <c:if test="${sessionScope.customer != null}">
                            <c:if test="${cartList != null && !cartList.isEmpty()}">
                                <table style="width: 100%; border-collapse: collapse; ">
                                    <tr style="height: 60px;">
                                        <th  class="th" style="width: 3%;"></th>
                                        <th class="th" style="width: 17%;">Item</th>
                                        <th class="th" style="width: 34%;"></th>
                                        <th class="th" style="width: 13%;">Price</th>
                                        <th class="th" style="width: 15%;">Qty</th>
                                        <th class="th" style="width: 13%;">Subtotal</th>
                                        <th class="th" style="width: 5%;"></th>
                                    </tr>


                                    <form id="cartSelected" action="order" method="post">
                                        <c:forEach items="${sessionScope.cartList}" var="p">
                                            <c:if test="${p.getQuantity() == 0}">
                                                <tr>
                                                    <td>
                                                        <input disabled type="checkbox" name="cartSelected" value="${p.getProductID()}">
                                                    </td>
                                                    <td class="td"><img
                                                            src="./assets/imgs/Products/${p.getImage()}"
                                                            alt="" width="105px"></td>
                                                    <td class="th">${p.getFullName()}</td>
                                                    <td class="th">
                                                        <h6>
                                                            <fmt:formatNumber value="${p.getPrice()}" type="currency" />
                                                        </h6>
                                                    </td>
                                                    <td class="th">
                                                        <input 
                                                            style="width: 60%; height: 40px; padding-left: 10px; font-weight: bold; background-color: #f5f7ff; border: #f5f7ff solid 1px;"
                                                            type="number" 
                                                            min="1" 
                                                            value="${p.getQuantity()}" 
                                                            name="quantity" disabled>
                                                    </td>
                                                    <td class="th">
                                                        <h6>
                                                            Sold out
                                                        </h6>
                                                    </td>
                                                    <td class="th">
                                                        <a href="updateCart?id=${p.getProductID()}"><img src="./assets/imgs/ShoppingCartImg/x.jpg" alt=""
                                                                                                         width="25px" ></a>
                                                        <!--                                                        <a href=""><img src="./assets/imgs/ShoppingCartImg/pen.jpg" alt="" width="25px"
                                                                                                                                style="margin-top: 5px;"></a>-->
                                                    </td>
                                                </tr>
                                            </c:if>
                                            <c:if test="${p.getQuantity() > 0}">
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="cartSelected" value="${p.getProductID()}">
                                                    </td>
                                                    <td class="td"><img
                                                            src="./assets/imgs/Products/${p.getImage()}"
                                                            alt="" width="105px"></td>
                                                    <td class="th">${p.getFullName()}</td>
                                                    <td class="th">
                                                        <h6>
                                                            <fmt:formatNumber value="${p.getPrice()}" type="currency" />
                                                        </h6>
                                                    </td>
                                                    <td class="th">
                                                        <input 
                                                            style="width: 60%; height: 40px; padding-left: 10px; font-weight: bold; background-color: #f5f7ff; border: #f5f7ff solid 1px;"
                                                            type="number" 
                                                            min="1" 
                                                            value="${p.getQuantity()}" 
                                                            name="quantity" 
                                                            id="quantity-${p.getProductID()}" 
                                                            onchange="updateQuantity(${p.getProductID()}, this.value)">
                                                    </td>
                                                    <td class="th">
                                                        <h6>
                                                            <fmt:formatNumber value="${p.getPrice() * p.getQuantity()}" type="currency" />
                                                        </h6>
                                                    </td>
                                                    <td class="th">
                                                        <a href="deletePOC?id=${p.getProductID()}"><img src="./assets/imgs/ShoppingCartImg/x.jpg" alt=""
                                                                                                        width="25px" ></a>
                                                        <!--                                                        <a href=""><img src="./assets/imgs/ShoppingCartImg/pen.jpg" alt="" width="25px"
                                                                                                                                style="margin-top: 5px;"></a>-->
                                                    </td>
                                                </tr>
                                            </c:if>
                                            <c:set var="total" value="${total + (p.getPrice() * p.getQuantity())}" />
                                        </c:forEach>
                                        <input name="buyProductAction" value="checkout" hidden="">         
                                    </form>
                                </table>
                            </c:if>
                            <c:if test="${cartList == null || cartList.isEmpty()}">
                                <table style="width: 100%; border-collapse: collapse; ">
                                    <tr style="height: 60px;">
                                        <th  class="th" style="width: 3%;"></th>
                                        <th class="th" style="width: 17%;">Item</th>
                                        <th class="th" style="width: 34%;"></th>
                                        <th class="th" style="width: 13%;">Price</th>
                                        <th class="th" style="width: 15%;">Qty</th>
                                        <th class="th" style="width: 13%;">Subtotal</th>
                                        <th class="th" style="width: 5%;"></th>
                                    </tr>

                                    <c:set var="total" value="0" />
                                    <tr>
                                        <td colspan="7" style="text-align: center; padding: 20px"><h4>No products on cart. Countinue to shopping</h4></td>
                                    </tr>

                                </table>
                            </c:if>
                        </c:if>
                        <br>
                        <div class="btnControl">
<!--                            <div>
                                <input type="submit" name="" id="" value="Continue Shopping"
                                       style="height:35px;width: 200px; border-radius: 20px; color: gray; background-color: white;">
                                <button>Clear Shopping Cart</button>
                            </div>-->
                        </div>
                    </div>
                    <div class="col-md-4 right">
                        <h3>Summary</h3>
                        <div>

                        </div>
                        <div>
                            <!--                            <div class="tax">
                                                            <p>Apply Discount Code</p>
                                                            <button onclick="toggleDisplay('detail2')"
                                                                    style="width: 10%; border: white solid; border-radius: 30px; height: auto;"><svg
                                                                    width="16" height="15" viewBox="0 0 16 15" fill="none"
                                                                    xmlns="http://www.w3.org/2000/svg">
                                                                <path d="M6 9.20209L8 7.20209L10 9.20209" stroke="black" stroke-width="1.6"
                                                                      stroke-linecap="round" />
                                                                </svg>
                                                            </button>
                                                        </div>
                                                        <div id="detail2" style="display: none; color: gray;">
                                                            <div>
                                                                <form action="" class="discount">
                                                                    <div class="form-group">
                                                                        <div class="control-label" style="text-align: left;">Enter discount code
                                                                        </div>
                                                                        <div class="">
                                                                            <input type="text" class="form-control" value="" required
                                                                                   placeholder="Enter Discount code" />
                                                                        </div>
                                                                    </div>
                                                                    <button type="submit"
                                                                            style="background-color: white; border: #0156ff solid 1px; color: #0156ff;">Apply
                                                                        Discount</button>
                                                                </form>
                                                            </div>
                                                        </div>-->
                        </div>

                        <svg width="385" height="2" viewBox="0 0 385 2" fill="none"
                             xmlns="http://www.w3.org/2000/svg">
                        <path d="M0 1.00003L385 0.999997" stroke="#CACDD8" />
                        </svg>
                        <div>
                            <div class="totalPrice">
                                <p>Subtotal</p>
                                <p><fmt:formatNumber value="${total}" type="currency" /></p>
                            </div>
                            <div class="totalPrice">
                                <p>Shipping</p>
                                <p><fmt:formatNumber value="30000" type="currency" /></p>
                            </div>
                            <div class="totalPrice">
                                <p>Order Total</p>
                                <h4><fmt:formatNumber value="${total + 30000}" type="currency" /></h4>
                            </div>
                        </div>
                        <div class="btnSummary">
                            <c:if test="${cartList.isEmpty()}">
                                <button type="button"
                                        style="background-color: #0156ff; border: #0156ff solid 1px; color: white;"
                                        id="checkout" disabled>Proceed
                                    to
                                    Checkout
                                </button>
                            </c:if>
                            <c:if test="${!cartList.isEmpty()}"> 
                                <button type="button"
                                        style="background-color: #0156ff; border: #0156ff solid 1px; color: white;"
                                        id="checkout">Proceed
                                    to
                                    Checkout
                                </button>
                            </c:if>
                        </div>
                    </div>
                </div>
                <br>
                <br>
            </div>
            <div style="background-color: #f5f7ff;">
                <div class="container">
                    <div class="row" style="text-align: center; padding: 30px; background-color: #f5f7ff;">
                        <div class="col-md-4">
                            <img src="./assets/imgs/ShoppingCartImg/headphone.jpg" alt="" width="70px">
                            <h5>Product Support</h5>
                            <p style="width: 70%; margin: 0 auto;">Up to 3 years on-site warranty available for your
                                peace
                                of mind.</p>
                        </div>
                        <div class="col-md-4">
                            <img src="./assets/imgs/ShoppingCartImg/person.jpg" alt="" width="70px">
                            <h5>Personal Account</h5>
                            <p style="width: 70%; margin: 0 auto;">With big discounts, free delivery and a dedicated
                                support
                                specialist.</p>
                        </div>
                        <div class="col-md-4">
                            <img src="./assets/imgs/ShoppingCartImg/tag.jpg" alt="" width="70px">
                            <h5>Amazing Savings</h5>
                            <p style="width: 70%; margin: 0 auto;">Up to 70% off new Products, you can be sure of
                                the best
                                price.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="popup" id="orderPopup">
                <div class="popup-content">
                    <h3>No products.</h3>
                    <p>Please choose at least one product to checkout.</p>
                    <div style="display: flex; justify-content: center;">
                        <button onclick="closePopup()">OK</button>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
        <script>
            function showPopup() {
                document.getElementById("orderPopup").style.display = "flex";
            }

            function closePopup() {
                document.getElementById("orderPopup").style.display = "none";
            }
            function updateQuantity(productId, quantity) {
                // Gửi dữ liệu tới Servlet qua AJAX
                fetch('updateCart', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        productId: productId,
                        quantity: quantity
                    })
                })
                        .then(response => response.text())
                        .then(data => {
                            console.log(data); // Kiểm tra phản hồi từ server
                            window.location.reload(); // Reload lại trang
                            //alert("Quantity updated successfully!");
                        })
                        .catch(error => {
                            console.error("Error updating quantity:", error);
                            //alert("Failed to update quantity. Please try again.");
                        });
            }

            document.getElementById("checkout").addEventListener("click", function () {
                // Lấy tất cả các checkbox trong form
                const checkboxes = document.querySelectorAll("input[name='cartSelected']");
                let isChecked = false;

                // Kiểm tra xem có ít nhất một checkbox được chọn không
                checkboxes.forEach(checkbox => {
                    if (checkbox.checked) {
                        isChecked = true;
                    }
                });

                if (!isChecked) {
                    // Hiển thị thông báo nếu chưa chọn checkbox nào
                    showPopup();
                } else {
                    // Gửi form nếu có checkbox được chọn
                    document.getElementById("cartSelected").submit();
                }
            });


            function toggleDisplay(divId) {
                var x = document.getElementById(divId);
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }
            }

        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </body>

</html>