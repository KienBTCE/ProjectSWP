<%-- 
    Document   : header
    Created on : Dec 8, 2024, 11:37:14 AM
    Author     : KienBTCE180180
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <link href="assets/fonts/themify-icons/themify-icons.css" rel="stylesheet">
        <style>
            i{
                margin: 5px;
            }

            header{
                width: 100%;
                height: 44px;
                background-color: #D10000;
            }
            .header-container{
                height: 100%;
            }
            .header-infor{
                background-color: #D10000;
                padding: 0 !important;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .infor-content{
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .text-header{
               color: white;
            }
            .infor-content p{
                margin: 0;
            }
            .infor-content:nth-child(1){
                justify-content: left;
            }
            .infor-content:nth-child(3){
                justify-content: right;
            }
            .infor-content:nth-child(3) *{
                margin-left: 5px
            }
            .infor-content a, .nav-infor-content a{
                text-decoration: none;
                color: black;
            }
            .infor-content a:hover, .nav-infor-content a:hover{
                color: black;
                opacity: 0.6;
                text-decoration: none;
            }

            nav{
                width: 100%;
                height: 92px;
                border-bottom: 1.5px solid rgba(0, 0, 1, 0.1);
            }
            .nav-container{
                height: 100%;
            }
            .nav-infor{
                padding: 0 !important;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }
            .nav-infor-content{
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .nav-infor-content:nth-child(1){
                flex-basis: 100px;
            }
            .nav-infor-content:nth-child(2){
                flex-basis: 50%;
            }
            .nav-infor-content:nth-child(3){
                flex-basis: 100px;
            }
            .nav-infor-content:nth-child(3) *{
                margin-left: 5px
            }
            .list-categories{
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                list-style: none;
                display: flex;
                justify-content: space-between;
            }
            li a{
                text-decoration: none;
                color: black;
                font-weight: bold;
            }
            li a:hover{
                color: black;
                opacity: 0.7;
                text-decoration: none;
            }
            @media all and (max-width: 1000px) {
                .header-container .time-head, .phone-head {
                    display: none;
                }

                .nav-infor{
                    padding: 0 !important;
                    height: 100%;
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                }
                .list-cat {
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <header>
            <div class="header-container container">
                <div class="header-infor row">
                    <div class="infor-content time-head col-md-4">
                        <p class="text-header">Mon-Thu 9:00AM - 5:30PM</p>
                    </div>
                    <div class="infor-content address-head col-md-4">
                        <p class="text-header">Nguyen Van Cu, Ninh Kieu, Can Tho</p>
                    </div>
                    <div class="infor-content phone-head col-md-4">
                        <p class="text-header">Call Us: (+84) 12 345 6789</p>
                        <a href="#"><img src="assets/imgs/HeaderImgs/Vector-Header-FB.svg" alt="Facebook" style="width: 23px; height: 23px;"></a>
                        <a href="#"><img src="assets/imgs/HeaderImgs/Vector-Header-IG.svg" alt="Instagram" style="width: 23px; height: 23px;"></a>
                    </div>
                </div>
            </div>
        </header>
        <nav>
            <div class="nav-container container">
                <div class="nav-infor row">
                    <div class="nav-infor-content col-md-4">
                        <a href="/"><img src="assets/imgs/HeaderImgs/Vector-Header-Logo.svg" alt="Shop Logo" style="width: 50px; height: 50px;"></a>
                    </div>
                    <div class="nav-infor-content list-cat col-md-4">
                        <ul class="list-categories">
                            <li>
                                <a href="#">Asus</a>
                            </li>
                            <li>
                                <a href="#">Apple</a>
                            </li>
                            <li>
                                <a href="#">Lenovo</a>
                            </li>
                            <li>
                                <a href="#">Intel</a>
                            </li>
                            <li>
                                <a href="#">Nvidia</a>
                            </li>
                        </ul>
                    </div>
                    <div class="nav-infor-content col-md-4">
                        <i class="ti-search" style="font-size: 150%; color: black;"></i>    
                        <div style="display: flex; align-items: center">
                            <c:if test="${sessionScope.customer == null}">
                                <a href="cart"><i class="ti-shopping-cart" style="font-size: 150%; color: black;"></i></a>
                                </c:if>
                                <c:if test="${sessionScope.customer != null}">
                                <a href="cart"><i class="ti-shopping-cart" style="font-size: 150%; color: black;"></i></a>
                                <p>${sessionScope.numOfProCartOfCus}</p>
                            </c:if>
                        </div>
                        <div style="display: flex; align-items: center; font-size: 12px">
                            <c:if test="${sessionScope.customer != null}">
                                <c:if test="${sessionScope.customer.getAvatar() != ''}">
                                    <a href="viewCustomerProfile"><i class="ti-user" style="font-size: 150%; color: black; margin-left: 20px;"></i></a>
                                    </c:if>
                                    <c:if test="${sessionScope.customer.getAvatar() == ''}">
                                    <a href="viewCustomerProfile"><img style="border-radius: 50%; border: 1px solid gray;" width="30px" height="30px" src="./assets/imgs/icon/person.jpg" alt="alt"/></a>
                                    </c:if>
                                </c:if>
                                <c:if test="${sessionScope.customer == null}">
                                <a href="customerLogin"><i class="ti-user" style="font-size: 150%; color: black; margin-left: 20px;"></i></a>
                                </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
