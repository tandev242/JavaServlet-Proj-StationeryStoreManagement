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
    <body>
        <!--    Day la Header ================================================================-->
        <%@include file="/Menu/FinalProject/views/layout/user/header.jsp" %>
        <!-- Header End====================================================================== -->
        <div id="mainBody">
            <div class="container">
                <div class="row">
                    <!-- Sidebar ================================================== -->
                    <%@include file="/Menu/FinalProject/views/layout/user/sidebar.jsp" %>
                    <!-- Sidebar end=============================================== -->
                    <div class="span9">
                        <ul class="breadcrumb">
                            <li><a href="${pageContext.request.contextPath}/welcome">Trang chủ</a> <span class="divider">/</span></li>
                            <li class="active">GIỎ HÀNG</li>
                        </ul>
                        <%                            String alert = (String) session.getAttribute("alert");
                            session.removeAttribute("alert");
                            request.setAttribute("al", alert);
                        %>  
                        <c:if test="${al != null}">
                            <h1 style="color: red; margin: 50px" >  ${al} </h1>
                        </c:if>    
                        <h3>  GIỎ HÀNG [ <small>${sessionScope.cart.size()} sản phẩm </small>]<a href="${pageContext.request.contextPath }/welcome" class="btn btn-large pull-right"><i class="icon-arrow-left"></i> TIẾP TỤC MUA SẮM</a></h3>	
                        <hr class="soft"/>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th>Mô tả</th>
                                    <th>Số lượng</th>
                                    <th>Giá/sp</th>
                                    <th>Giá giảm/sp</th>
                                    <th>Tổng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="sum" value="${0}"/>
                                <c:set var="promotion" value="${0}"/>
                                <c:forEach items="${sessionScope.cart}" var="map">
                                    <tr>
                                        <td> <a href="${pageContext.request.contextPath }/product/detail?id=${map.value.product.getID()}"> <img style="max-width:60px ; height: 70px;" src="${url}/images/products/${map.value.product.image }" alt=""/></a></td>
                                        <td style="max-width:240px ;">${map.value.product.name }<br/></td>
                                        <td>
                                            <div class="input-append">
                                                <input class="span1" style="max-width:34px" placeholder="SL" value="${map.value.quantity}" id="appendedInputButtons}" size="16" type="text">
                                                <a href="${pageContext.request.contextPath}/cart/add?ID=${map.value.product.getID()}&quantity=-1" class="btn" type="button"><i class="icon-minus"></i></a>
                                                <a href="${pageContext.request.contextPath}/cart/add?ID=${map.value.product.getID()}&quantity=1" class="btn" type="button"><i class="icon-plus"></i></a>
                                                <a href="${pageContext.request.contextPath}/cart/remove?ID=${map.value.product.getID()}" class="btn btn-danger" type="button"><i class="icon-remove icon-white"></i></a>
                                            </div>
                                        </td>
                                        <td>${map.value.product.price } VNĐ</td>
                                        <td>${map.value.product.getPromotionPrice()} VNĐ</td>
                                        <td>${(map.value.product.price-map.value.product.getPromotionPrice()) * map.value.quantity } VNĐ</td>
                                        <c:set var="promotion" value="${promotion+map.value.product.getPromotionPrice()* map.value.quantity}"/>
                                        <c:set var="sum" value="${sum+(map.value.product.price) * map.value.quantity}"/>
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
                                    <td class="label label-important" style="display:block"> <strong> ${sum-promotion} </strong></td>
                                </tr>
                            </tbody>
                        </table>	
                        <a href="${pageContext.request.contextPath }/welcome" class="btn btn-large"><i class="icon-arrow-left"></i> Tiếp tục mua sắm </a>
                        <!--                        Làm thanh toán bằng tiền mặt hay thẻ -->
                        <a href="#pay" role="button" class="btn btn-large pull-right" data-toggle="modal" style="padding-right:0">Thanh toán  <i class="icon-arrow-right" style="margin-right: 20px"></i></a>
                        <div id="pay" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" style="text-align: center;">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                                <h3>Hình thức thanh toán </h3>
                            </div>
                            <div class="modal-body" >
                                <form class="form-horizontal loginFrm" action="${pageContext.request.contextPath }/pay" method="post">
                                    <div class="control-group">								
                                        <label for="after" style="display: inline-block;">Thanh toán khi nhận hàng </label><br>
                                        <img style="max-width:60px ; height: 60px;" src="${url}/images/payByMoney.png" alt=""/>
                                    </div>
                                    <button type="submit" class="btn btn-large btn-success">Xác nhận </button>
                                </form>
                                <form class="form-horizontal loginFrm"  action="${pageContext.request.contextPath }/payment" method="post">
                                    <div class="control-group">		
                                        <label for="momo" style="display: inline-block">Ví điện tử Momo</label><br>
                                        <img style="max-width:60px ; height: 60px;" src="${url}/images/momo.jpg" alt=""/>
                                    </div>
                                    <button type="submit" class="btn btn-large btn-success">Xác nhận </button>
                                </form>
                                <form class="form-horizontal loginFrm" id="frmCreateOrder" action="${pageContext.request.contextPath }/vnpay" method="post">
                                    <div class="control-group">	
                                        <input name="amount" value="${sum-promotion}" style="display:none;" />
                                        <label for="ibank" style="display: inline-block">Internet Banking</label> </br>
                                        <img style="max-width:60px ; height: 60px" src="${url}/images/ibank.png" alt=""/>
                                    </div>
                                    <button type="submit" class="btn btn-large btn-success">Xác nhận </button>
                                </form>		       
                            </div>
                        </div>
                    </div>
                </div>
                <!-- MainBody End ============================= -->
                <!-- Footer ================================================================== -->
            </div>
        </div>
        <%@include file="/Menu/FinalProject/views/layout/user/footer.jsp" %>
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    },
                    error: function (x) {
                        console.log(x);
                    }
                });
                return false;
            });
        </script>       
    </body>
</html>