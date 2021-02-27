<%-- 
    Document   : index
    Created on : Nov 8, 2020, 12:00:21 AM
    Author     : Minh Hoang
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <div class="box">
                    <div class="content">
                        <h2>01</h2>
                        <h3>Describe</h3>
                        <p></p>
                        <a href="Menu/Describe/Describe.jsp">Read more</a>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="box">
                    <div class="content">
                        <h2>02</h2>
                        <h3>Group 12</h3>
                        <p></p>
                        <a href="Menu/Group/InfoMember.jsp">Read more</a>
                    </div>
                </div>
            </div><div class="card">
                <div class="box">
                    <div class="content">
                        <h2>03</h2>
                        <h3>Final Project</h3>
                        <p></p>
                        <a href="${pageContext.request.contextPath}/welcome">Read more</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
