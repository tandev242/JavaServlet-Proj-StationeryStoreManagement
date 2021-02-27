<%@page import="model.billDetail"%>
<%@page import="DAO.productDAO"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:url value="/Menu/FinalProject/views/layout/user/assets/themes" var="url"></c:url>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Đơn hàng | Thanh toán sản phẩm </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Bootstrap style --> 
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
    </head>
    <body >
        <!--    Day la Header ================================================================-->
        <%@include file="/Menu/FinalProject/views/layout/user/header.jsp" %>
        <!-- Header End====================================================================== -->
        <div id="mainBody">
            <div class="container">
                <div>
                    <div class="span9" style="width: 1150px">
                        <ul class="breadcrumb">
                            <li><a href="Menu/FinalProject/views/user/index.jsp">Trang chủ</a> <span class="divider">/</span></li>
                            <li class="active">ĐƠN HÀNG CỦA BẠN</li>
                        </ul>
                        <c:if test="${al != null}">
                            <h1 style="color: red; margin: 50px" >  ${al} </h1>
                        </c:if>    
                        <h3>  SỐ ĐƠN HÀNG [ <small>${listBD.size()} sản phẩm </small>]<a href="${pageContext.request.contextPath }/welcome" class="btn btn-large pull-right"><i class="icon-arrow-left"></i> QUAY LẠI</a></h3>	
                        <hr class="soft"/>
                        <table class="table table-bordered"  >
                            <thead>
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Ghi chú</th>
                                    <th>Số lượng</th>
                                    <th>Giá/sp</th>
                                    <th>Giá giảm/sp</th>
                                    <th>Tổng</th>
                                </tr>
                            </thead>
                            <tbody >
                                <c:set var="sum" value="${0}"/>
                                <c:set var="promotion" value="${0}"/>
                                <c:forEach items="${listBD}" var="bd">
                                    <c:set var="IDPro" value="${bd.getIDProduct()}"/>
                                    <c:set var="Product" value="${productDAO.get(IDPro)}"/>
                                    <tr>
                                        <td> <a href="${pageContext.request.contextPath }/product/detail?id=${Product.getID()}"><img style="max-width:60px ; height: 70px;" src="${url}/images/products/${Product.getImage()}" alt=""/></a></td>
                                        <td style="max-width:240px ;">${Product.getName()}<br/></td>
                                        <td style="width:400px ;">${bd.getDescription()}<br/></td>
                                        <td>
                                            <div class="input-append">
                                                <input class="span1" style="max-width:34px" readonly="true" value="${bd.getQuantity()}" id="appendedInputButtons}" size="16" type="text">
                                            </div>
                                        </td>
                                        <td>${Product.getPrice() } VNĐ</td>
                                        <td>${Product.getPromotionPrice() } VNĐ</td>
                                        <td>${bd.getAmount()} VNĐ</td>
                                        <c:set var="promotion" value="${promotion + Product.getPromotionPrice() * bd.getQuantity()}"/>
                                        <c:set var="sum" value="${sum + bd.getAmount()}"/>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="6" style="text-align:right">Thành tiền: </td>
                                    <td> ${sum}</td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align:right">Tiền giảm:	</td>
                                    <td> ${promotion}</td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align:right"><strong>TỔNG (${sum} - ${promotion}) =</strong></td>
                                    <td class="label label-important" style="display:block"> <strong> ${sum-promotion} VNĐ </strong></td>
                                </tr>
                            </tbody>
                        </table>	
                        <a href="${pageContext.request.contextPath }/welcome" class="btn btn-large"><i class="icon-arrow-left"></i> Tiếp tục mua sắm </a>
                    </div>
                </div>
                <!-- MainBody End ============================= -->
                <!-- Footer ================================================================== -->
            </div>
        </div>
        <%@include file="/Menu/FinalProject/views/layout/user/footer.jsp" %>
    </body>
</html>