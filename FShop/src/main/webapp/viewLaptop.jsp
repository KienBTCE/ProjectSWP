<%-- 
    Document   : viewLaptop
    Created on : Dec 12, 2024, 7:20:22 PM
    Author     : KienBTCE180180
--%>

<%@page import="Models.Laptop"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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

            .filte-table{
                width: 100%;
                height: 500px;
                background-color: lightgrey;
            }
            .view-content{
                display: flex;
                align-content: space-between;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div class="container">
                <div class="row">
                    <div class="gap-section banner-content">
                        <img src="assets/imgs/Banners/banner-laptop.svg" alt="alt"/>
                    </div>
                </div>
                <div class="row">
                    <h4 class="title-content">Type Laptop</h4>
                </div>
                <div class="view-content">

                    <div class="filte-table col-md-2">

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
            <jsp:include page="footer.jsp"></jsp:include>
            <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
