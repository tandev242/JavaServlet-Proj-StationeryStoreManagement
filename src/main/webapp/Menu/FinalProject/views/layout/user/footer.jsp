<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/Menu/FinalProject/views/layout/user/assets/themes" var="url"></c:url>
<c:url value="/Menu/FinalProject/views/user" var="url_user_jsp"></c:url>   
    <div  id="footerSection">
        <div class="container">
            <div class="row">
                <div class="span3">
                    <h5>TÀI KHOẢN</h5>
                    <a href="${url_user_jsp}/my_account.jsp">Tài khoản của bạn</a>
                <a href="${pageContext.request.contextPath }/myOrder">Lịch sử mua hàng</a>
            </div>
            <div class="span3">
                <h5>THÔNG TIN</h5>
                <a href="${url_user_jsp}/contact.jsp">Liên lạc</a>  
                <a href="${pageContext.request.contextPath }/register">Đăng kí</a>  
            </div>
            <div class="span3">
                <h5>SẢN PHẨM</h5>
                <a href="#">SẢN PHẨM MỚI</a> 
                <a href="#">BÁN CHẠY</a>  
            </div>
            <div id="socialMedia" class="span3 pull-right">
                <h5>MẠNG XÃ HỘI </h5>
                <a href="#"><img width="60" height="60" src="${url}/images/facebook.png" title="facebook" alt="facebook"/></a>
                <a href="#"><img width="60" height="60" src="${url}/images/twitter.png" title="twitter" alt="twitter"/></a>
                <a href="#"><img width="60" height="60" src="${url}/images/youtube.png" title="youtube" alt="youtube"/></a>
            </div> 
        </div>
        <p class="pull-right">&copy; HKTT VPP</p>
    </div>
    <!-- Placed at the end of the document so the pages load faster ============================================= -->
    <script src="${url}/js/jquery.js" type="text/javascript"></script>
    <script src="${url}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${url}/js/google-code-prettify/prettify.js"></script>

    <script src="${url}/js/bootshop.js"></script>
    <script src="${url}/js/jquery.lightbox-0.5.js"></script>