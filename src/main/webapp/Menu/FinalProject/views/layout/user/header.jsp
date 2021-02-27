<%@page import="model.userInfo"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/Menu/FinalProject/views/layout/user/assets/themes" var="url"></c:url>
<c:url value="/Menu/FinalProject/views/user" var="url_user_jsp"></c:url>
<%
    userInfo u = (userInfo) session.getAttribute("account");
    if (u != null) {
        request.setAttribute("UserName", u.getLastName());
    } else {
        request.setAttribute("UserName", "Bạn");
    }
    request.setAttribute("user", u);
%>

<div id="header">
    <div class="container">
        <div id="welcomeLine" class="row">
            <div class="span6">Xin chào!<strong> ${UserName}</strong></div>
            <div class="span6">
                <div class="pull-right" >
                    <c:choose>
                        <c:when test="${sessionScope.cart.size() > 0}">
                            <c:set var="SL" value="${sessionScope.cart.size()}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="SL" value="0"/>
                        </c:otherwise>
                    </c:choose>
                    <a href="${pageContext.request.contextPath }/cart"><span  style="font-weight: bold">Giỏ hàng của bạn : </span></a>
                    <a href="${pageContext.request.contextPath }/cart"><span class="btn btn-mini btn-primary" id="cart-shop" ><i class="icon-shopping-cart icon-white"></i>  [ <span  id="SL">${SL}</span> ] sản phẩm trong giỏ hàng </span> </a> 
                </div>
            </div>
        </div>
        <!-- Navbar ================================================== -->
        <div id="logoArea" class="navbar" >
            <a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <div class="navbar-inner">
                <a class="brand" href="${pageContext.request.contextPath }/welcome"><img src="${url}/images/logo.png" alt="Bootsshop"/></a>
                <form class="form-inline navbar-search" method="get" action="${pageContext.request.contextPath }/products/search?${request.getParameter()}">
                    <input id="srchFld" name="Name" class="srchTxt" type="text" style="width: 400px;height: 30px;font-size: 20px; text-align: left;padding-left : 30px ;border-radius: 5px"/>
                    <button type="submit" id="submitButton" class="btn btn-primary" style="width: 80px;height: 40px">Tìm</button>
                </form>
                <ul id="topMenu" class="nav pull-right">
                    <li class=""><a href="${url_user_jsp}/contact.jsp">Liên hệ </a></li>
                        <c:choose>
                            <c:when test="${user==null}">
                            <li class=""><a href="${pageContext.request.contextPath }/register" style="padding-right:0px"><span class="btn btn-large btn-primary">Đăng kí</span></a> </li>
                            <li class="">
                                <a href="${pageContext.request.contextPath }/login" role="button" style="padding-right:0"><span class="btn btn-large btn-success">Đăng nhập</span></a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <button data-toggle="collapse" data-target="#collapse" class="btn btn-success" style="margin-top: 15px ;">Tài khoản của bạn </button>
                            <div id="collapse" class="collapse" style="text-align: center ; margin-left: 74px; background-color: #E4E4E4;border-radius: 2px;z-index: 999999">
                                <li style="margin-top: -8px;">
                                    <a href="${url_user_jsp}/my_account.jsp" role="button" ><span class="btn btn-primary">Thay đổi thông tin</span></a>
                                </li>
                                <li style="margin-top: -16px;">
                                    <a href="${pageContext.request.contextPath }/myOrder" role="button" ><span class="btn btn-primary">Đơn hàng đã mua</span></a>
                                </li>
                                <li style="margin-top: -16px;">
                                    <a href="${pageContext.request.contextPath }/logout" role="button" ><span class="btn btn-danger">Đăng xuất</span></a>
                                </li>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
</div>