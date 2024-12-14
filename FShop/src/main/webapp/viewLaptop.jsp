<%-- 
    Document   : viewLaptop
    Created on : Dec 12, 2024, 7:20:22 PM
    Author     : KienBTCE180180
--%>

<%@page import="Models.Laptop"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <style>
            .gap-section{
                margin-bottom: 50px;
            }
            .banner-content img{
                width: 100%;
            }
            .title-content{
                color: black;
                font-weight: bold;
            }
            .section-content{
                display: flex;
                align-items: center;
                justify-content: space-around;
            }
            .frame-represent{
                width: 234px;
                height: 346px;
                text-align: center;
            }

            .filter-table{
                width: 100%;
                height: 500px;
                background-color: #F5F7FF;
            }
            .view-content{
                display: flex;
                align-content: space-between;
            }

            .section-btn{
                width: 100%;
                display: flex;
                justify-content: center;
                margin-bottom: 10px;
            }
            .filter-btn{
                border: 0;
                border-radius: 50px;
                width: 100%;
                background-color: #F5F7FF;
                border: 2px lightgrey solid;
            }
            .filter-btn h6{
                color: lightgrey;
                text-align: center;
                font-weight: bold;
                margin: 6px 0 6px 0;
            }

            .filter-form label{
                user-select: none;
            }
            .filter-form label:hover{
                font-weight: bold;
            }
            fieldset{
                display: flex;
                flex-direction: column;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <main>
                <div class="container">
                    <div class="row">
                        <div class="gap-section banner-content">
                            <img src="assets/imgs/Banners/banner-laptop.svg" alt="alt"/>
                        </div>
                    </div>
                    <div class="row">
                        <h4 class="title-content">${uri}</h4>
                </div>
                <div class="view-content">

                    <div class="filter-table col-md-2">
                        <h6 style="text-align: center; margin-top: 8px;; font-weight: bold;">Filters</h6>
                        <div class="section-btn">
                            <button class="filter-btn"><h6>Clear Filter</h6></button>
                        </div>

                        <form class="filter-form">
                            <fieldset>
                                <legend style="font-size: 100%; font-weight: bold;">Brands</legend>
                                <c:forEach items="${brands}" var="b">
                                    <label><input type="checkbox" name="brand" value="${b}" <c:if test="${fn:contains(filters, b)}">checked</c:if> >${b}</label>
                                    </c:forEach>
                            </fieldset>
                            <fieldset>
                                <legend style="font-size: 100%; font-weight: bold;">Price</legend>
                                <label><input type="checkbox" name="price" value="20-25m">20 - 25 million</label>
                                <label><input type="checkbox" name="price" value="25-30m">25 - 30 million</label>
                                <label><input type="checkbox" name="price" value="30-35m">30 - 35 million</label>
                                <label><input type="checkbox" name="price" value="35-40m">35 - 40 million</label>
                            </fieldset>

                            <!--<button type="button" id="applyFilters">Apply Filters</button>-->
                        </form>

                    </div>

                    <div class="show-product row col-md-10">
                        <!--===================================================-->
                        <c:forEach var="i" begin="1" end="${numberRow}" step="1">

                            <div class="section-content">

                                <c:forEach items="${laptopProducts}" var="p" varStatus="status">
                                    <c:if test="${status.index >= (i * 4 - 4) && status.index < (i * 4)}">
                                        <div class="frame-represent">
                                            <img src="assets/imgs/Laptop/${p.getImage()}" width="150px" height="150px" alt="alt"/>
                                            <div class="star-rating">
                                                <!-- Các ngôi sao -->
                                                <span class="star">★</span>
                                                <span class="star">★</span>
                                                <span class="star">★</span>
                                                <span class="star">★</span>
                                                <span class="star">☆</span>
                                                <!-- Số lượng đánh giá -->
                                                <span class="count">Reviews(4)</span>
                                            </div>
                                            <h6>${p.getFullName()}</h6>
                                            <p>${p.getPriceFormatted()}</p>
                                        </div>
                                    </c:if>
                                </c:forEach>

                            </div>
                        </c:forEach>
                        <!--===================================================-->
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
        <script>
            const pathname = window.location.pathname;
            let customPath = pathname;

            function updateSelectedValues() {
                customPath = pathname;
                const selectedBrands = Array.from(document.querySelectorAll('input[name="brand"]:checked')).map(checkbox => checkbox.value);

                const selectedPrices = Array.from(document.querySelectorAll('input[name="price"]:checked')).map(checkbox => checkbox.value);

                if (selectedBrands.length !== 0 && !customPath.includes("?")) {
                    customPath += "?brand=";
                    for (var i = 0; i < selectedBrands.length; i++) {
                        if (i === 0) {
                            customPath += selectedBrands[i];
                        } else {
                            customPath += "%2C" + selectedBrands[i];
                        }
                    }
                }

                if (selectedPrices.length !== 0 && !customPath.includes("?")) {
                    customPath += "?price=";
                    for (var i = 0; i < selectedPrices.length; i++) {
                        if (i === 0) {
                            customPath += selectedPrices[i];
                        } else {
                            customPath += "%2C" + selectedPrices[i];
                        }
                    }
                } else if (selectedPrices.length !== 0) {
                    customPath += "&price=";
                    for (var i = 0; i < selectedPrices.length; i++) {
                        if (i === 0) {
                            customPath += selectedPrices[i];
                        } else {
                            customPath += "%2C" + selectedPrices[i];
                        }
                    }
                }

                if (!window.location.href.includes(customPath)) {
                    window.location.href = customPath;
                }
            }

            document.querySelectorAll('input[name="brand"], input[name="price"]').forEach(checkbox => {
                checkbox.addEventListener("change", updateSelectedValues);
            });

            updateSelectedValues();
        </script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
