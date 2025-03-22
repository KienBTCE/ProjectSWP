<%-- 
    Document   : CustomerVoucherView
    Created on : Mar 18, 2025, 5:20:29 PM
    Author     : nhutb
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.CustomerVoucher" %> 
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gift Voucher</title>
        <style>
            .bodyyyyyy {
                font-family: Arial, sans-serif;
                background-color: white;
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                align-items: center;
                gap: 15px;
            }

            .voucher {
                height: 150px;
                margin: 10px 0px 0px 0px;
                background: white;
                display: flex;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                border: solid 0.5px black;
                position: relative;
            }
            .left {
                padding: 10px;
                color: black;
                flex: 2;
                display: flex;
                flex-direction: column;
                justify-content: center;
                position: relative; /* Needed for .quatity positioning */
            }

            .left h2 {
                display: flex;
                align-items: center;
                font-size: 22px;
                margin: 0;
            }

            .left p {
                font-size: 12px;
                margin: 5px 0;
            }

            .left .terms {
                font-size: 11px;
                margin-top: 5px;
            }

            .logo {
                height: 24px;
                width: 24px;
                margin-right: 8px;
            }

            .right {
                background: #ee4d2d;
                color: white;
                padding: 10px 20px 10px 10px;
                flex: 0.5; /* Shortened width */
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 15px;
                font-weight: bold;
                writing-mode: vertical-rl;
            }

            .quatity {
                width: 40px;
                height: 25px;
                background-color: #ee4d2d;
                color: white;
                font-size: 12px;
                font-weight: bold;
                border-radius: 5px;
                display: flex;
                justify-content: center;
                align-items: center;
                position: absolute;
                top: 5px;
                right: -1px;
            }
            h1{
                border-bottom: 1px gray solid;
                padding-bottom: 20px;
            }

        </style>
    </head>

    <body >
        <main style="border-radius: 10px;
              box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
              padding: 15px;
              background-color: white; height: 100%">
            <h1>Your voucher</h1>
            <br>
            <div class="container-fluid">

                <div class="row d-flex" style="">
                    <c:forEach var="vou" items="${sessionScope.customerVoucher}" >
                        <div class=" col-md-6">
                            <div class="voucher">
                                <div class="right">
                                    <c:if test="${vou.getVoucherType() == 0}">
                                        <fmt:formatNumber type="currency" value="${vou.getVoucherValue()}"></fmt:formatNumber> Sale off
                                    </c:if>
                                    <c:if test="${vou.getVoucherType() == 1}">
                                        ${vou.getVoucherValue()}% Sale off
                                    </c:if>
                                </div>
                                <div class="quatity">
                                    X${vou.getQuantity()}
                                </div>
                                <div class="left">
                                    <h2><img class="logo" src="./assets/imgs/HeaderImgs/Vector-Header-Logo.svg" alt="Logo"> GIFT VOUCHER</h2>
                                    <p>FShop</p>
                                    <div class="terms">
                                        <strong>CONDITIONS</strong>
                                        <p>${vou.getDescription()}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </main>
    </body>

</html>
