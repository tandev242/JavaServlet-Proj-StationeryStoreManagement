<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/Menu/FinalProject/views/layout/user/assets/themes" var="url"></c:url>
<c:url value="/Menu/FinalProject/views/user" var="url_user_jsp"></c:url>   
 <div id="carouselBlk">
    <div id="myCarousel" class="carousel slide">
        <div class="carousel-inner">
            <div class="item active">
                <div class="container">
                    <a href="${url_user_jsp}/register.jsp"><img style="width:100%" src="${url}/images/carousel/banner.png" alt="special offers"/></a>
                </div>
            </div>
            <div class="item">
                <div class="container">
                    <a href="${url_user_jsp}/register.jsp"><img style="width:100%" src="${url}/images/carousel/banner2.png" alt="special offers"/></a>
                </div>
            </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div> 
</div>
                    
                    
                    
                    