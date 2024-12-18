<%-- 
    Document   : productDetails
    Created on : 18-Dec-2024, 15:32:53
    Author     : ThyLTK_CE181577
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Support Interface</title>
        <link
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <style>
            img {
                max-width: 100%;
                height: auto;
                display: block;
                margin: 0 auto;
            }
            body,
            html {
                background-color: #f9f9ff;
                margin: 0;
                padding: 0;
            }
            .container-fluid {
                display: flex;
                flex-wrap: nowrap;
                overflow: hidden;
                height: 50vh;
                padding: 0;
                width: 100%;
                box-sizing: border-box;
            }

            .left-section {
                background-color: white;
                display: flex;
                flex-direction: column;
                justify-content: center;
                padding-left: 3%;
                padding-right: 3%;
                width: 50%;
                margin-left: 150px;
            }

            .btn-custom {
                background-color: white;
                color: #333;
                border: 1px solid #ddd;
                box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
                font-size: 1rem;
                padding: 10px 15px;
                margin-bottom: 12px;
                text-align: left;
                position: relative;
            }

            .btn-custom:hover {
                text-decoration: none;
                box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
            }

            .btn-custom::after {
                content: "→";
                position: absolute;
                right: 15px;
                font-weight: bold;
                color: #007bff;
            }

            .right-section {
                flex: 1;
                max-width: 50%;
                background-color: #f9f9ff;
                background: url("./assets/imgs/Banners/banner-helper.png") no-repeat center center;
                background-size: contain;
                justify-content: center;
                align-items: center;
                box-sizing: border-box;
            }
        </style>
    </head>

    <body>

        <jsp:include page="header.jsp"></jsp:include>
            <img src="./assets/imgs/Banners/banner-chip.png" alt="Banner Chip"/>
            <div class="container-fluid">

                <div class="col-md-4 left-section">
                    <a href="#" class="btn btn-custom d-block">Product Support</a>
                    <a href="#" class="btn btn-custom d-block">FAQ</a>
                    <a href="#" class="btn btn-custom d-block">Our Buyer Guide</a>
                </div>

                <div class="col-md-8 right-section"></div>
            </div>

            <img src="./assets/imgs/Banners/banner-details.png" alt="Banner Details"/>
            <img src="./assets/imgs/Banners/banner-icon.png" alt="Banner Icon"/>
        <jsp:include page="footer.jsp"></jsp:include>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
    </body>
</html>
