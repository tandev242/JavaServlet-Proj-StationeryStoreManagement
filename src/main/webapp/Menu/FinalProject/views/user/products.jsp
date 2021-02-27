<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:url value="/Menu/FinalProject/views/layout/user/assets/themes" var="url"></c:url>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Products | sản phẩm trong gian hàng</title>
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
                            <li class="active">Danh mục sản phẩm</li>
                        </ul>
                        <h3> ${subCat.getNameSubCategory()} <small class="pull-right"> ${listPro.size()} sản phẩm đang được bán </small></h3>	
                        <hr class="soft"/>
                        <hr class="soft"/>
                        <form class="form-horizontal span6">
                            <div class="control-group">
                                <label class="control-label alignL">Sort By </label>
                                <select>
                                    <option>Priduct name A - Z</option>
                                    <option>Priduct name Z - A</option>
                                    <option>Priduct Stoke</option>
                                    <option>Price Lowest first</option>
                                </select>
                            </div>
                        </form>

                        <div id="myTab" class="pull-right">
                            <a href="#listView" data-toggle="tab"><span class="btn btn-large"><i class="icon-list"></i></span></a>
                            <a href="#blockView" data-toggle="tab"><span class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
                        </div>
                        <br class="clr"/>
                        <div class="tab-content">
                            <div class="tab-pane" id="listView">
                                <c:forEach items="${listPro}" var="p">
                                    <div class="row">	  
                                        <div class="span2">
                                            <img src="${url}/images/products/${p.getImage()}" alt="" style="height: 200px"/>
                                        </div>
                                        <div class="span4">
                                            <h3>${p.getName()}</h3>				
                                            <hr class="soft"/>
                                            <p>
                                                ${p.getDescription()}
                                            </p>
                                            <a class="btn btn-small pull-right" href="${pageContext.request.contextPath }/product/detail?id=${p.getID()}">Chi tiết</a>
                                            <br class="clr"/>
                                        </div>
                                        <div class="span3 alignR">
                                            <form class="form-horizontal qtyFrm">
                                                <h3> ${p.getPrice()} VNĐ</h3>
                                                <br/>
                                                <a href="${pageContext.request.contextPath }/cart/add?ID=${p.getID()}&quantity=1" class="btn btn-large btn-primary"> Thêm vào <i class=" icon-shopping-cart"></i></a>
                                                <a href="${pageContext.request.contextPath }/cart/add?ID=${p.getID()}&quantity=1" class="btn btn-large"><i class="icon-zoom-in"></i></a>

                                            </form>
                                        </div>
                                    </div>
                                    <hr class="soft"/>
                                </c:forEach>
                            </div>

                            <div class="tab-pane  active" id="blockView">
                                <ul class="thumbnails">
                                    <c:forEach items="${listPro}" var="p">
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <a href="${pageContext.request.contextPath }/product/detail?id=${p.getID()}"><img src="${url}/images/products/${p.getImage()}" alt="" style="height: 220px"/></a>
                                                <div class="caption">
                                                    <h5>${p.getName()}</h5>
                                                    <input hidden="true" value="${p.getID()}"/>
                                                    <h4 style="text-align:center"><a class="btn" href="${pageContext.request.contextPath }/product/detail?id=${p.getID()}"> <i class="icon-zoom-in"></i></a> <a class="btn add-cart" href="javascript:void(0);">Thêm<i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" >${p.getPrice()} VND</a></h4>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                                <hr class="soft"/>
                            </div>
                        </div>
                        <div class="pagination">
                            <ul>
                                <li><a href="#">&lsaquo;</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">...</a></li>
                                <li><a href="#">&rsaquo;</a></li>
                            </ul>
                        </div>
                        <br class="clr"/>
                    </div>
                </div>
            </div>
        </div>
        <!-- MainBody End ============================= -->
        <!-- Footer ================================================================== -->
        <%@include file="/Menu/FinalProject/views/layout/user/footer.jsp" %>
        <script src="${url}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
        <script src="${url}/js/effect.js" type="text/javascript"></script>
    </body>
</html>