<%-- 
Document   : statistic
Created on : Dec 21, 2020, 1:57:14 AM
Author     : Minh Hoang
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value="/Menu/FinalProject/views/layout" var="url"></c:url>
<c:url value="/Menu/FinalProject/views/admin" var="url_chart"></c:url>
<%@page import="DAO.categoryDAO"%>
<%@page import="DAO.billDetailDAO"%>
<%@page import="model.category"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Load the AJAX API-->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script type="text/javascript">
            var res;
            $(document).ready(function () {
                $.ajax({
                    url: "/ProjCK/admin/jsonQuantity",
                    type: "GET",
                    dataType: "JSON",
                    success: function (result) {
                        console.log(result);
                        res = result;
                        google.charts.load('current', {'packages': ['bar', 'corechart', 'table']});
                        google.charts.setOnLoadCallback(
                                function () {
                                    drawChart();
                                }
                        );
//                        google.setOnLoadCallback(drawVisualization);
                        console.log('Success!');
                    },
                    error: function (data) {
                        console.log(data.responseText);
                    }
                }).done(function () {
                    $.ajax({
                        url: "/ProjCK/admin/jsonAmountByMonth",
                        type: "GET",
                        dataType: "JSON",
                        success: function (result) {
                            console.log(result);
                            google.charts.load('current', {packages: ['corechart', 'line']});
                            google.charts.setOnLoadCallback(
                                    function () {
                                        drawAmountChart(result);
                                    }
                            );
                            console.log('Success!');
                        },
                        error: function (data) {
                            console.log(data.responseText);
                        }
                    })
                });

                function drawChart() {
                    var result = res;
                    console.log(res);
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Tên sản phẩm');
                    data.addColumn('number', 'Số lượng');
                    var dataArray = [];

                    $.each(result, function (i, obj) {
                        console.log('obj');
                        dataArray.push([obj.CateName, obj.Quantity]);
                    });
                    data.addRows(dataArray);
                    var options = {'title': 'Tổng sản phẩm bán ra theo loại',
                        'width': 1000,
                        'height': 500
                    };
                    var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }

                function drawAmountChart(result) {
                    console.log(result);
                    var data = new google.visualization.DataTable();
                    data.addColumn('number', 'Month');
                    data.addColumn('number', 'Amount');
                    var dataArray = [];

                    $.each(result, function (i, obj) {
                        console.log('obj');
                        dataArray.push([obj.Month, obj.Amount]);
                    });
                    data.addRows(dataArray);
                    var options = {'title': 'Tổng thu nhập theo tháng',
                        'width': 1000,
                        'height': 500,
                        hAxis: {
                            title: 'Month'
                        },
                        vAxis: {
                            title: 'Amount'
                        },
                    };
                    var chart = new google.visualization.LineChart(document.getElementById('chart_mount'));
                    chart.draw(data, options);
                }
            });
        </script>


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

    <body>
        <div id="wrapper">
            <%@include file="/Menu/FinalProject/views/layout/admin/header.jsp" %>
            <%@include file="/Menu/FinalProject/views/layout/admin/sidebar.jsp" %>
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2>STATISTIC</h2>   
                        </div>
                    </div>              
                    <!--Div that will hold the chart-->
                    <div id="chart_div"></div>
                    <div id="chart_mount"></div>
                </div>
            </div>
            <%@include file="/Menu/FinalProject/views/layout/admin/footer.jsp" %>  
        </div>
    </body>
</html>
