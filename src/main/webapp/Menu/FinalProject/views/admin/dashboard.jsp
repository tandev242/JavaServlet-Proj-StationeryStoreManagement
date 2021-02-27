<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value="/Menu/FinalProject/views/layout" var="url"></c:url>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Simple Responsive Admin</title>
        <!-- BOOTSTRAP STYLES-->
        <link href="${url}/admin/assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- FONTAWESOME STYLES-->
        <link href="${url}/admin/assets/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <!-- CUSTOM STYLES-->
        <link href="${url}/admin/assets/css/custom.css" rel="stylesheet" type="text/css"/>
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
        <!-- JQUERY SCRIPTS -->
        <script src="${url}/admin/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="${url}/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- CUSTOM SCRIPTS -->
        <script src="${url}/admin/assets/js/custom.js" type="text/javascript"></script>
        <!-- METISMENU SCRIPTS -->
        <script src="${url}/admin/assets/js/jquery.metisMenu.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="/Menu/FinalProject/views/layout/admin/header.jsp" %>
            <%@include file="/Menu/FinalProject/views/layout/admin/sidebar.jsp" %>
            <%@include file="/Menu/FinalProject/views/layout/admin/body.jsp" %>
            <%@include file="/Menu/FinalProject/views/layout/admin/footer.jsp" %>
        </div>

    </body>
</html>