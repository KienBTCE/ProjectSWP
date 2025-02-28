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
        <title>Feedback</title>
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/star.css">
    </head>
    <body>

        <c:if test="${empty dataRating}">
            <p>This have no feedback!.</p>
        </c:if>
        <div class="comment">
            <c:forEach items="${dataRating}" var="rate">
                <div class="feedback-container">
                    <div class="form-css">
                        <div class="profile">
                            <img src="${rate.avatar}">
                            <h4>${rate.customerName}</h4>
                        </div>
                        <div class="rating-css box box1">
                            <div class="star-icon">
                                <c:forEach var="i" begin="1" end="5">
                                    <c:choose>
                                        <c:when test="${i <= rate.star}">
                                            <i class="fa fa-star checked"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fa fa-star"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                        <p>${rate.comment}</p> 
                    </div>

                    <c:forEach items="${dataReply}" var="rep">
                        <div class="reply-container">
                            <img class="reply-img" src="assets/imgs/icon/arrow.png">
                            <div class="formReply-css">
                                <p>Reply to "${rate.customerName}"</p>
                                <div class="profile">
                                    <img src="assets/imgs/ShoppingCartImg/person.jpg">
                                    <h4>Shop Manager</h4>
                                </div>
                                <p>${rep.answer}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div> 
            </c:forEach>
        </div>

       
        
        <div class="form-css">
        <form>
            <h3 class="header">
                Feedback
            </h3>
            <div class="rating-css box box1">
                <div class="star-icon">
                    <input type="radio" name="rating1" id="rating1">
                    <label for="rating1" class="fa fa-star"></label>

                    <input type="radio" name="rating1" id="rating2">
                    <label for="rating2" class="fa fa-star"></label>


                    <input type="radio" name="rating1" id="rating3">
                    <label for="rating3" class="fa fa-star"></label>

                    <input type="radio" name="rating1" id="rating4">
                    <label for="rating4" class="fa fa-star"></label>

                    <input type="radio" name="rating1" id="rating5">
                    <label for="rating5" class="fa fa-star"></label>
                </div>
            </div>
            <textarea content="Comment" class="box box2">Comment</textarea>
            <button>Submit</button>
        </form>
    </div>
    </body>
</html>
