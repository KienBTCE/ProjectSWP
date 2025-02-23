<%-- 
    Document   : viewFeeback
    Created on : Feb 23, 2025, 6:53:30 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <link rel="stylesheet" href="css/star.css">
    </head>
    <body>
        <c:forEach items ="dataRating" var ="rating">

       <div class="form-css">
        
            
            <div class="profile">

                <h4>${cus.fullName}</h4>
            </div>-->
            <div class="rating-css box box1">
                <div class="star-icon">
<!--                    <input type="radio" name="rating1" id="rating1">
                    <label for="rating1" class="fa fa-star"></label>

                    <input type="radio" name="rating1" id="rating2">
                    <label for="rating2" class="fa fa-star"></label>


                    <input type="radio" name="rating1" id="rating3">
                    <label for="rating3" class="fa fa-star"></label>

                    <input type="radio" name="rating1" id="rating4">
                    <label for="rating4" class="fa fa-star"></label>

                    <input type="radio" name="rating1" id="rating5">
                    <label for="rating5" class="fa fa-star"></label>-->

                </div>
            </div>
            <p>${rating.comment}</p>

     
    </div>
        <%--</c:forEach>--%>
        </c:forEach>
    </body>
</html>
