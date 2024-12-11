<%-- 
    Document   : index.jsp
    Created on : Dec 4, 2024, 3:16:00 PM
    Author     : KienBTCE180180
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F Shop</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <h1>Show all products here</h1>
            <ul>
                <li>first</li>
                <li>second</li>
                <li>third</li>
            </ul>
            <footer> <jsp:include page="footer.jsp"></jsp:include></footer>
    </body>
</html>
