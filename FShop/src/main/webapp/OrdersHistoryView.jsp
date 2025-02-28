<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:setLocale value="vi_VN" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="Models.Order"%>
<%@page import="Models.OrderDetail"%>


<html>
    <head>
        <title>Order History</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }

            .nav nav a:hover{
                text-decoration: none;
            }
            .nav nav{
                border-radius: 5px;
                display: flex;
                padding: 30px;
            }

            .nav a {
                text-decoration: none;
                color: black;
                font-weight: bold;
                padding-right: 20px;
                padding-left: 20px;
            }

            .nav nav a.active {
                color: red;
                border-bottom: 2px solid red;
            }

            .order-list {
                display: none;
            }

            .order-list.active {
                display: block;
            }
        </style>
    </head>
    <body>
        <div class="nav">
            <nav class="nav" style="background: white">
                <a href="#" class="tab-link" onclick="showTab('all', this)">All</a>
                <a href="#" class="tab-link" onclick="showTab('waiting', this)">Waiting for acceptance</a>
                <a href="#" class="tab-link" onclick="showTab('transport', this)">Packaging</a>
                <a href="#" class="tab-link" onclick="showTab('delivery', this)">Waiting for delivery</a>
                <a href="#" class="tab-link" onclick="showTab('delivered', this)">Delivered</a>
                <a href="#" class="tab-link" onclick="showTab('canceled', this)">Canceled</a>
            </nav>
        </div>
        <div style="width: 100%; background: rgba(231, 220, 220, 0);">
            <br>
        </div>
        <div id="all" class="order-list active">
            <c:forEach items="${sessionScope.orderList}" var="o">
                <div style="background-color: white; width: 100%; border-radius: 10px;">
                    <div style="text-align: right; padding: 15px; border-bottom: 0.5px solid rgb(226, 214, 214); color:rgb(238,84,61); width: 95%; margin: 0 auto">
                        <c:choose>
                            <c:when test="${o.getStatus() == 1}">Waiting For Acceptance</c:when>
                            <c:when test="${o.getStatus() == 2}">Packaging</c:when>
                            <c:when test="${o.getStatus() == 3}">Waiting For Delivery</c:when>
                            <c:when test="${o.getStatus() == 4}">Delivered</c:when>
                            <c:otherwise>Cancelled</c:otherwise>
                        </c:choose>
                    </div>
                    <br>
                    <div class="container-fluid" style="border-bottom: 0.1px rgb(226, 214, 214) solid; width: 95%; margin: 0 auto">
                        <div class="row" style="display: flex; align-items: center;">
                            <c:forEach var="od" items="${sessionScope.orderDetailList}">
                                <c:if test="${o.getOrderID() == od.getOrderID()}">
                                    <div class="col-md-2">
                                        <img style="border: 0.5px solid gray;" width="100px" height="auto"
                                             src="./assets/imgs/Products/${od.getImage()}"
                                             alt="">
                                    </div>
                                    <div class="col-md-8">
                                        <div>
                                            <a href="ProfileManagementView.jsp?profilePage=OrderDetailsForCustomerView.jsp" style="text-decoration: none; color: black;">${od.getProductName()}</a>
                                        </div>
                                        <div>
                                            Quantity: ${od.getQuantity()}
                                        </div>
                                    </div>
                                    <div class="col-md-2" style="color: rgb(238,84,61); text-align: right;"><fmt:formatNumber value="${od.getPrice()}" type="currency"/></div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <br>
                    </div>
                    <div style="text-align: right; padding: 10px; margin-top: 10px; width: 95%; margin: 0 auto">Total: <h4 style="color: rgb(238,84,61);"><fmt:formatNumber value="${o.getTotalAmount()}" type="currency" /></h4>
                    </div>
                </div>
                <div style="width: 100%; background: rgba(231, 220, 220, 0);">
                    <br>
                </div>
            </c:forEach>
        </div>
        <% boolean hasWaiting = false;%>
        <div id="waiting" class="order-list">
            <c:forEach items="${sessionScope.orderList}" var="o">
                <c:if test="${o.getStatus() == 1}">
                    <% hasWaiting = true; %>
                    <div style="background-color: white; width: 100%; border-radius: 10px;">
                        <div style="text-align: right; padding: 15px; border-bottom: 0.5px solid rgb(226, 214, 214); color:rgb(238,84,61); width: 95%; margin: 0 auto">
                            <c:choose>
                                <c:when test="${o.getStatus() == 1}">Waiting For Acceptance</c:when>
                                <c:when test="${o.getStatus() == 2}">Packaging</c:when>
                                <c:when test="${o.getStatus() == 3}">Waiting For Delivery</c:when>
                                <c:when test="${o.getStatus() == 4}">Delivered</c:when>
                                <c:otherwise>Cancelled</c:otherwise>
                            </c:choose>
                        </div>
                        <br>
                        <div class="container-fluid" style="border-bottom: 0.1px rgb(226, 214, 214) solid; width: 95%; margin: 0 auto">
                            <div class="row" style="display: flex; align-items: center;">
                                <c:forEach var="od" items="${sessionScope.orderDetailList}">
                                    <c:if test="${o.getOrderID() == od.getOrderID()}">
                                        <div class="col-md-2">
                                            <img style="border: 0.5px solid gray;" width="100px" height="auto"
                                                 src="./assets/imgs/Products/${od.getImage()}"
                                                 alt="">
                                        </div>
                                        <div class="col-md-8">
                                            <div>
                                                <a href="OrderDetailsForCustomerView.jsp" style="text-decoration: none; color: black;">${od.getProductName()}</a>
                                            </div>
                                            <div>
                                                Quantity: ${od.getQuantity()}
                                            </div>
                                        </div>
                                        <div class="col-md-2" style="color: rgb(238,84,61); text-align: right;"><fmt:formatNumber value="${od.getPrice()}" type="currency"/></div>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <br>
                        </div>
                        <div style="text-align: right; padding: 10px; margin-top: 10px; width: 95%; margin: 0 auto">Total: <h4 style="color: rgb(238,84,61);"><fmt:formatNumber value="${o.getTotalAmount()}" type="currency" /></h4>
                        </div>
                    </div>
                    <div style="width: 100%; background: rgba(231, 220, 220, 0);">
                        <br>
                    </div>
                </c:if>
            </c:forEach>
            <%
                if (!hasWaiting) {
            %>
            <h1>No Waiting Order</h1>
            <%
                }
            %>
        </div>
        <div id="transport" class="order-list">
            <c:forEach items="${sessionScope.orderList}" var="o">
                <c:if test="${o.getStatus() == 2}">
                    <div style="background-color: white; width: 100%; border-radius: 10px;">
                        <div style="text-align: right; padding: 15px; border-bottom: 0.5px solid rgb(226, 214, 214); color:rgb(238,84,61); width: 95%; margin: 0 auto">
                            <c:choose>
                                <c:when test="${o.getStatus() == 1}">Waiting For Acceptance</c:when>
                                <c:when test="${o.getStatus() == 2}">Packaging</c:when>
                                <c:when test="${o.getStatus() == 3}">Waiting For Delivery</c:when>
                                <c:when test="${o.getStatus() == 4}">Delivered</c:when>
                                <c:otherwise>Cancelled</c:otherwise>
                            </c:choose>
                        </div>
                        <br>
                        <div class="container-fluid" style="border-bottom: 0.1px rgb(226, 214, 214) solid; width: 95%; margin: 0 auto">
                            <div class="row" style="display: flex; align-items: center;">
                                <c:forEach var="od" items="${sessionScope.orderDetailList}">
                                    <c:if test="${o.getOrderID() == od.getOrderID()}">
                                        <div class="col-md-2">
                                            <img style="border: 0.5px solid gray;" width="100px" height="auto"
                                                 src="./assets/imgs/Products/${od.getImage()}"
                                                 alt="">
                                        </div>
                                        <div class="col-md-8">
                                            <div>
                                                <a href="orderDetails.jsp" style="text-decoration: none; color: black;">${od.getProductName()}</a>
                                            </div>
                                            <div>
                                                Quantity: ${od.getQuantity()}
                                            </div>
                                        </div>
                                        <div class="col-md-2" style="color: rgb(238,84,61); text-align: right;"><fmt:formatNumber value="${od.getPrice()}" type="currency"/></div>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <br>
                        </div>
                        <div style="text-align: right; padding: 10px; margin-top: 10px; width: 95%; margin: 0 auto">Total: <h4 style="color: rgb(238,84,61);"><fmt:formatNumber value="${o.getTotalAmount()}" type="currency" /></h4>
                        </div>
                    </div>
                    <div style="width: 100%; background: rgba(231, 220, 220, 0);">
                        <br>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <div id="delivery" class="order-list">
            <c:forEach items="${sessionScope.orderList}" var="o">
                <c:if test="${o.getStatus() == 3}">
                    <div style="background-color: white; width: 100%; border-radius: 10px;">
                        <div style="text-align: right; padding: 15px; border-bottom: 0.5px solid rgb(226, 214, 214); color:rgb(238,84,61); width: 95%; margin: 0 auto">
                            <c:choose>
                                <c:when test="${o.getStatus() == 1}">Waiting For Acceptance</c:when>
                                <c:when test="${o.getStatus() == 2}">Packaging</c:when>
                                <c:when test="${o.getStatus() == 3}">Waiting For Delivery</c:when>
                                <c:when test="${o.getStatus() == 4}">Delivered</c:when>
                                <c:otherwise>Cancelled</c:otherwise>
                            </c:choose>
                        </div>
                        <br>
                        <div class="container-fluid" style="border-bottom: 0.1px rgb(226, 214, 214) solid; width: 95%; margin: 0 auto">
                            <div class="row" style="display: flex; align-items: center;">
                                <c:forEach var="od" items="${sessionScope.orderDetailList}">
                                    <c:if test="${o.getOrderID() == od.getOrderID()}">
                                        <div class="col-md-2">
                                            <img style="border: 0.5px solid gray;" width="100px" height="auto"
                                                 src="./assets/imgs/Products/${od.getImage()}"
                                                 alt="">
                                        </div>
                                        <div class="col-md-8">
                                            <div>
                                                <a href="orderDetails.jsp" style="text-decoration: none; color: black;">${od.getProductName()}</a>
                                            </div>
                                            <div>
                                                Quantity: ${od.getQuantity()}
                                            </div>
                                        </div>
                                        <div class="col-md-2" style="color: rgb(238,84,61); text-align: right;"><fmt:formatNumber value="${od.getPrice()}" type="currency"/></div>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <br>
                        </div>
                        <div style="text-align: right; padding: 10px; margin-top: 10px; width: 95%; margin: 0 auto">Total: <h4 style="color: rgb(238,84,61);"><fmt:formatNumber value="${o.getTotalAmount()}" type="currency" /></h4>
                        </div>
                    </div>
                    <div style="width: 100%; background: rgba(231, 220, 220, 0);">
                        <br>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <div id="delivered" class="order-list">
            <c:forEach items="${sessionScope.orderList}" var="o">
                <c:if test="${o.getStatus() == 4}">
                    <div style="background-color: white; width: 100%; border-radius: 10px;">
                        <div style="text-align: right; padding: 15px; border-bottom: 0.5px solid rgb(226, 214, 214); color:rgb(238,84,61); width: 95%; margin: 0 auto">
                            <c:choose>
                                <c:when test="${o.getStatus() == 1}">Waiting For Acceptance</c:when>
                                <c:when test="${o.getStatus() == 2}">Packaging</c:when>
                                <c:when test="${o.getStatus() == 3}">Waiting For Delivery</c:when>
                                <c:when test="${o.getStatus() == 4}">Delivered</c:when>
                                <c:otherwise>Cancelled</c:otherwise>
                            </c:choose>
                        </div>
                        <br>
                        <div class="container-fluid" style="border-bottom: 0.1px rgb(226, 214, 214) solid; width: 95%; margin: 0 auto">
                            <div class="row" style="display: flex; align-items: center;">
                                <c:forEach var="od" items="${sessionScope.orderDetailList}">
                                    <c:if test="${o.getOrderID() == od.getOrderID()}">
                                        <div class="col-md-2">
                                            <img style="border: 0.5px solid gray;" width="100px" height="auto"
                                                 src="./assets/imgs/Products/${od.getImage()}"
                                                 alt="">
                                        </div>
                                        <div class="col-md-8">
                                            <div>
                                                <a href="orderDetails.jsp" style="text-decoration: none; color: black;">${od.getProductName()}</a>
                                            </div>
                                            <div>
                                                Quantity: ${od.getQuantity()}
                                            </div>
                                        </div>
                                        <div class="col-md-2" style="color: rgb(238,84,61); text-align: right;"><fmt:formatNumber value="${od.getPrice()}" type="currency"/></div>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <br>
                        </div>
                        <div style="text-align: right; padding: 10px; margin-top: 10px; width: 95%; margin: 0 auto">Total: <h4 style="color: rgb(238,84,61);"><fmt:formatNumber value="${o.getTotalAmount()}" type="currency" /></h4>
                        </div>
                    </div>
                    <div style="width: 100%; background: rgba(231, 220, 220, 0);">
                        <br>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <%
            boolean hasCancelOrder = false;
        %>
        <div id="canceled" class="order-list">
            <c:forEach items="${sessionScope.orderList}" var="o">
                <c:if test="${o.getStatus() == 5}">
                    <div style="background-color: white; width: 100%; border-radius: 10px;">
                        <div style="text-align: right; padding: 15px; border-bottom: 0.5px solid rgb(226, 214, 214); color:rgb(238,84,61); width: 95%; margin: 0 auto">
                            <c:choose>
                                <c:when test="${o.getStatus() == 1}">Waiting For Acceptance</c:when>
                                <c:when test="${o.getStatus() == 2}">Packaging</c:when>
                                <c:when test="${o.getStatus() == 3}">Waiting For Delivery</c:when>
                                <c:when test="${o.getStatus() == 4}">Delivered</c:when>
                                <c:otherwise>Cancelled</c:otherwise>
                            </c:choose>
                        </div>
                        <br>
                        <div class="container-fluid" style="border-bottom: 0.1px rgb(226, 214, 214) solid; width: 95%; margin: 0 auto">
                            <div class="row" style="display: flex; align-items: center;">
                                <c:forEach var="od" items="${sessionScope.orderDetailList}">
                                    <c:if test="${o.getOrderID() == od.getOrderID()}">
                                        <div class="col-md-2">
                                            <img style="border: 0.5px solid gray;" width="100px" height="auto"
                                                 src="./assets/imgs/Products/${od.getImage()}"
                                                 alt="">
                                        </div>
                                        <div class="col-md-8">
                                            <div>
                                                <a href="orderDetails.jsp" style="text-decoration: none; color: black;">${od.getProductName()}</a>
                                            </div>
                                            <div>
                                                Quantity: ${od.getQuantity()}
                                            </div>
                                        </div>
                                        <div class="col-md-2" style="color: rgb(238,84,61); text-align: right;"><fmt:formatNumber value="${od.getPrice()}" type="currency"/></div>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <br>
                        </div>
                        <div style="text-align: right; padding: 10px; margin-top: 10px; width: 95%; margin: 0 auto">Total: <h4 style="color: rgb(238,84,61);"><fmt:formatNumber value="${o.getTotalAmount()}" type="currency" /></h4>
                        </div>
                    </div>
                    <div style="width: 100%; background: rgba(231, 220, 220, 0);">
                        <br>
                    </div>
                    <% hasCancelOrder = true;%>
                </c:if>
            </c:forEach>
            <%
                if (!hasCancelOrder) {
            %>
            <h1>No Cancel Order</h1>
            <%
                }
            %>
        </div>
        <div style="width: 100%; background: rgba(231, 220, 220, 0);">
            <br>
        </div>
    </div>

    <script src="./assets/js/order.js"></script>
</body>
</html>
