<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:url value="/Menu/FinalProject/views/layout/user/assets/themes" var="url"></c:url>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Contact | Liên hệ với chúng tôi</title>
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
                <hr class="soften">
                <h1>Visit us</h1>
                <hr class="soften"/>	
                <div class="row">
                    <div class="span4">
                        <h4>Contact Details</h4>
                        <p>	D6 909 KTX khu B <br/> TP HCM
                            <br/><br/>
                            fb.com/tannguyen2k <br/>
                            Call 0929191413<br/>
                            Tel 0822040559<br/>
                            web:vppXinSo.com
                        </p>		
                    </div>

                    <div class="span4">
                        <h4>Opening Hours</h4>
                        <h5> Monday - Friday</h5>
                        <p>09:00am - 09:00pm<br/><br/></p>
                        <h5>Saturday</h5>
                        <p>09:00am - 07:00pm<br/><br/></p>
                        <h5>Sunday</h5>
                        <p>12:30pm - 06:00pm<br/><br/></p>
                    </div>
                    <div class="span4">
                        <h4>Email Us</h4>
                        <form class="form-horizontal">
                            <fieldset>
                                <div class="control-group">

                                    <input type="text" placeholder="name" class="input-xlarge"/>

                                </div>
                                <div class="control-group">

                                    <input type="text" placeholder="email" class="input-xlarge"/>

                                </div>
                                <div class="control-group">

                                    <input type="text" placeholder="subject" class="input-xlarge"/>

                                </div>
                                <div class="control-group">
                                    <textarea rows="3" id="textarea" class="input-xlarge"></textarea>

                                </div>

                                <button class="btn btn-large" type="submit">Send Messages</button>

                            </fieldset>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="span12">
                        <iframe style="width:100%; height:300; border: 0px" scrolling="no" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15673.934204046785!2d106.7718784!3d10.8507786!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa6c02de0a7c40d6c!2sSynary%20Coffee%20UTE!5e0!3m2!1svi!2s!4v1606212777649!5m2!1svi!2s"></iframe><br />
                        <small><a href="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15673.934204046785!2d106.7718784!3d10.8507786!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa6c02de0a7c40d6c!2sSynary%20Coffee%20UTE!5e0!3m2!1svi!2s!4v1606212777649!5m2!1svi!2s" style="color:#0000FF;text-align:left">View Larger Map</a></small>
                    </div>
                </div>
            </div>
        </div>
        <!-- MainBody End ============================= -->
        <!-- Footer ================================================================== -->
        <%@include file="/Menu/FinalProject/views/layout/user/footer.jsp" %>
    </body>
</html>