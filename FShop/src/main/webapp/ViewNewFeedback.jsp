<%-- 
    Document   : ViewNewFeedback
    Created on : Mar 2, 2025, 10:17:23 AM
    Author     : HP
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Reviews</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .main-content {
            margin-left: 270px;
            padding: 20px;
            width: calc(100% - 280px);
            transition: all 0.3s ease-in-out;
        }

        .review-card {
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
        }

        .profile {
            display: flex;
            align-items: center;
        }

        .profile img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .star-rating {
            color: #ffcc00;
        }

        .hidden-feedback {
            color: gray;
            font-style: italic;
        }

        .btn-toggle {
            width: 100px;
        }

        .reply-container {
            margin-left: 40px;
            padding: 10px;
            border-left: 4px solid #007bff;
            background: #f1f1f1;
            border-radius: 5px;
            margin-top: 10px;
        }

        .reply-form {
            display: none;
            margin-top: 10px;
        }

        .reply-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 6px 12px;
            cursor: pointer;
            border-radius: 5px;
        }

        .reply-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <jsp:include page="sidebarOrderManager.jsp" />

    <div class="main-content">
        <h2 class="text-center mb-4">Customer Reviews</h2>
        <h3>"${Product.fullName}" - "${Product.model}"</h3>

        <c:forEach var="rate" items="${dataRating}">
            <div class="review-card">
                <div class="profile">
                    <img src="assets/imgs/icon/person.jpg" alt="Avatar">
                    <div>
                        <h5>${rate.fullName}</h5>
                        <small>${rate.createdDate}</small>
                    </div>
                </div>

                <div class="star-rating">
                    <c:forEach var="i" begin="1" end="5">
                        <c:choose>
                            <c:when test="${i <= rate.star}">
                                <i class="fa fa-star"></i>
                            </c:when>
                            <c:otherwise>
                                <i class="fa fa-star text-muted"></i>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>

                <!-- Comment -->
                <p id="comment-${rate.rateID}" 
                   data-original="${rate.comment}" 
                   class="${rate.isDeleted ? 'hidden-feedback' : ''}">
                    ${rate.isDeleted ? "This feedback was hidden for some reason." : rate.comment}
                </p>

                <!-- Toggle Ẩn/Hiện -->
                <button id="toggle-btn-${rate.rateID}" 
                        class="btn btn-toggle ${rate.isDeleted ? 'btn-warning' : 'btn-success'} btn-sm"
                        onclick="toggleVisibility(${rate.rateID}, ${rate.isDeleted ? 1 : 0})">
                    <i class="fa ${rate.isDeleted ? 'fa-eye' : 'fa-eye-slash'}"></i>
                    ${rate.isDeleted ? "Show" : "Hidden"}
                </button>

                <!-- Reply Button -->
                <button class="reply-btn btn-sm" onclick="toggleReplyForm(${rate.rateID})">
                    <i class="fa fa-reply"></i> Reply
                </button>

                <!-- Reply List -->
                <c:forEach var="reply" items="${dataReplies}">
                    <c:if test="${reply.rateID == rate.rateID}">
                        <div class="reply-container">
                            <strong>Shop Manager</strong>
                            <p>${reply.answer}</p>
                        </div>
                    </c:if>
                </c:forEach>

                <!-- Reply Form -->
                <div id="replyForm-${rate.rateID}" class="reply-form">
                    <form method="POST" action="ReplyFeedbackServlet">
                        <input type="hidden" name="rateID" value="${rate.rateID}">
                        <textarea name="Answer" class="form-control" placeholder="Write your reply..."></textarea>
                        <button type="submit" class="btn btn-primary btn-sm mt-2">Submit Reply</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

    <script>
        function toggleReplyForm(rateID) {
            let form = document.getElementById("replyForm-" + rateID);
            form.style.display = (form.style.display === "none" || form.style.display === "") ? "block" : "none";
        }

        function toggleVisibility(rateID, currentStatus) {
            let newStatus = currentStatus === 1 ? 0 : 1;

            let xhr = new XMLHttpRequest();
            xhr.open("POST", "UpdateStatusCommentServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    let btn = document.getElementById("toggle-btn-" + rateID);
                    let comment = document.getElementById("comment-" + rateID);

                    if (newStatus === 1) {
                        btn.innerHTML = '<i class="fa fa-eye"></i> Show';
                        btn.classList.remove("btn-success");
                        btn.classList.add("btn-warning");

                        comment.setAttribute("data-original", comment.innerHTML);
                        comment.innerHTML = "This feedback was hidden for some reason.";
                        comment.classList.add("hidden-feedback");
                    } else {
                        btn.innerHTML = '<i class="fa fa-eye-slash"></i> Hidden';
                        btn.classList.remove("btn-warning");
                        btn.classList.add("btn-success");

                        let originalContent = comment.getAttribute("data-original");
                        if (originalContent) {
                            comment.innerHTML = originalContent;
                        }
                        comment.classList.remove("hidden-feedback");
                    }

                    btn.setAttribute("onclick", "toggleVisibility(" + rateID + ", " + newStatus + ")");
                } else {
                    console.error("Lỗi từ server:", xhr.status, xhr.responseText);
                }
            };

            xhr.send("rateID=" + rateID + "&isDeleted=" + newStatus);
        }
    </script>

</body>
</html>
