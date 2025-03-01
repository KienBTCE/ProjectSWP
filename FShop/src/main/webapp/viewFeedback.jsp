<%-- 
    Document   : viewFeedback
    Created on : 25-Feb-2025, 08:01:16
    Author     : HP
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Reviews</title>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    
    <!-- Font Awesome for star icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/star.css">
</head>
<body>
    <div class="container">
        <h2 class="header">Customer Reviews</h2>

      
        <c:forEach var="rate" items="${dataRating}">
            <div class="form-css">
                <div class="profile">
                    <img src="assets/imgs/icon/person.jpg" alt="Avatar">
                    <div>
                        <h4>${rate.fullName}</h4>
                        <small>${rate.createdDate}</small>
                    </div>
                </div>
                
                <div class="rating-css">
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

            
            <c:forEach var="reply" items="${dataReplies}">
                <c:if test="${reply.rateID == rate.rateID}">
                    <div class="reply-container">
                        <img class="reply-img" src="assets/imgs/icon/arrow.png">
                        <div class="formReply-css">
                            <div class="profile">
                                <img src="assets/imgs/icon/person.jpg" alt="Admin">
                                <h4>Shop Manager</h4>
                            </div>
                            <p>${reply.answer}</p>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </c:forEach>


        <form method="POST" action="CommentServlet">
            <input type="hidden" name="productId" value="${productId}">
            <input type="hidden" name="customerId" value="${customerId}">
            
            <label for="star">Your Rating:</label>
            <div class="star-rating">
                <input type="radio" name="star" value="5" id="star5"><label for="star5" class="fa fa-star"></label>
                <input type="radio" name="star" value="4" id="star4"><label for="star4" class="fa fa-star"></label>
                <input type="radio" name="star" value="3" id="star3"><label for="star3" class="fa fa-star"></label>
                <input type="radio" name="star" value="2" id="star2"><label for="star2" class="fa fa-star"></label>
                <input type="radio" name="star" value="1" id="star1"><label for="star1" class="fa fa-star"></label>
            </div>

            <textarea name="comment" placeholder="Write your review..."></textarea>
            <button type="submit">Submit Review</button>
        </form>
    </div>
</body>
</html>
