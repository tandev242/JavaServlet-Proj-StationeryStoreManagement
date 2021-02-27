<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:url value="/Menu/FinalProject/views/layout/user/assets/themes" var="url"></c:url>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Tài khoản của bạn | HKTT Văn Phòng Phẩm </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link id="callCss" rel="stylesheet" href="${url}/bootshop/bootstrap.min.css" media="screen"/>
        <link href="${url}/css/base.css" rel="stylesheet" media="screen"/>
        <!-- Bootstrap style responsive -->	
        <link href="${url}/css/bootstrap-responsive.min.css" rel="stylesheet"/>
        <link href="${url}/css/font-awesome.css" rel="stylesheet" type="text/css">
        <!-- Google-code-prettify -->	
        <link href="${url}/js/google-code-prettify/prettify.css" rel="stylesheet"/>
        <!-- fav and touch icons -->
        <link rel="shortcut icon" href="${url}/images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${url}/images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${url}/images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${url}/images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="${url}/images/ico/apple-touch-icon-57-precomposed.png">
        <style type="text/css" id="enject"></style>
        <style>
            .box{
                display: flex;
                flex-direction: column;
                align-items: center;
                margin: 20px 0 100px 0; 
            }
            #change{
                display: flex ; 
                flex-direction: column ; 
                align-items: center ; 
            } 
            #change input
            {
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <%
            String alert = (String) session.getAttribute("alert");
            session.removeAttribute("alert");
            request.setAttribute("alert", alert);
        %>
        <!--    Day la Header ================================================================-->
        <%@include file="/Menu/FinalProject/views/layout/user/header.jsp" %>
        <!-- Header End====================================================================== -->
        <form method="post" action="${pageContext.request.contextPath }/edit" id="form">
            <c:if test="${alert != null}">
                <h1 style="color: red; font-size: 50px; text-align:center">${alert}</h1>;
            </c:if>
            <div class="box">
                <h1>Tài khoản của bạn</h1>
                <input type="text" name="UserName" placeholder="Tên tài khoản" value="${sessionScope.account.getUserName()}" readonly>             
                <input type="text" name="Email" placeholder="Email" value="${sessionScope.account.email}" readonly>
                <input type="text" name="Phone" placeholder="Số điện thoại" pattern="[0-9]{1-30}" value="${sessionScope.account.phone}" required>
                <input type="text" name="FirstName" placeholder="Họ " value="${sessionScope.account.getFirstName()}" required>
                <input type="text" name="LastName" placeholder="Tên" value="${sessionScope.account.getLastName()}" required>
                <input type="text" name="Address" placeholder="Địa chỉ" value="${sessionScope.account.address}" required>
                <div style="display: flex ; flex-direction: row">
                    <input type="submit" class="btn btn-success" value="Lưu lại" style="margin-right: 10px">
                    <a href="#changepass" role="button" class="btn btn-danger" data-toggle="modal">Đổi mật khẩu </a>
                </div>
            </div>
        </form>
        <div id="changepass" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" style="text-align: center;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h3>Đổi mật khẩu </h3>
            </div>
            <div class="modal-body" >
                <form class="form-horizontal loginFrm" method="get" action="${pageContext.request.contextPath }/edit" >
                    <div id="change">
                        <input type="password" name="OldPw" placeholder="Mật khẩu cũ" required ">
                        <input type="password" name="Password" placeholder="Mật khẩu mới" required ">
                        <input  type="password" name="Confirm" placeholder="Xác nhận mật khẩu" required ">
                    </div>
                    <button type="submit" class="btn btn-large btn-success">Xác nhận </button>
                    <button class="btn btn-large" data-dismiss="modal" aria-hidden="true">Hủy </button>
                </form>	
            </div>
        </div>
        <%@include file="/Menu/FinalProject/views/layout/user/footer.jsp" %>
    </body>
</html>
