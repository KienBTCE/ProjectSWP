<%-- 
    Document   : ViewListOfNewFeedback
    Created on : Mar 2, 2025, 12:17:32 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Feedback</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>

            .container-feedback {
                margin-left: 270px;  
                padding: 20px;
                width: calc(100% - 300px); 
                transition: all 0.3s ease;
            }

          
            .new-feedback {
                background-color: #e3f2fd; 
                font-weight: bold;
            }

           
            .star-rating i {
                color: #FFD700; 
            }
        </style>
    </head>
    <body class="bg-light">
        <!-- Sidebar -->
        <jsp:include page="sidebarOrderManager.jsp" />  

     
        <div class="container-feedback">
            <h2 class="text-center mb-4">Customer Feedback</h2>
            <div class="card shadow-sm p-4">
                <table class="table table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>#</th>
                            <th>Customer Name</th>
                            <th>Status</th>
                            <th>Star</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${ProductRating}" var="rate" varStatus="loop">
                            <tr class="${!rate.isRead ? 'new-feedback' : ''}">
                                <td>${loop.index + 1}</td>
                                <td>${rate.fullName}</td>
                                <td>
                                    <span class="badge ${!rate.isRead ? 'bg-success' : 'bg-secondary'}">
                                        ${!rate.isRead ? "New" : "Old"}
                                    </span>
                                </td>
                                <td>
                                    <div class="star-rating">
                                        <c:forEach begin="1" end="${rate.star}" var="i">
                                            <i class="fas fa-star"></i> 
                                        </c:forEach>
                                        <c:forEach begin="${rate.star + 1}" end="5" var="i">
                                            <i class="far fa-star"></i> 
                                        </c:forEach>
                                    </div>
                                </td>
                                <td>
                                    <a href="ViewFeedbackForManagerServlet?rateID=${rate.rateID}" class="btn btn-primary btn-sm">
                                        <i class="fas fa-eye"></i> View Details
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>