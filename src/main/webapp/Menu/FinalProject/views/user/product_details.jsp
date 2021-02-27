<%@page import="DAO.inventoryDAO"%>
<%@page import="model.product"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:url value="/Menu/FinalProject/views/layout/user/assets/themes" var="url"></c:url>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Details | Chi tiết sản phẩm </title>
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
                            <li><a href="${url_user_jsp}/index.jsp">Trang chủ</a> <span class="divider">/</span></li>
                            <li><a href="#">Sản phẩm</a> <span class="divider">/</span></li>
                            <li class="active">Chi tiết</li>
                        </ul>	
                        <div class="row">	  
                            <div id="gallery" class="span3">
                                <a href="${url}/images/products/${product.getImage()}" title="Không tựa đề">
                                    <img src="${url}/images/products/${product.getImage()}" style="width:100%" alt="Fujifilm FinePix S2950 Digital Camera"/>
                                </a>
                                <div id="differentview" class="moreOptopm carousel slide">
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <a href="${url}/images/products/${product.getImage()}"> <img style="width:29%" src="${url}/images/products/${product.getImage()}" alt=""/></a>
                                            <a href="${url}/images/products/${product.getImage()}"> <img style="width:29%" src="${url}/images/products/${product.getImage()}" alt=""/></a>
                                            <a href="${url}/images/products/${product.getImage()}" > <img style="width:29%" src="${url}/images/products/${product.getImage()}" alt=""/></a>
                                        </div>
                                        <div class="item">
                                            <a href="${url}/images/products/${product.getImage()}" > <img style="width:29%" src="${url}/images/products/${product.getImage()}" alt=""/></a>
                                            <a href="${url}/images/products/${product.getImage()}"> <img style="width:29%" src="${url}/images/products/${product.getImage()}" alt=""/></a>
                                            <a href="${url}/images/products/${product.getImage()}"> <img style="width:29%" src="${url}/images/products/${product.getImage()}" alt=""/></a>
                                        </div>
                                    </div>
                                    <!--  
                                                <a class="left carousel-control" href="#myCarousel" data-slide="prev">?</a>
                                    <a class="right carousel-control" href="#myCarousel" data-slide="next">?</a> 
                                    -->
                                </div>
                                <div class="btn-toolbar">
                                    <div class="btn-group">
                                        <span class="btn"><i class="icon-envelope"></i></span>
                                        <span class="btn" ><i class="icon-print"></i></span>
                                        <span class="btn" ><i class="icon-zoom-in"></i></span>
                                        <span class="btn" ><i class="icon-star"></i></span>
                                        <span class="btn" ><i class=" icon-thumbs-up"></i></span>
                                        <span class="btn" ><i class="icon-thumbs-down"></i></span>
                                    </div>
                                </div>
                            </div>                                      
                            <div class="span6">
                                <h3>${product.getName()} </h3>
                                <hr class="soft"/>
                                <form class="form-horizontal qtyFrm" action="${pageContext.request.contextPath}/cart/add">
                                    <div class="control-group">
                                        <label class="control-label"><span>Giá : ${product.getPrice()} VND</span></label>
                                        <div class="controls">
                                            <input type="hidden" name="ID" value="${product.getID()}"> 
                                            <input type="number" class="span1" placeholder="Số SP" name="quantity" min="1" value="1" style="text-align: center;"/>
                                            <button type="submit" class="btn btn-large btn-primary pull-right "> Thêm vào giỏ <i class=" icon-shopping-cart"></i></button>
                                        </div>
                                    </div>
                                </form>
                                <h4>${quantity} sản phẩm còn</h4>
                                <hr class="soft clr"/>
                                <p>
                                    ${product.getDescription()}
                                </p>
                                <br class="clr"/>
                                <a href="#" name="detail"></a>
                                <hr class="soft"/>
                            </div>
                            <div class="span9">
                                <form action="${pageContext.request.contextPath}/feedback" method= "post">
                                    <div>
                                        <br>
                                        <h3 style="color:brown; font-family: Times New Roman;">Bình luận về sản phẩm</h3>
                                        <input name="idPro" hidden value="${product.getID()}" />
                                        <input name = "comment" style="width: 100%;height: 100px;padding: 12px 20px;box-sizing: border-box;border: 2px solid #ccc;border-radius: 4px;background-color: #f8f8f8; resize: none;font-family: Times New Roman; font-size: 18px;" required placeholder="Đánh giá về sản phẩm ..." />                               
                                        <br>
                                        <h3 style=" text-align:center;font-family: Times New Roman;"><input type="submit" value="Xác nhận"/> </a></h3>

                                    </div>
                                </form>
                                <h3 style="font-family: Times New Roman; ">Feedback về sản phẩm :</h3>
                                <c:forEach items="${listFeedback}" var="fb">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item">
                                            <a style="font-size: 18px; color: white ; background-color: #01D0F4;" class="nav-link active">${fb.getBuyer().getFirstName()}  ${fb.getBuyer().getLastName()} </a>
                                        </li>
                                        <input readonly style="width: 100%;height: 100px;padding: 12px 20px;box-sizing: border-box;border: 2px solid #ccc;border-radius: 4px;background-color: #E0F8E0; resize: none;font-family: Times New Roman; font-size: 18px;" value="${fb.getComment()}" />               
                                    </ul>
                                </c:forEach>
                                <span><p style="text-align:center">________________________________________________________________________</p></span>
                                <ul id="productDetail" class="nav nav-tabs">
                                    <li class="active"><a href="#profile" data-toggle="tab">Sản phẩm liên quan</a></li>
                                </ul>
                                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane fade active in" id="home">
                                        <ul class="thumbnails">
                                            <c:forEach items="${listPro}" var="p">
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <a href="${pageContext.request.contextPath }/product/detail?id=${p.getID()}"><img src="${url}/images/products/${p.getImage()}" alt="" style="height: 200px"/></a>
                                                        <div class="caption">
                                                            <h5>${p.getName()}</h5>
                                                            <h4 style="text-align:center"><a class="btn" href="${pageContext.request.contextPath }/product/detail?id=${p.getID()}"><i class="icon-zoom-in"></i></a> <a class="btn" href="#">Thêm <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#"> ${p.getPrice()} VND</a></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> </div>
        </div>
        <!-- MainBody End ============================= -->
        <!-- Footer ================================================================== -->
        <%@include file="/Menu/FinalProject/views/layout/user/footer.jsp" %>
    </body>
</html>