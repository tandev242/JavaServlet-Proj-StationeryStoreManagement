<%@page import="DAO.subCategoryDAO"%>
<%@page import="model.subCategory"%>
<%@page import="DAO.categoryDAO"%>
<%@page import="model.category"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:url value="/Menu/FinalProject/views/layout/user/assets/themes" var="url"></c:url>    
<c:url value="/Menu/FinalProject/views/user" var="url_user_jsp"></c:url>       
<%
    List<category> cat = categoryDAO.getAll();
    request.setAttribute("cat", cat);
%>
<c:choose>
    <c:when test="${sessionScope.cart.size() > 0}">
        <c:set var="SL" value="${sessionScope.cart.size()}"/>
    </c:when>
    <c:otherwise>
        <c:set var="SL" value="0"/>
    </c:otherwise>
</c:choose>
<div id="sidebar" class="span3">
    <div class="well well-small"><a id="myCart" href="${url_user_jsp}/product_summary.jsp"><img src="${url}/images/ico-cart.png" alt="cart"><span id="SL-sidebar">${SL}</span> Sản phẩm trong giỏ  </a></div>

    <ul id="sideManu" class="nav nav-tabs nav-stacked">
        <c:forEach items="${cat}" var="cate">
            <li class="subMenu open"><a> ${cate.getNameCategory()}</a>
                <ul>
                    <c:set var = "i"  value = "${cate.getID()}"/>
                    <c:forEach items="${subCategoryDAO.getAllByIDCategory(i)}" var="sub">
                        <li><a class="active" href="${pageContext.request.contextPath }/products?idSub=${sub.getID()}"><i class="icon-chevron-right"></i>${sub.getNameSubCategory()} </a></li>
                        </c:forEach>
                </ul>
            </li>
        </c:forEach>
    </ul>
    <br/>
    <div class="thumbnail">
        <img src="${url}/images/products/sgk3.jpg" alt="sgk3" style="height: 200px;width: 150px"/>
        <div class="caption">
            <h5>Sách giáo khoa lớp 3</h5>
        </div>
    </div><br/>
    <div class="thumbnail">
        <img src="${url}/images/products/mtd.jpg" title="Moi tinh dau" alt="Moi tinh dau " style="height: 200px;width: 150px">
        <div class="caption">
            <h5>Mối tình đầu</h5>
        </div>
    </div><br/>
    <div class="thumbnail">
        <img src="${url}/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
        <div class="caption">
            <h5>Payment Methods</h5>
        </div>
    </div>
</div>