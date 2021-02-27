<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.userInfo"%>
<%@page import="model.product"%>
<%@page import="DAO.billDetailDAO"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value="/Menu/FinalProject/views/layout" var="url"></c:url>
<c:url value="/Menu/FinalProject/views/admin" var="url_link"></c:url>

    <!--<div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <h2>ADMIN DASHBOARD</h2>   
                </div>
            </div>              
             /. ROW  
            <hr />
            <div class="row">
                <div class="col-lg-12 ">
                    <div class="alert alert-info">
                        <strong>${sessionScope.account.getLastName()} </strong> You Have No pending Task For Today.
                    </div>
    
                </div>
            </div>
             /. ROW   
            <div class="row text-center pad-top">
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="${pageContext.request.contextPath}/admin/statistic" >
                            <i class="fa fa-circle-o-notch fa-5x"></i>
                            <i class="fa fa-bar-chart-o fa-5x"></i>
                            <h4>Statistic</h4>
                        </a>
                    </div>
    
    
                </div> 
    
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="${pageContext.request.contextPath}/admin/inventory" >
                            <i class="fa fa-shopping-cart fa-5x"></i>
                            <h4>Inventory</h4>
                        </a>
                    </div>
    
    
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="#" >
                            <i class="fa fa-lightbulb-o fa-5x"></i>
                            <h4>New Issues</h4>
                        </a>
                    </div>
    
    
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="${pageContext.request.contextPath}/admin/userinfo">
                            <i class="fa fa-users fa-5x"></i>
                            <h4>See Users</h4>
                        </a>
                    </div>
    
    
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="#" >
                            <i class="fa fa-key fa-5x"></i>
                            <h4>Admin </h4>
                        </a>
                    </div>
    
    
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="#" >
                            <i class="fa fa-edit fa-5x"></i>
                            <h4>Edit Contact</h4>
                        </a>
                    </div>
    
    
                </div>
            </div>
             /. ROW   
            <div class="row text-center pad-top">
    
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="#" >
                            <i class="fa fa-gears fa-5x"></i>
                            <h4>Setting</h4>
                        </a>
                    </div>
    
    
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="${pageContext.request.contextPath}/admin/staff" >
                            <i class="fa fa-table fa-5x"></i>
                            <h4>Managers</h4>
                        </a>
                    </div>
    
    
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="#" >
                            <i class="fa fa-wechat fa-5x"></i>
                            <h4>Live Talk</h4>
                        </a>
                    </div>
    
    
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="#" >
                            <i class="fa fa-bell-o fa-5x"></i>
                            <h4>Feed Back </h4>
                        </a>
                    </div>
    
    
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="${pageContext.request.contextPath}/welcome" >
                            <i class="fa fa-rocket fa-5x"></i>
                            <h4>Launch</h4>
                        </a>
                    </div>
    
    
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="${pageContext.request.contextPath}/admin/registerStaff" >
                            <i class="fa fa-user fa-5x"></i>
                            <h4>Register User</h4>
                        </a>
                    </div>
    
    
                </div> 
            </div>   
             /. ROW      
             /. ROW     
                    <div class="row">
                        <div class="col-lg-12 ">
                            <br/>
                            <div class="alert alert-danger">
                                <strong>Want More Icons Free ? </strong> Checkout fontawesome website and use any icon <a target="_blank" href="http://fortawesome.github.io/Font-Awesome/icons/">Click Here</a>.
                            </div>
            
                        </div>
                    </div>
             /. ROW   
        </div>
    </div>-->
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Admin Dashboard</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-6">
                <div class="panel panel-primary text-center no-boder bg-color-blue">
                    <div class="panel-body">
                        <a href="${pageContext.request.contextPath}/admin/statistic" style="color: white;"><i class="fa fa-bar-chart-o fa-5x"></i></a>
                        <h3>Statistic </h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-6">
                <div class="alert alert-info text-center">
                    <a href="${pageContext.request.contextPath}/admin/inventory"><i class="fa fa-shopping-cart fa-5x"></i></a>
                    <h3>Inventory</h3>
                </div>
            </div>
            <div class="col-md-4">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">Home</a>
                    </li>
                    <li class=""><a href="#profile" data-toggle="tab">Profile</a>
                    </li>
                    <li class=""><a href="#messages" data-toggle="tab">Messages</a>
                    </li>

                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="home">
                        <h4>Home Tab</h4>
                        <p>Group 12: Lập trình Web</p>
                        <p>Đồ án cuối kì</p>
                        <p>Đề tài: Văn phòng phẩm</p>
                    </div>
                    <div class="tab-pane fade" id="profile">
                        <h4>Profile Tab</h4>
                        <p>Phan Minh Hoàng: 18110286</p>
                        <p>Nguyễn Văn Tân - 18110361</p>
                        <p>Lê Đức Tân - 18110361</p>
                        <p>Mai Đăng Khoa - 18110306</p>
                    </div>
                    <div class="tab-pane fade" id="messages">
                        <h4>Messages Tab</h4>
                        <p >
                            Feed Back
                        </p>

                    </div>

                </div>
            </div>
            <!--                    Cần sửa nội dung-->

        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row" style="margin: 0 auto;">    
            <div class="">
                <h5>4 Sản phẩm bán chạy nhất</h5>
                <%
                    List<product> pro = DAO.productDAO.getListBestSell();
                    request.setAttribute("prod", pro);
                    int i = 0;
                    request.setAttribute("stt", i);
                %>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>ID Product</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                            </tr>
                            <c:forEach items="${prod}" var="product" begin="0" end="3">
                                <c:set value="${stt+1}" var="stt"/>
                                <c:set var="i" value="${product.getID()}"/>
                                <c:set var="quan" value="${billDetailDAO.getQuantityByIDProduct(i)}"/>
                            </thead>
                            <tbody>
                                <tr class="success">
                                    <td>${stt}</td>
                                    <td>${product.getID()}</td>
                                    <td>${product.getName()}</td>
                                    <td>${quan}</td>
                                    <td>${product.getPrice()}</td>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /. PAGE INNER  -->
