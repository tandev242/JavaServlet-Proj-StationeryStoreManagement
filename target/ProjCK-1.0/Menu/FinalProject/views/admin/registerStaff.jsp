<%-- 
    Document   : registerStaff
    Created on : Dec 27, 2020, 7:44:15 PM
    Author     : Minh Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:url value="/css" var="url"></c:url>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
            <link href="${url}/Login.css" rel="stylesheet" type="text/css"/>   
    </head>
    <body>
        <% String alertMsg = (String) request.getAttribute("alert");
            request.setAttribute("alert", alertMsg);%>
        <form method="post" action="registerStaff">
            <div class="box">
                <h1>Đăng kí</h1>
                <c:if test="${alert != null}">
                    <script>
                        alert("${alert}");
                    </script>
                </c:if>
                <input type="text" name="UserName" placeholder="User Name" required>
                <input type="password" name="Password" placeholder="Password" required>
                <input type="text" name="Email" placeholder="Email" required>
                <input type="text" name="Phone" placeholder="Phone" pattern="[0-9]{1-30}" required>
                <input type="text" name="FirstName" placeholder="Your First Name" required>
                <input type="text" name="LastName" placeholder="Your Last Name" required>
                <input type="text" name="Address" placeholder="Your Address" required>
                <input type="submit" value="Đăng kí">
                <span style="color: white;"><i><a href="/ProjCK/admin/welcome" style="color:white;">Back to home</a></i></span>
            </div>
        </form>
    </body>
</html>
