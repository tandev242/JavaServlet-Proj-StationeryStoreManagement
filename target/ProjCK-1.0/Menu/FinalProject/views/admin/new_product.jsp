<%-- 
    Document   : new_product
    Created on : Dec 22, 2020, 9:09:31 PM
    Author     : Minh Hoang
--%>
<%@page import="java.util.List"%>
<%@page import="model.category"%>
<%@page import="DAO.categoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value="/Menu/FinalProject/views/layout" var="url"></c:url>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Simple Responsive Admin</title>
            <!-- BOOTSTRAP STYLES-->
            <link href="${url}/admin/assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- FONTAWESOME STYLES-->
        <link href="${url}/admin/assets/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <!-- CUSTOM STYLES-->
        <link href="${url}/admin/assets/css/custom.css" rel="stylesheet" type="text/css"/>
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
        <!-- JQUERY SCRIPTS -->
        <script src="${url}/admin/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="${url}/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- CUSTOM SCRIPTS -->
        <script src="${url}/admin/assets/js/custom.js" type="text/javascript"></script>
        <!-- METISMENU SCRIPTS -->
        <script src="${url}/admin/assets/js/jquery.metisMenu.js"></script>
    </head>
    <style>
    </style>
    <body>
        <div id="wrapper">
            <%@include file="/Menu/FinalProject/views/layout/admin/header.jsp" %>
            <%@include file="/Menu/FinalProject/views/layout/admin/sidebar.jsp" %>
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2>NEW PRODUCT</h2>
                            <hr>
                        </div>
                    </div>
                    <% List<category> dropList = categoryDAO.getAll();
                        request.setAttribute("dropList", dropList);
                    %>
                    <form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/inventory">
                        <table>
                            <tr>
                                <td>Product name:</td>
                                <td><input type="text" name="pname" required style="width: 373px; margin-bottom: 7px;"/></td>
                            </tr>
                            <tr>
                                <td>Category:</td>
                                <td>
                                    <select name="cate" style="margin-bottom: 10px;">
                                        <c:forEach items="${dropList}" var="cate">
                                            <option value="${cate.getNameCategory()}">${cate.getNameCategory()}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Sub Category</td>
                                <td><input type="text" name="subcate" required style="width: 373px;"/></td>
                            </tr>
                            <tr>
                                <td>Description:</td>
                                <td><textarea name="description" rows="5" cols="50" style="margin-top: 10px;"></textarea></td>
                            </tr>
                            <tr>
                                <td>Price Buy:</td>
                                <td><input type="text" name="priceBuy" pattern="[1-9]{1}[0-9]{3,}" required style="margin-bottom: 10px;"/></td>
                            </tr>
                            <tr>
                                <td>Price Sell:</td>
                                <td><input type="text" name="price" pattern="[1-9]{1}[0-9]{3,}" required style="margin-bottom: 10px;"/></td>
                            </tr>
                            <tr>
                                <td>Promotion Price:</td>
                                <td><input type="text" name="promotion" pattern="[1-9]{1}[0-9]{3,}" required style="margin-bottom: 10px;"/></td>
                            </tr>
                            <tr>
                                <td>Quantity:</td>
                                <td><input type="text" name="quantity" pattern="[0-9]{1,}" required style="margin-bottom: 10px;"/></td>
                            </tr>
                            <tr>
                                <td>Image</td>
                                <td>
                                    <input type="file" id="fileUpload" accept="image/*" name="fileUpload" value="Upload Image"/>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <input type="submit" class="btn btn-success" value="ADD NEW PRODUCT"/>
                        <a href="${pageContext.request.contextPath}/admin/inventory" class="btn btn-danger">BACK</a>
                    </form>
                </div>
            </div>
            <%@include file="/Menu/FinalProject/views/layout/admin/footer.jsp" %>
        </div>
    </body>
</html>