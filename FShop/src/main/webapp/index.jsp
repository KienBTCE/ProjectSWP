<%-- 
    Document   : index.jsp
    Created on : Dec 4, 2024, 3:16:00 PM
    Author     : KienBTCE180180
--%>

<%@page import="Models.Laptop"%>
<%@page import="Models.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F Shop</title>
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <style>
            .gap-section{
                margin-bottom: 50px;
            }
            .banner-content img{
                width: 100%;
            }

            .title-content{
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

            .star-rating {
                display: flex;
                align-items: center;
                font-size: 24px;
                color: #ffcc00; /* Màu vàng */
            }
            .star-rating .star {
                margin-right: 5px;
            }
            .star-rating .count {
                margin-left: 10px;
                font-size: 16px;
                color: #555;
            }

            .title-content a{
                text-decoration: none;
                color: black;
                font-weight: bold;
            }
            .title-content a:hover{
                color: black;
                opacity: 0.7;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="gap-section banner-content">
                        <img src="assets/imgs/Banners/banner-home.svg" alt="alt"/>
                    </div>
                </div>
                <div class="row">
                    <h4 class="title-content"><a href="Laptop">Laptop</a></h4>
                    <div class="gap-section section-content">

                    <c:set var="count" value="0" scope="page"></c:set>
                    <c:forEach items="${laptops}" var="p" varStatus="status">
                        <c:if test="${count < 5}">
                            <c:set var="count" value="${count + 1}" scope="page"></c:set>
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
            </div>

            <div class="row">
                <h4 class="title-content"><a href="Phone">Smart Phone</a></h4>
                <div class="gap-section section-content">

                    <c:set var="count" value="0" scope="page"></c:set>
                    <c:forEach items="${phones}" var="p" varStatus="status">
                        <c:if test="${p.isPhone() && count < 5}">
                            <c:set var="count" value="${count + 1}" scope="page"></c:set>
                                <div class="frame-represent">
                                    <img src="assets/imgs/SmartPhone/${p.getImage()}" width="150px" height="150px" alt="alt"/>
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
            </div>

            <div class="row">
                <h5 class="title-content">Follow us on Instagram for News, Offers & More</h5>
                <div class="gap-section section-content">
                    <div class="frame-represent">
                        <img src="assets/imgs/Magazines/news-1.svg" width="235px" height="150px" alt="alt"/>
                        <div class="magazine-paragraph">
                            <p style="width: 100%">
                                If you’ve recently made a desktop PC or laptop purchase, you might want to consider adding peripherals to enhance your home office setup, your gaming rig, or your business workspace...
                            </p>
                        </div>
                    </div>
                    <div class="frame-represent">
                        <img src="assets/imgs/Magazines/news-2.svg" width="235px" height="150px" alt="alt"/>
                        <div class="magazine-paragraph">
                            <p style="width: 100%">
                                As a gamer, superior sound counts for a lot. You need to hear enemies tiptoeing up behind you for a sneak attack or a slight change in the atmospheric music signaling a new challenge or task...
                            </p>
                        </div>
                    </div>
                    <div class="frame-represent">
                        <img src="assets/imgs/Magazines/news-3.svg" width="235px" height="150px" alt="alt"/>
                        <div class="magazine-paragraph">
                            <p style="width: 100%">
                                If you’ve recently made a desktop PC or laptop purchase, you might want to consider adding peripherals to enhance your home office setup, your gaming rig, or your business workspace...
                            </p>
                        </div>
                    </div>
                    <div class="frame-represent">
                        <img src="assets/imgs/Magazines/news-4.svg" width="235px" height="150px" alt="alt"/>
                        <div class="magazine-paragraph">
                            <p style="width: 100%">
                                If you’ve recently made a desktop PC or laptop purchase, you might want to consider adding peripherals to enhance your home office setup, your gaming rig, or your business workspace...
                            </p>
                        </div>
                    </div>
                    <div class="frame-represent">
                        <img src="assets/imgs/Magazines/news-5.svg" width="235px" height="150px" alt="alt"/>
                        <div class="magazine-paragraph">
                            <p style="width: 100%">
                                If you’ve recently made a desktop PC or laptop purchase, you might want to consider adding peripherals to enhance your home office setup, your gaming rig, or your business workspace...
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>

        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>