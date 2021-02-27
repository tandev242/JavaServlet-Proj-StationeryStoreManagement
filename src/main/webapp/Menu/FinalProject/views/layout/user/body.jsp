<%@page import="DAO.productDAO"%>
<%@page import="model.product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:url value="Menu/FinalProject/views/layout/user/assets/themes" var="url"></c:url>
<c:url value="/Menu/FinalProject/views/user" var="url_user_jsp"></c:url>   
<%
    List<product> product = productDAO.getListBestSell();
    request.setAttribute("product", product);
    List<product> newProduct = productDAO.getListNewProduct();
    request.setAttribute("newProduct", newProduct);
%>
<div id="mainBody">
    <div class="container">
        <div class="row">
            <!-- Sidebar ================================================== -->
            <%@include file="/Menu/FinalProject/views/layout/user/sidebar.jsp" %>
            <!-- Sidebar end=============================================== -->
            <div class="span9">	
                <div class="well well-small">
                    <h4>Sản phẩm bán chạy <small class="pull-right">12 sản phẩm</small></h4>
                    <div class="row-fluid">
                        <div id="featured" class="carousel slide">
                            <div class="carousel-inner">
                                <div class="item active">
                                    <ul class="thumbnails">
                                        <c:forEach items="${product}" var="product" begin="0" end="3">
                                            <li class="span3">
                                                <div class="thumbnail">
                                                    <i class="tag"></i>
                                                    <a href="${pageContext.request.contextPath }/product/detail?id=${product.getID()}"><img src="${url}/images/products/${product.getImage()}" alt="" style="height: 200px;"></a>
                                                    <div class="caption">
                                                        <h5 style="height: 40px;">${product.getName()}</h5>
                                                         <input hidden="true" value="${product.getID()}"/>
                                                        <h4><a class="btn add-cart" href="javascript:" style="width: 30px;">Thêm</a> <span class="pull-right">${product.getPrice()} VND</span></h4>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="item">
                                    <ul class="thumbnails">
                                        <c:forEach items="${product}" var="product" begin="4" end="7">
                                            <li class="span3">
                                                <div class="thumbnail" >
                                                    <i class="tag"></i>
                                                    <a href="${pageContext.request.contextPath }/product/detail?id=${product.getID()}"><img src="${url}/images/products/${product.getImage()}" alt="" style="height: 200px;"></a>
                                                    <div class="caption">
                                                        <h5 style="height: 40px;">${product.getName()}</h5>
                                                         <input hidden="true" value="${product.getID()}"/>
                                                        <h4><a class="btn add-cart" href="javascript:" style="width: 30px;">Thêm</a> <span class="pull-right">${product.getPrice()} VND</span></h4>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>     
                                <div class="item">
                                    <ul class="thumbnails">
                                        <c:forEach items="${product}" var="product" begin="8" end="11">
                                            <li class="span3">
                                                <div class="thumbnail">
                                                    <i class="tag"></i>
                                                    <a href="${pageContext.request.contextPath }/product/detail?id=${product.getID()}"><img src="${url}/images/products/${product.getImage()}" alt="" style="height: 200px;"></a>
                                                    <div class="caption">
                                                        <h5 style="height: 40px;">${product.getName()}</h5>
                                                          <input hidden="true" value="${product.getID()}"/>
                                                        <h4><a class="btn add-cart" href="javascript:" style="width: 30px;">Thêm</a> <span class="pull-right">${product.getPrice()} VND</span></h4>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>                             
                            </div>
                            <a class="left carousel-control" href="#featured" data-slide="prev">‹</a>
                            <a class="right carousel-control" href="#featured" data-slide="next">›</a>
                        </div>
                    </div>
                </div>
                <h4>Sản phẩm mới nhất </h4>
                <ul class="thumbnails">
                    <c:forEach items="${newProduct}" var="newProduct" begin ="0" end="8">
                        <li class="span3">
                            <div class="thumbnail" >
                                <a  href="${pageContext.request.contextPath }/product/detail?id=${newProduct.getID()}"><img  src="${url}/images/products/${newProduct.getImage()}" alt="" style="height: 200px"/></a>
                                <div class="caption">
                                    <h5 style="height: 40px;">${newProduct.getName()}</h5> 
                                    <input hidden="true" value="${newProduct.getID()}"/>
                                    <h4 style="text-align:center"><a class="btn" href="${pageContext.request.contextPath }/product/detail?id=${newProduct.getID()}"><i class="icon-zoom-in"></i></a> <a class="btn add-cart" href="javascript:">Thêm<i class="icon-shopping-cart"></i></a> <a class="btn btn-primary">${newProduct.getPrice()} VND</a></h4>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>	
            </div>
        </div>
    </div>
</div>
<script src="${url}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="${url}/js/effect.js" type="text/javascript"></script>